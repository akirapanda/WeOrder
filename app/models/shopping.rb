class Shopping < ActiveRecord::Base
  acts_as_paranoid
  
  has_many :shopping_items
  validates :customer_name,:customer_address,:mobile_phone,:presence => true
  validates :mobile_phone,:numericality =>true
  def calAmount(shopping)
    amount=0
    shopping.shopping_items.each do |item|
      amount=amount+item.amount
    end
    amount
  end
  
  def add_shopping_item(item)
    if item!=nil
      item.shopping_id=id
      shopping_items<<item
    end
  end
   
end
