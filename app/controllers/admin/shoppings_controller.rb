class Admin::ShoppingsController < Admin::BaseController
  def index
    @shoppings = Shopping.order('created_at desc').paginate(:page => params[:page], :per_page => 20)
  end
  
  def show
    @shopping = Shopping.find(params[:id]) 
    @prev = @shopping.previous
    @next = @shopping.next
    
  end
  
  def destroy
    @shopping = Shopping.find(params[:id]) 
    @shopping.destroy
    respond_to do |format|
      format.html { redirect_to admin_shoppings_url  ,notice: "订单# #{@shopping.id}已被删除"}
    end
  end
  
  def edit
    @shopping = Shopping.find(params[:id]) 
    @products=Product.all
  end
  
  def create
    params.require(:shopping).permit!
    @shopping = Shopping.new(params[:shopping])
    
    @shopping.shopping_items.each do |item|
      product=Product.find(item.product_id)
      item.product_name=product.name
      item.product_unit=product.unit
      item.price=product.price
      item.amount=item.subAmount
    end
    @shopping.amount=@shopping.calAmount(@shopping)
    if @shopping.save
      flash[:notice] = "Successfully created project."
      redirect_to admin_shoppings_path
    else
      render :action => 'new'
    end
  end
  
  def update
    params.require(:shopping).permit!
    params[:shopping][:exist_shopping_item_attributes] ||= {}
    
    @shopping = Shopping.find(params[:id])
    respond_to do |format|
      if @shopping.update(params[:shopping])
        @shopping.amount=@shopping.calAmount(@shopping)
        @shopping.save
        format.html { redirect_to [:admin,@shopping], notice: 'Shopping was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  
  def new
    @shopping=Shopping.new
    @products=Product.all
  end
end
