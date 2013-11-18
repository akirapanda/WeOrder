class Api::V1::ProductsController  < ApplicationController
  before_filter :authenticate_user!  
  
  respond_to :json 
  
  def index
    @prodoucts=Product.all.limit(10)
     render :status=>200, :json=> @prodoucts
  end

end