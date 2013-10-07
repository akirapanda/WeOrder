class AddCartIdIntoShoppingitems < ActiveRecord::Migration
  def self.up
    add_column :shopping_items, :cart_id, :integer    
  end

  def self.dowm
    remove_column :shopping_items , :cart_id
  end
end
