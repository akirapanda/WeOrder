class Order < ActiveRecord::Base
   acts_as_paranoid
   has_many :product_order_items ,:dependent => :destroy
   validates :name,:presence => true
   
end
