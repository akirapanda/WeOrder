class AddProductNameIntoShoppingItems < ActiveRecord::Migration
  def change
    add_column :shopping_items,:product_name,:string
    add_column :shopping_items,:product_unti,:string
  end
end
