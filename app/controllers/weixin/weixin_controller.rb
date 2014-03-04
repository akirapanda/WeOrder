class Weixin::WeixinController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :check_weixin_legality
	def show
		render :text=> params[:echostr]
	end
	
	def index
		render :text=> params[:echostr]
	end
	
	##
	## Do POST MESSAGE FROM WEIXIN PLATFORM
	##
	def create
    msg_type = params[:xml][:MsgType]
		
		
		case msg_type
		when 'text'
		  wx_msg = WeixinTextMessage.new
		  wx_msg.init_with_params(params)
		  wx_msg.save
		  
		  user  =  WeixinUser.where(:open_id => params[:xml][:FromUserName])
		  
		  if user.empty?
		    user = WeixinUser.new
		    user.open_id =  params[:xml][:FromUserName]
		    user.save
		  end
		  
		  render "echo",:format=>:xml
		else
		  puts 'else'
		end  
		
	end
	
	def check_weixin_legality
		array =["testtoken",params[:timestamp],params[:nonce]].sort
		render :text => "Forbidden",:status => 403 if params[:signature]!=Digest::SHA1.hexdigest(array.join)
	end
end