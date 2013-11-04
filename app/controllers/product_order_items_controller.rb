class ProductOrderItemsController < ApplicationController
  before_action :set_goods_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /goods_items
  # GET /goods_items.json
  def index
    @goods_items = ProductOrderItem.all
  end

  # GET /goods_items/1
  # GET /goods_items/1.json
  def show
  end

  # GET /goods_items/new
  def new
    @goods_item = ProductOrderItem.new
  end

  # GET /goods_items/1/edit
  def edit
  end

  # POST /goods_items
  # POST /goods_items.json
  def create
    good_item_in_db=ProductOrderItem.where(:product_id=>params[:product_id],:order_id=>params[:order_id]).all
    if good_item_in_db.size==0
      @goods_item = ProductOrderItem.new()
      @goods_item.product_id=params[:product_id]
      @goods_item.order_id=params[:order_id]
    else
      respond_to do |format|
        format.html { redirect_to edit_admin_order_path(params[:order_id]), alert: '无法添加同样的商品！' }        
      end
      return
    end
    
    respond_to do |format|
      if @goods_item.save
        format.html { redirect_to edit_admin_order_path(params[:order_id]), notice: 'Goods item was successfully created.' }
        format.js
        format.json { render action: 'show', status: :created, location: @goods_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @goods_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods_items/1
  # PATCH/PUT /goods_items/1.json
  def update
    respond_to do |format|
      if @goods_item.update(goods_item_params)
        format.html { redirect_to @goods_item, notice: 'Goods item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @goods_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods_items/1
  # DELETE /goods_items/1.json
  def destroy
    @goods_item.destroy
    respond_to do |format|
      format.html { redirect_to edit_order_path(@goods_item.order_id) }
      format.js{@delete_item=@goods_item}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goods_item
      @goods_item = ProductOrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goods_item_params
      params.require(:product_order_item).permit(:product_id, :order_id)
    end
end
