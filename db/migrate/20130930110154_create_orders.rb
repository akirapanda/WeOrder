class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :content
      t.boolean :publish

      t.timestamps
    end
  end
end
