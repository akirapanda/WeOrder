require 'carrierwave/orm/activerecord'
class Good < ActiveRecord::Base
  validates :name, :content, :price, :unit,:presence => true
  validates :price, :numericality =>{:greater_than_or_equal_to=>0.01}
  mount_uploader :cover,CoverUploader
end
