class CreateShoppings < ActiveRecord::Migration
  def change
    create_table :shoppings do |t|
      t.string :customer_name
      t.string :customer_address
      t.decimal :amount

      t.timestamps
    end
  end
end
