class SoftDelete < ActiveRecord::Migration
  def change
    add_column :goods, :deleted_at, :datetime
    add_column :orders, :deleted_at, :datetime
    add_column :shoppings, :deleted_at, :datetime    
  end
end
