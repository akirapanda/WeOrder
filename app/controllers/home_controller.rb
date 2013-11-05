class HomeController < ApplicationController
  layout 'shop',:only=>[:test]
  def index
    @cart=current_cart
  end
  
  
  def test
    @cart=current_cart    
  end
end
