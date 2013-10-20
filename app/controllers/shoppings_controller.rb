class ShoppingsController < ApplicationController
  before_action :set_shopping, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!,except:[:create,:new,:show]
  
  authorize_resource
  
  
  # GET /shoppings
  # GET /shoppings.json
  def index
    @shoppings = Shopping.all
  end

  # GET /shoppings/1
  # GET /shoppings/1.json
  def show
  end

  # GET /shoppings/new
  def new
    @cart=current_cart
    
    @shopping = Shopping.new
    @cart.shopping_items.each do |item|
      @shopping .shopping_items<<item
    end
  end

  # GET /shoppings/1/edit
  def edit
  end

  # POST /shoppings
  # POST /shoppings.json
  def create
    
    @shopping = Shopping.new(shopping_params)
    params.require(:shopping).permit(:goods,:order_id)
    goods=params[:goods]
    order_id=params[:order_id]
    ##how to process a complex form like this
    
    
    
    
    goods.each do |goods|
         goods_id=goods[0]
         goods_count=goods[1][:count].to_i
         shopping_item=ShoppingItem.new
         shopping_item=shopping_item.build_by_product(goods_id,goods_count)
         @shopping.add_shopping_item(shopping_item)
    end
       
       
    if  @shopping.shopping_items.size ==0
        respond_to do |format|
            format.html { redirect_to list_order_path(order_id), alert: '您的订单中没有任何商品哟' }
          end 
        return
    end
         
    @shopping.amount=@shopping.calAmount(@shopping)
    if current_user
    @shopping.user_id=current_user.id
    end
  
    respond_to do |format|
      if @shopping.save
        Cart.destroy(session[:cart_id]) unless session[:cart_id]==nil
        session[:cart_id]=nil
        @shopping.shopping_items.each do |item|
           item.save
         end
        format.html { redirect_to @shopping, notice: 'Shopping was successfully created.' }
      else
        format.html { 
          if order_id
            redirect_to list_order_path(order_id), alert: '订单内容有误，请检查后重新提交。' 
          else
            @cart=current_cart
            
            render action: 'new'
          end
        }
      end
    end
    
  end

  # PATCH/PUT /shoppings/1
  # PATCH/PUT /shoppings/1.json
  def update
    respond_to do |format|
      if @shopping.update(shopping_params)
        format.html { redirect_to @shopping, notice: 'Shopping was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoppings/1
  # DELETE /shoppings/1.json
  def destroy
    @shopping.destroy
    respond_to do |format|
      format.html { redirect_to shoppings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping
      @shopping = Shopping.find(params[:id])
      @cart=current_cart
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_params
      params.require(:shopping).permit(:customer_name, :customer_address, :amount,:home_phone,:mobile_phone,:remark)
    end
end
