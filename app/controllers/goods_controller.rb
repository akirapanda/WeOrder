class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy,:photo,:buyer,:comments]
  before_filter :authenticate_user!,except: [:show,:comments,:buyer]
  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.all
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
    @shopping_item=ShoppingItem.new
  end

  # GET /goods/new
  def new
    @good = Good.new
  end

  # GET /goods/1/edit
  def edit
  end

  # POST /goods
  # POST /goods.json
  def create
    @good = Good.new(good_params)
    @good.user_id=current_user.id
    respond_to do |format|
      if @good.save
        format.html { redirect_to @good, notice: 'Good was successfully created.' }
        format.json { render action: 'show', status: :created, location: @good }
      else
        format.html { render action: 'new' }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods/1
  # PATCH/PUT /goods/1.json
  def update
    respond_to do |format|
      if @good.update(good_params)
        format.html { redirect_to @good, notice: 'Good was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @good.destroy
    respond_to do |format|
      format.html { redirect_to goods_url }
      format.json { head :no_content }
    end
  end

  def photo
    @photo=Photo.new
  end
  
  def comments
    
  end
  
  def buyer
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = Good.find(params[:id])
      @cart=current_cart
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def good_params
      params.require(:good).permit(:cover, :name, :content, :price, :unit,:body_html,:body, :weixin_url)
    end
end
