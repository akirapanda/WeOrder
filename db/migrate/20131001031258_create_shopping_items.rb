class CreateShoppingItems < ActiveRecord::Migration
  def change
    create_table :shopping_items do |t|
      t.integer :good_id
      t.integer :shopping_id
      t.integer :count
      t.decimal :amount

      t.timestamps
    end
  end
end
