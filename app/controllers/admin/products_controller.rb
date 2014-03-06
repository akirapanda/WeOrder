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
    @product_cates = ProductCate.all
  end
  
  
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: t('products.delete_success') }
      format.json { head :no_content }
    end
  end
  
  
  def edit
    @product_cates = ProductCate.all
    
  end
  
  
  def show
    
  end
  
  def photo
    @photo=Photo.new
  end
  
  def create
    @product = Product.new(product_params)
    @product.user_id=current_user.id
    respond_to do |format|
      if @product.save
        format.html { redirect_to [:admin,@product], notice: t('products.create_success') }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [:admin,@product], notice: t('products.update_success') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      @cart=current_cart
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:cover, :name, :content, :price, :unit,:body_html,:body, :weixin_url,:public,:is_recommend,:is_onsale)
    end
end