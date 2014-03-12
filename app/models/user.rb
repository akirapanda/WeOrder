class User < ActiveRecord::Base
  has_many :products
  belongs_to :shop
  has_many :shops, through: :shop_user_items
  has_many :shop_user_items
  def admin?
    return self.admin
  end
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:token_authenticatable
end
