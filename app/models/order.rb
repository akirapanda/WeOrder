class Order < ActiveRecord::Base
   acts_as_paranoid
  
   has_many :goods_items
end
