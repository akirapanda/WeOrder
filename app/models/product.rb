require 'carrierwave/orm/activerecord'
class Product < ActiveRecord::Base
  acts_as_paranoid
  
  
  validates :name, :content, :price, :unit,:product_cate_id,:presence => true
  validates :price, :numericality =>{:greater_than_or_equal_to=>0.01}
  mount_uploader :cover,CoverUploader
  belongs_to :user
  has_many :photo,:dependent => :destroy
  has_many :product_order_items,:dependent => :destroy
  has_many :shopping_items
  belongs_to :product_cate
   
  def success_shopping_items
    self.shopping_items.where("shopping_id is not null")
  end
  
  def weixin_cover
    weixin_photo= self.photo.find_by_weixin_cover(true)
    if weixin_photo
      return weixin_photo
    else
      return nil
    end
    
  end
  
end
