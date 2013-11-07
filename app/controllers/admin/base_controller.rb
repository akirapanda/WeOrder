class Admin::BaseController< ApplicationController
  before_filter :authenticate_user!,:admin?
  layout 'admin'
  
  
  def admin?
    if current_user.admin?
      return true
    else
      redirect_to root_path
    end
  end
end