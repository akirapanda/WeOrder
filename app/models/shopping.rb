class Shopping < ActiveRecord::Base
  acts_as_paranoid
  BUILDS=["一公寓","二公寓","三公寓","四公寓","五公寓","三宿舍","四宿舍","五宿舍","七宿舍","八宿舍","九宿舍","十二宿舍","其他"]
  RECEIVE_TIMES=["11:30 - 13:00","16:30 - 18:00","20:15 - 21:00","20:45 - 21:30"]
  STATUS=["新订单","处理中","配送完毕"]
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
    #0~10:59  
    if (0..10) === Time.now.hour
      return RECEIVE_TIMES
    #11:00~15:59
    elsif (11..15) === Time.now.hour 
      return ["16:30 - 18:00","20:15 - 21:00","20:45 - 21:30","次日11:30 - 13:00"]
    #16:00 ~ 20:00
    elsif (16..19) === Time.now.hour
      return ["20:15 - 21:00","20:45 - 21:30","次日11:30 - 13:00","次日16:30 - 18:00"]
    #20:00 ~ 20:30
    elsif 20 === Time.now.hour && (0...30)===Time.now.min
      return ["20:45 - 21:30","次日11:30 - 13:00","次日16:30 - 18:00","次日20:15 - 21:00"]
    #20:30~0:00
    elsif  Time.now.hour >= 20 || (Time.now.hour === 19 && Time.now.min >=30)
      return ["次日11:30 - 13:00","次日16:30 - 18:00","次日20:15 - 21:00","次日20:45 - 21:30"]
    else
      return RECEIVE_TIMES
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
    "#{ self.customer_build}- #{self.customer_address}"
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
