class WeixinEventMessage < WeixinMessage
  def init_with_params(params)
    self.from_user = params[:xml][:FromUserName]
    self.to_user = params[:xml][:ToUserName]
    self.create_time = Time.at(params[:xml][:CreateTime].to_i)
    self.event =  params[:xml][:Event]
    self.msg_id = params[:xml][:MsgId]
    self.text_content =  params[:xml][:EventKey]
    
    
  end
end