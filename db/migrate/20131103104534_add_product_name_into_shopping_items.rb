class AddProductNameIntoShoppingItems < ActiveRecord::Migration
  def change
    add_column :shopping_items,:product_unit,:string
    add_column :shopping_items,:product_name,:string
  end
end
