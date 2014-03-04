class WeixinController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :check_weixin_legality
	def show
		render :text=> params[:echostr]
	end
	
	def index
		render :text=> params[:echostr]
	end
	
	def create
	  
	  msg_type = params[:xml][:MsgType]
    
    
    #save messages
  	case msg_type
		when 'text'
		  wx_msg = WeixinTextMessage.new
		  wx_msg.init_with_params(params)
		  wx_msg.save
  	when 'event'
  	  wx_msg = WeixinEventMessage.new
		  wx_msg.init_with_params(params)
		  wx_msg.save
  	end	  
  		  
  	#process message
  	
  	if msg_type == "event"
  	  keywords=Keyword.where(:cate=>"event",:keywords=>params[:xml][:Event])
  	  
		  if keywords.size==0
  	    @order=orders[0]
  	    render "article",:format=>:xml
  	    return
  	  end
  	  
  	  if keywords[0].reply_type=="text"
  	    @content=keywords[0].reply_content
  		  render "auto_text",:format=>:xml
  	    return 
  	  end
  	  
  	  if keywords[0].reply_type=="picture"
  	    order_id=keywords[0].reply_content.to_i
  	    @order=Order.find(order_id)
		    render "article",:format=>:xml
 	      return 	    
  	  end
  	end
  	
  	if msg_type == "text"
  	  keywords=Keyword.where(:cate=>"text",:keywords=>params[:xml][:Content].to_s.strip)
		  if keywords.size==0
  		  keywords=Keyword.where(:cate=>"text",:keywords=>"default")
  		  @content=keywords[0].reply_content
  	    render "echo",:format=>:xml
  	    return
  	  end
  	  
  	  if keywords[0].reply_type=="text"
  	    @content=keywords[0].reply_content
  		  render "auto_text",:format=>:xml
  	    return 
  	  end

  	  if keywords[0].reply_type=="picture"
  	    order_id=keywords[0].reply_content.to_i
  	    @order=Order.find(order_id)
		    render "article",:format=>:xml
 	      return 	    
  	  end
  	end
  	
	end
	
	def check_weixin_legality
		array =["testtoken",params[:timestamp],params[:nonce]].sort
		render :text => "Forbidden",:status => 403 if params[:signature]!=Digest::SHA1.hexdigest(array.join)
	end
end
