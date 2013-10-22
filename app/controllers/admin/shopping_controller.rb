class Admin::ShoppingController < ApplicationController
    layout "admin"
    
    def index
      @shoppings = Shopping.all
    end
    
    
    
end
