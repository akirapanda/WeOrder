class ShoppingItemsController < ApplicationController
  before_action :set_shopping_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!,only:[:show,:edit,:update]

  # GET /shopping_items
  # GET /shopping_items.json
  def index
    @shopping_items = ShoppingItem.all
  end

  # GET /shopping_items/1
  # GET /shopping_items/1.json
  def show
  end

  # GET /shopping_items/new
  def new
    @shopping_item = ShoppingItem.new
  end

  # GET /shopping_items/1/edit
  def edit
  end

  # POST /shopping_items
  # POST /shopping_items.json
  def create
    @cart=current_cart
    count=params[:count].to_i
    @shopping_item=@cart.add_product(params[:product_id],count)
    respond_to do |format|
      if @shopping_item.save
        format.html { redirect_to @shopping_item.product, notice: '添加入购物车成功！' }
      else
        format.html { redirect_to @shopping_item.product, alert: '添加失败，系统异常，请联系管理员！' }

      end
    end
  end

  # PATCH/PUT /shopping_items/1
  # PATCH/PUT /shopping_items/1.json
  def update
    respond_to do |format|
      if @shopping_item.update(shopping_item_params)
        format.html { redirect_to @shopping_item, notice: 'Shopping item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shopping_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_items/1
  # DELETE /shopping_items/1.json
  def destroy
    @shopping_item.destroy
    respond_to do |format|
      format.html { redirect_to shopping_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_item
      @shopping_item = ShoppingItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_item_params
      params.require(:shopping_item).permit(:good_id, :shopping_id, :count, :amount,:product_id ,:count)
    end
end
