class User < ActiveRecord::Base
  
  def admin?
    if email=="p.chenliang@gmail.com"
      return true
    end
  end
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable         
end
