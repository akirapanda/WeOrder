class Photo < ActiveRecord::Base
  mount_uploader :image,PhotoUploader
  validates :image, :product_id,:presence => true
end
