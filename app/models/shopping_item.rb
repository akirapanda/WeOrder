class ShoppingItem < ActiveRecord::Base
  belongs_to :shopping
  belongs_to :good
end
