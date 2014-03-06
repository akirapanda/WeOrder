class Admin::ProductCatesController < Admin::BaseController
  before_action :set_product_cate, only: [:show, :edit, :update, :destroy]
  
  def index
    @product_cates = ProductCate.paginate(:page => params[:page], :per_page => 20)
  end
  
  def new
    @product_cate = ProductCate.new
  end
  
  def edit
    
  end
  
  def create
    @product_cate = ProductCate.new(product_cate_params)
    
    respond_to do |format|
      if @product_cate.save
        format.html { redirect_to admin_product_cates_path, notice: "创建分类成功" }
        format.json { render action: 'show', status: :created, location: @product_cate }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_cate.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @product_cate.update(product_cate_params)
        format.html { redirect_to admin_product_cates_path, notice:"更新分类成功" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_cate.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    
  end
  
  def destroy
    @product_cate.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_cates_path, notice: t('products.delete_success') }
      format.json { head :no_content }
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_cate
      @product_cate = ProductCate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_cate_params
      params.require(:product_cate).permit!
    end
end