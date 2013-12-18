class AddAreaToShopping < ActiveRecord::Migration
  def change
    add_column :shoppings,:school_area,:string
    add_column :products, :spec_note,:string
    add_column :products, :order_point, :integer
    add_column :products, :spec_flag,:boolean,:default=>false
    add_column :shoppings, :channel,:string
    
    create_table :weixin_customers do |t|
      t.string :open_id
      t.string :name
      t.string :note
      t.timestamps
    end
    add_index  :weixin_customers, :open_id, :unique => true
  end
end
