require 'carrierwave/orm/activerecord'
class Good < ActiveRecord::Base
  mount_uploader :cover,CoverUploader
end
