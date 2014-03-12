class Shop < ActiveRecord::Base
  has_many :shop_user_items
  has_many :users, through: :shop_user_items
  has_many :products
  has_many :product_cates, through: :products, :uniq => true
  
  
  validates :name, :short_name,:presence => true
  
end