class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 20)
  end
end