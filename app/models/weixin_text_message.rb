class WeixinTextMessage < WeixinMessage
  def init_with_params(params)
    self.from_user = params[:xml][:FromUserName]
    self.to_user = params[:xml][:ToUserName]
    self.create_time = Time.at(params[:xml][:CreateTime].to_i)
    self.text_content =  params[:xml][:Content]
    self.msg_id = params[:xml][:MsgId]
  end

end