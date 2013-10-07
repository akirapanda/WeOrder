class AddRemarkIntoShopping < ActiveRecord::Migration
  def self.up
    add_column :shoppings, :remark, :string    
  end

  def self.dowm
    remove_column :shoppings , :remark
  end
end
