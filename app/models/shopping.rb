class Shopping < ActiveRecord::Base
  acts_as_paranoid
  BUILDS=["一公寓","二公寓","三公寓","四公寓","五公寓","三宿舍","四宿舍","五宿舍","七宿舍","八宿舍","九宿舍","十二宿舍","其他"]
  RECEIVE_TIMES=["11:30 - 12:30","16:30 - 18:00","20:00 - 21:30"]
  
  
  def self.available_time
    #0~10:59  
    if (0..10) === Time.now.hour
      return RECEIVE_TIMES

    #11:00~15:59
    elsif (11..15) === Time.now.hour 
      return ["16:30 - 18:00","20:00 - 21:30","次日11:30 - 12:30"]
    #16:00 ~ 19:30
    elsif (16..18) === Time.now.hour || (Time.now.hour === 19 && Time.now.min <30)
      return ["20:00 - 21:30","次日11:30 - 12:30","次日16:30 - 18:00"]
      #19:30~0:00
    elsif  Time.now.hour >= 20 || (Time.now.hour === 19 && Time.now.min >=30)
      return ["次日11:30 - 12:30","次日16:30 - 18:00","次日20:00 - 21:30"]
    else
      return RECEIVE_TIMES
    end 
    
  end
  
  has_many :shopping_items,:dependent => :destroy
  validates :receive_time,:customer_build,:mobile_phone,:presence => true
  validates :mobile_phone,:numericality =>true
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
   
end
