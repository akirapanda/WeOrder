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
		  orders=Order.all
	    @order=orders[0]
	    render "article",:format=>:xml
	    return 
		end
		
		
		
		
		if params[:xml][:MsgType]=="text"
		  if params[:xml][:Content]=="pic"
		    orders=Order.all
		    @order=orders[0]
		    render "article",:format=>:xml
		  else
		    orders=Order.all
		    @content=":
		    "
		    orders.each do |order|
		      url=list_order_url(order)
		      @content=@content+"<a href=\"#{url}\"> #{order.name}</a>"+'
		      '
		    end
		    logger.debug "reply:#{@content}"
			  render "echo",:format=>:xml
		  end
		end
	end
	
	def check_weixin_legality
	        #logger.debug params[:timestamp]
		array =["testtoken",params[:timestamp],params[:nonce]].sort
		render :text => "Forbidden",:status => 403 if params[:signature]!=Digest::SHA1.hexdigest(array.join)
	end
end