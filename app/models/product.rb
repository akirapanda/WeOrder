require 'carrierwave/orm/activerecord'
class Product < ActiveRecord::Base
  acts_as_paranoid
  
  
  validates :name, :content, :price, :unit,:presence => true
  validates :price, :numericality =>{:greater_than_or_equal_to=>0.01}
  mount_uploader :cover,CoverUploader
  belongs_to :user
  has_many :photo,:dependent => :destroy
  has_many :product_shopping_items,:dependent => :destroy
  has_many :shopping_items
  
  scope :publiced, where(:public=>true)
end
