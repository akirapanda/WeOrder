class GoodsCommentsController < ApplicationController
  before_filter :authenticate_user!,except: [:create]
  
  
  # POST /goods
  # POST /goods.json
  def create
    @comment = GoodsComment.new(comments_params)
    #allow anounce to make a message
    if current_user
      @comment.user_id=current_user.id 
    else
      @comment.user_id=1
    end
    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_good_url(@comment.good_id), notice: '添加评论成功!' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def comments_params
    params.require(:goods_comment).permit(:user_id, :good_id, :public,:body_html)
  end
end
