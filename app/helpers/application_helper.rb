module ApplicationHelper
  
  
  MOBILE_USER_AGENTS =  'palm|blackberry|nokia|phone|midp|mobi|symbian|chtml|ericsson|minimo|' +
                        'audiovox|motorola|samsung|telit|upg1|windows ce|ucweb|astel|plucker|' +
                        'x320|x240|j2me|sgh|portable|sprint|docomo|kddi|softbank|android|mmp|' +
                        'pdxgw|netfront|xiino|vodafone|portalmmm|sagem|mot-|sie-|ipod|up\\.b|' +
                        'webos|amoi|novarra|cdm|alcatel|pocket|iphone|mobileexplorer|mobile'
  def mobile?
    agent_str = request.user_agent.to_s.downcase
    return false if agent_str =~ /ipad/
    agent_str =~ Regexp.new(MOBILE_USER_AGENTS)
  end
  
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart=Cart.create
    session[:cart_id]=cart.id
    cart
  end
  
  def carousel_tag(goods)
    if goods.photo.size==0
      return image_tag goods.cover_url(:large)
    else
    
    carousel_html="<div id=\"myCarousel\" class=\"carousel slide\">"
    carousel_html<<"<ol class=\"carousel-indicators\">"
    (0..goods.photo.size).each do |i|
      if i==0
       carousel_html<<"<li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\"></li>"
      else
        carousel_html<<"<li data-target=\"#myCarousel\" data-slide-to=\"#{i}\" class=\"active\"></li>"
      end
    end
    carousel_html<<"</ol>"
    
    items_html="<div class=\"carousel-inner\">"
    
    items_html<<"<div class=\"active item\">"
    items_html<<image_tag(goods.cover_url(:large))
    items_html<<"</div>"
    
    goods.photo.each do |photo|
      items_html<<"<div class=\"item\">"
      items_html<<image_tag(photo.image_url(:normal))
      items_html<<"</div>"
    end
    
    items_html<<"</div>"
    
    
    panel_html="<a class=\"carousel-control left\" href=\"#myCarousel\" data-slide=\"prev\">&lsaquo;</a>"
    panel_html<<"<a class=\"carousel-control right\" href=\"#myCarousel\" data-slide=\"next\">&rsaquo;</a>"
    return raw carousel_html+items_html+panel_html+"</div>"
  end
  end
end
