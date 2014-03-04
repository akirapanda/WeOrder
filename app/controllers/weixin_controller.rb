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
	  message=WeixinMessage.new
	  message.from_user=params[:xml][:FromUserName]
	  message.msgType=params[:xml][:MsgType]
	  
		if params[:xml][:MsgType]=="event"
		  if params[:xml][:Event]=="subscribe"
		    event_key="subscribe"
		  else
		    event_key=params[:xml][:EventKey]
  		end
		  
		  message.msg=event_key
		  message.save
		  keywords=Keyword.where(:cate=>"event",:keywords=>event_key)
		  if keywords.size==0
  	    @order=orders[0]
  	    render "article",:format=>:xml
  	    return
  	  end
  	  logger.debug "keywords is #{keywords.size}" 
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

		end #if event
		
		
		
		
		if params[:xml][:MsgType]=="text"
		    event_key=params[:xml][:Content]
		    message.msg=event_key
		    message.save
  		  keywords=Keyword.where(:cate=>"text",:keywords=>event_key)
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
