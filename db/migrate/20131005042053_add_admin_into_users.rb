class AddAdminIntoUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean
    
  end
  
  def self.dowm
    remove_column :users , :admin
  end
end
