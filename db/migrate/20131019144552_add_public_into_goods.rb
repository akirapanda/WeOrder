class AddPublicIntoGoods < ActiveRecord::Migration
  def self.up
    add_column :goods, :public, :boolean,:default=>true
  end
  
  
  def self.down
    remove_column :goods, :public
  end
end
