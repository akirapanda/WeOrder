class AddStatusWithShopping < ActiveRecord::Migration
  def change
    add_column :shoppings,:customer_build,:string
    add_column :shoppings,:status ,:string
    add_column :shoppings,:follower_id, :integer
    add_column :shoppings,:receive_time, :string
    
  end
end
