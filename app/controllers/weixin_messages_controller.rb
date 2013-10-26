class WeixinMessagesController < ApplicationController
  before_action :set_weixin_message, only: [:show, :edit, :update, :destroy]

  # GET /weixin_messages
  # GET /weixin_messages.json
  def index
    @weixin_messages = WeixinMessage.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /weixin_messages/1
  # GET /weixin_messages/1.json
  def show
  end

  # GET /weixin_messages/new
  def new
    @weixin_message = WeixinMessage.new
  end

  # GET /weixin_messages/1/edit
  def edit
  end

  # POST /weixin_messages
  # POST /weixin_messages.json
  def create
    @weixin_message = WeixinMessage.new(weixin_message_params)

    respond_to do |format|
      if @weixin_message.save
        format.html { redirect_to @weixin_message, notice: 'Weixin message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weixin_message }
      else
        format.html { render action: 'new' }
        format.json { render json: @weixin_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weixin_messages/1
  # PATCH/PUT /weixin_messages/1.json
  def update
    respond_to do |format|
      if @weixin_message.update(weixin_message_params)
        format.html { redirect_to @weixin_message, notice: 'Weixin message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weixin_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weixin_messages/1
  # DELETE /weixin_messages/1.json
  def destroy
    @weixin_message.destroy
    respond_to do |format|
      format.html { redirect_to weixin_messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weixin_message
      @weixin_message = WeixinMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weixin_message_params
      params.require(:weixin_message).permit(:from_user, :msgType, :msg)
    end
end
