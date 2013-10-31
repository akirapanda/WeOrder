class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy,:photo,:buyer,:comments]
  before_filter :authenticate_user!,except: [:show,:comments,:buyer]
  
  def index
    @products = Product.all
  end

  def show
    @shopping_item=ShoppingItem.new
  end

  def new
    @product = Product.new
  end

  def edit
  end


  def create
    @product = Product.new(product_params)
    @product.user_id=current_user.id
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods/1
  # PATCH/PUT /goods/1.json
  def update
    respond_to do |format|
      if @product.update(good_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
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
    def set_product
      @product = Product.find(params[:id])
      @cart=current_cart
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:cover, :name, :content, :price, :unit,:body_html,:body, :weixin_url,:public)
    end
end