class Order < ActiveRecord::Base
   has_many :goods_items
end
