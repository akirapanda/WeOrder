class Shopping < ActiveRecord::Base
  acts_as_paranoid
  #BUILDS=["一食堂票务亭","一公寓","二公寓","三公寓","四公寓","五公寓","三宿舍","四宿舍","五宿舍","六宿舍","七宿舍","八宿舍","九宿舍","十二宿舍","南校区","其他"]
  BUILDS=["一食堂票务亭"]
  RECEIVE_TIMES= ["12:00","18:00","20:30","次日12:15 - 19:50"]
  STATUS=["新订单","处理中","配送完毕"]
  SCHOOL_AREAS = ["南校区","北校区"]
  has_many :shopping_items,:dependent => :destroy
  validates :receive_time,:customer_build,:mobile_phone,:presence => true
  validates :mobile_phone,:numericality =>true
  after_update :save_shopping_items  
  before_create :set_default
  
  def self.next_batch
    Shopping.where("status <> ?" ,"配送完毕").order("created_at asc").order("receive_time desc")
  end
  
  
  def to_complete
    self.status="配送完毕"
  end
  
  def to_process
    self.status="处理中"
  end
  
  def self.available_time
    #0~11:00  
    if (0..11) === Time.now.hour  && (0...30)===Time.now.min 
      return RECEIVE_TIMES
    #11:00~17:15
    elsif (11 === Time.now.hour && (30..59) == Time.now.min) || ( (12...17) === Time.now.hour)
      return ["18:00","20:30","次日12:00"]
    #17:15 ~ 0:00
   elsif ((17..20) === Time.now.hour)
      return ["20:30","次日12:00","次日18:00"]
   else
      return ["次日12:00","次日18:00","次日20:30"]
    end
  end
  

  
  def new_shopping_item_attributes=(item_attributes)
    item_attributes.each do |attributes|
        shopping_items.build(attributes)
    end
  end
  
  def exist_shopping_item_attributes=(item_attributes)
    
    shopping_items.reject(&:new_record?).each do |item|
      attributes = item_attributes[item.id.to_s]      
      if attributes        
        item.attributes = attributes
      else
        shopping_items.delete(item)
      end
    end
  end
  
  def calAmount(shopping)
    amount=0
    shopping.shopping_items.each do |item|
      amount=amount+item.amount
    end
    amount
  end
  
  def  detail_address
    "#{self.customer_build}- #{self.customer_address}"
  end
  
  def add_shopping_item(item)
    if item!=nil
      item.shopping_id=id
      shopping_items<<item
    end
  end
   
  def set_default
     self.status="新订单"
  end
  
  def save_shopping_items
    shopping_items.each do |item|
        item.amount=item.subAmount
        item.save
    end
  end
end
