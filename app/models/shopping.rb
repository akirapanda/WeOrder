class Shopping < ActiveRecord::Base
  has_many :shopping_items
  
  def calAmount(shopping)
    amount=0
    shopping.shopping_items.each do |item|
      amount=amount+item.amount
    end
    amount
  end
  
end
