class ShoppingItem < ActiveRecord::Base
  belongs_to :shopping
  belongs_to :good
  belongs_to :cart
  
  def build_by_product(good_id,count)
    if count > 0 
       good= Good.find(good_id)
       shopping_item=ShoppingItem.new
       shopping_item.good_id=good_id
       shopping_item.count=count
       shopping_item.amount=good.price*shopping_item.count
       shopping_item
    end
  end
  
end
