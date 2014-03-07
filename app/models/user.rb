class User < ActiveRecord::Base
  has_many :products
  def admin?
    if email=="p.chenliang@gmail.com" || email=="525483886@qq.com" || email== "xoyljlj@126.com" ||
       email=="670390177@qq.com" || email=="630131222@qq.com" || email == "419717659@qq.com" || 
       email == "839483985@qq.com" || email == "dxnycxg@hotmail.com" || email =="1012988215@qq.com"
      return true
    end
  end
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:token_authenticatable
end
