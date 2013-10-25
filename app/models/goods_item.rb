class GoodsItem < ActiveRecord::Base
  belongs_to :good
  belongs_to :order 
end
