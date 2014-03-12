class Shop < ActiveRecord::Base
  has_many :shop_user_items
  has_many :users, through: :shop_user_items
  
  validates :name, :short_name,:presence => true
  
end