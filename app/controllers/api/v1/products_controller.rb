class Api::V1::ProductsController  < ApplicationController
  before_filter :authenticate!  
  
  respond_to :json 
  
  def index
    @prodoucts=Product.all.limit(10)
     render :status=>200, :json=> @prodoucts
  end



  def current_user
    token = params[:auth_token] 
    @current_user ||= User.where(:authentication_token => token).first
  end

  def authenticate!
     render :status=>400,
            :json=>{:message=>"Nedd login."} unless current_user
  end
  
end