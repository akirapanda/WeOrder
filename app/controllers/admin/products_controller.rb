class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy,:photo,:buyer,:comments]
  
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 20)
    respond_to do |format| 
      format.html {}
      format.csv { send_data(Product.all.to_csv(:only => [:id,:name,:price,:unit]))} 
    end
  end
  
  def new
    @product = Product.new
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