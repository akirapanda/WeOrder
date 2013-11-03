class AddPriceIntoShoppingItems < ActiveRecord::Migration
  def change
    add_column :shopping_items,:price,:deciaml, :precision => 10, :scale => 2  ,:default=>0
    add_column :users,:role ,:string
    add_column :shoppings,:actual_amount,:deciaml,:precision => 10, :scale => 2  ,:default=>0
  end
end
