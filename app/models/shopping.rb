class Shopping < ActiveRecord::Base
  has_many :shopping_items
  validates :customer_name,:customer_address,:presence => true
  validates :home_phone,:mobile_phone,:numericality =>true
  def calAmount(shopping)
    amount=0
    shopping.shopping_items.each do |item|
      amount=amount+item.amount
    end
    amount
  end
  
end
