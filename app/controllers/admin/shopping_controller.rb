class Admin::ShoppingController < BaseController

    
    def index
      @shoppings = Shopping.all
    end
    
    
    
end
