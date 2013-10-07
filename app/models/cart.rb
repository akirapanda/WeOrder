class Cart < ActiveRecord::Base
  has_many :shopping_items
  
  
  def add_product(product_id)
    current_shopping_item= shopping_items.find_by_good_id(product_id)
    if current_shopping_item
      current_shopping_item.count+=1
    else
      current_shopping_item= shopping_items.build(:good_id => product_id,:cart_id=>id)  
      current_shopping_item.count=1
    end
    current_shopping_item.amount=current_shopping_item.subAmount
    current_shopping_item
  end  
end
