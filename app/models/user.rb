class User < ActiveRecord::Base
  has_many :goods
  def admin?
    if email=="p.chenliang@gmail.com" || email=="525483886@qq.com"
      return true
    end
  end
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable         
end
