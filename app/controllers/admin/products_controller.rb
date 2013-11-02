class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 20)
    respond_to do |format| 
      format.html {}
      format.csv { send_data(Product.all.to_csv(:only => [:id,:name,:price]))} 
    end
  end
end