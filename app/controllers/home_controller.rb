class HomeController < ApplicationController
  layout 'shop',:only=>[:test,:about]
  def index
    @cart=current_cart
  end
  
  
  def test
    @cart=current_cart    
    @q=Product.search(params[:q])
  end
  
  
  def about
    
  end
  
end
