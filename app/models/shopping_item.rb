class ShoppingItem < ActiveRecord::Base
  belongs_to :shopping
  belongs_to :product
  belongs_to :cart
  def subAmount
    product.price*count
  end
  
  def build_by_product(product_id,count)
    if count > 0 
       product= Product.find(product_id)
       shopping_item=ShoppingItem.new
       shopping_item.product_id=product_id
       
       shopping_item.price=product.price
       shopping_item.product_name=product.name
       shopping_item.product_unit=product.unit
       shopping_item.count=count
       shopping_item.amount=product.price*shopping_item.count
       
       shopping_item
    end
  end
  
end
