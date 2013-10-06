class AddUseridIntoShopping < ActiveRecord::Migration
    def self.up
      add_column :shoppings, :user_id, :integer
    end

    def self.dowm
      remove_column :shoppings , :user_id
    end
end
