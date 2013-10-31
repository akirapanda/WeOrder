class AddStatusWithProduct < ActiveRecord::Migration
  def change
    rename_table :goods, :products
    rename_table :goods_items, :product_order_items
    rename_column :product_order_items, :good_id,:product_id
    rename_column :shopping_items, :good_id,:product_id
    
    
  end
end
