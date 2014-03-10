class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 20)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [:admin,@user], notice: '更新用户权限成功' }
      else
        format.html { render action: 'edit' }
      end
    end
    
  end
  
  private 
  
  def user_params
    params.require(:user).permit!
  end
end