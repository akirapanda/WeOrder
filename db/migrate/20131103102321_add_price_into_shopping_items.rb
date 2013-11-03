class AddPriceIntoShoppingItems < ActiveRecord::Migration
  def change
    add_column :shopping_items,:price,:decimal, :precision => 10, :scale => 2  ,:default=>0
    add_column :users,:role ,:string
    add_column :shoppings,:actual_amount,:decimal,:precision => 10, :scale => 2  ,:default=>0
  end
end


update shopping_items s set price = (select price from products p where s.product_id=p.id)