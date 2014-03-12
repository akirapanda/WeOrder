class AddShopUserItem < ActiveRecord::Migration
  def change
    create_table "shop_user_items" do |t|
      t.integer :shop_id
      t.integer :user_id
      t.integer :level
      t.timestamps
    end
    add_column :shops, :app_id,:string
    add_column :shops, :app_token,:string
    
    add_column :products, :shop_id,:integer
    add_column :shoppings, :transfer_fee,:decimal,:default=>0, :precision => 10, :scale => 2  
    add_column :shoppings, :shop_id,:integer
    
    add_column :weixin_messages, :shop_id,:integer
    add_column :users,:shop_id,:integer
  end
end
