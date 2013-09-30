class GoodsItemsController < ApplicationController
  before_action :set_goods_item, only: [:show, :edit, :update, :destroy]

  # GET /goods_items
  # GET /goods_items.json
  def index
    @goods_items = GoodsItem.all
  end

  # GET /goods_items/1
  # GET /goods_items/1.json
  def show
  end

  # GET /goods_items/new
  def new
    @goods_item = GoodsItem.new
  end

  # GET /goods_items/1/edit
  def edit
  end

  # POST /goods_items
  # POST /goods_items.json
  def create
    @goods_item = GoodsItem.new()
    @goods_item.good_id=params[:good_id]
    @goods_item.order_id=params[:order_id]
    respond_to do |format|
      if @goods_item.save
        format.html { redirect_to @goods_item, notice: 'Goods item was successfully created.' }
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
      format.html { redirect_to goods_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goods_item
      @goods_item = GoodsItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goods_item_params
      params.require(:goods_item).permit(:good_id, :order_id)
    end
end
