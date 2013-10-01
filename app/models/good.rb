require 'carrierwave/orm/activerecord'
class Good < ActiveRecord::Base
  validates :name, :content, :price, :unit,:presence => true
  
  mount_uploader :cover,CoverUploader
end
