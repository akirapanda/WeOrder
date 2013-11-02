class Admin::ShoppingsController < Admin::AdminBaseController
  def index
    @shoppings = Shopping.order('created_at desc').paginate(:page => params[:page], :per_page => 20)
  end
  
  def show
    @shopping = Shopping.find(params[:id]) 
  end
  
  def destroy
    @shopping = Shopping.find(params[:id]) 
    @shopping.destroy
    respond_to do |format|
      format.html { redirect_to admin_shoppings_url  ,notice: "订单# #{@shopping.id}已被删除"}
    end
  end
end
