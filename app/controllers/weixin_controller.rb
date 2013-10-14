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
		logger.debug "text:#{params[:xml]}"
		if params[:xml][:MsgType]=="event"
		  event_key=params[:xml][:EventKey]
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
		    event_key=params[:xml][:EventKey]
  		  keywords=Keyword.where(:cate=>"text",:keywords=>event_key)
  		  if keywords.size==0
    		  keywords=Keyword.where(:cate=>"text",:keywords=>"default")
    		  @content=keywords[0].reply_content
    	    render "echo",:format=>:xml
    	    return
    	  end
		    @content=keywords[0].reply_content
			  render "echo",:format=>:xml
			  return
		end
	end
	
	def check_weixin_legality
	        #logger.debug params[:timestamp]
		array =["testtoken",params[:timestamp],params[:nonce]].sort
		render :text => "Forbidden",:status => 403 if params[:signature]!=Digest::SHA1.hexdigest(array.join)
	end
end
