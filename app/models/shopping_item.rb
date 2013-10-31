class ShoppingItem < ActiveRecord::Base
  belongs_to :shopping
  belongs_to :product
  belongs_to :cart
  
  def subAmount
    product.price*count
  end
  
  def build_by_product(good_id,count)
    if count > 0 
       product= Product.find(good_id)
       shopping_item=ShoppingItem.new
       shopping_item.product_id=good_id
       shopping_item.count=count
       shopping_item.amount=product.price*shopping_item.count
       shopping_item
    end
  end
  
end
