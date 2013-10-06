class UsersController < ApplicationController
   def show
   end
   
   def index
   end
     
   def shopping
     @shoppings=Shopping.where(:user_id=>current_user.id)
   end
end
