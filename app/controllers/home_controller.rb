class HomeController < ApplicationController
  layout 'shop'
  def index
    @cart=current_cart
    @shop = Shop.find(1)
  end
  
  
  def test
    @cart=current_cart    
    @q=Product.search(params[:q])
    @shop = Shop.find(1)
    
  end
  
  
  def about
    
  end
  
end
