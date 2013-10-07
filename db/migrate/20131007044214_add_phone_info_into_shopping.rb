class AddPhoneInfoIntoShopping < ActiveRecord::Migration
  def self.up
    add_column :shoppings, :home_phone, :string
    add_column :shoppings, :mobile_phone, :string
    
  end

  def self.dowm
    remove_column :shoppings , :home_phone
    remove_column :shoppings , :mobile_phone
  end
end
