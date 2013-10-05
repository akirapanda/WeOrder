class AddUserIntoGoods < ActiveRecord::Migration
  def self.up
    add_column :goods, :user_id, :integer
    add_column :goods, :buy_count, :integer
    add_column :goods, :like_count, :integer
  end
  
  def self.dowm
    remove_column :goods , :user_id
    remove_column :goods , :buy_count
    remove_column :goods , :like_count
  end
end
