class Cart < ActiveRecord::Base
  has_many :shopping_items
  
  
  def add_product(product_id,count)
    if count<1
      return
    end
    current_shopping_item= shopping_items.find_by_product_id(product_id)
    if current_shopping_item
      current_shopping_item.count+=count
    else
      current_shopping_item= ShoppingItem.init_by_product_id(product_id)
      current_shopping_item.cart_id=self.id
      current_shopping_item.count=count
      shopping_items<<current_shopping_item
    end
    current_shopping_item.amount=current_shopping_item.subAmount
    current_shopping_item
  end  
end
