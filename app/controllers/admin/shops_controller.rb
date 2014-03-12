class Admin::ShopsController < Admin::BaseController
  def index
    @shops = Shop.paginate(:page => params[:page], :per_page => 20)
  end
  
  
  def new
    @company = Company.new
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def show
    @shop = Shop.find(params[:id])
  end
  
  
  
  def update
    @company = Company.find(params[:id])
    
     if @company.update(company_param)
       redirect_to setting_companies_path, notice: '更新公司信息成功!' 
    else
      render action: 'edit' 
    end
  end
  
  def create
    @company = Company.new(company_param)
    if @company.save
      redirect_to setting_companies_path, notice: '新建公司信息成功' 
    end
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to setting_companies_path  notice: "删除公司信息记录成功"
  end
  
  def add_user
    @shop = Shop.find(params[:id])
    @user = User.all
  end
  
  def update_user
    @shop = Shop.find(params[:id])
    if params[:exist].present?
      user_items = @shop.shop_user_items
      user_items.each do |user_item|
       if  not params[:exist].any?{|exist_user_id| exist_user_id == user_item.user_id.to_s}
         user_item.delete
       end
      end
    else
       @shop.shop_user_items.delete_all
    end
    
    if params[:new].present?
      params[:new].each do |user_id|
        shop_user_item = ShopUserItem.new
        shop_user_item.user_id = user_id
        shop_user_item.shop_id = params[:id]
        shop_user_item.save
      end
    end
    redirect_to add_user_admin_shop_path(@shop)
  end
  
  def change_shop
    @user =  User.find(params[:user_id])
    @shops = @user.shops
  end
  
  def update_shop
    @user = User.find(params[:user_id])
    @shop = Shop.find(params[:shop_id])
    @user.shop= @shop
    @user.save
    redirect_to change_shop_admin_shops_path(:user_id=>@user),:notice=>"切换操作商铺成功！"
  end
  
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_param
      params.require(:shop).permit!
    end
  
  

end