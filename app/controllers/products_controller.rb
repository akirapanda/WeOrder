class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy,:photo,:buyer,:comments]
  layout 'shop'
  def index
    @cart=current_cart
    @products=Product.where(:is_onsale=>true).where(:public=>true)
  end

  def show
    @shopping_item=ShoppingItem.new
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
