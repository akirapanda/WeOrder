class Photo < ActiveRecord::Base
  mount_uploader :image,PhotoUploader
  validates :image, :good_id,:presence => true
end
