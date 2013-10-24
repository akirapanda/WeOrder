class Admin::ShoppingController < ApplicationController

    
    def index
      @shoppings = Shopping.all
    end
    
    
    
end
