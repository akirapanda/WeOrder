class Shop < ActiveRecord::Base
  has_many :shop_user_items
  has_many :users, through: :shop_user_items
end