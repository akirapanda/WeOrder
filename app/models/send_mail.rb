class SendMail < ActiveRecord::Base
  
  def self.build_mail_by_shopping(shopping)
    content="#{shopping.created_at}有客户#{shopping.customer_name}购买了#{shopping.amount}元的产品"
    content=content+"<br/>电话:#{shopping.mobile_phone}"
    
    content=content+"<br/>地址:#{shopping.customer_address}"
    content=content+"<br/>备注信息为:#{shopping.remark}"
    content=content+"<h2>订单具体信息</h2>"
    
    content=content+"<table class='table'><thead><th>商品名称</th><th>订购数量</th><th>单价</th><th>小计</th></thead>"
    
    shopping.shopping_items.each do |item|
      content=content+"<tr><td>#{item.product.name}</td><td>#{item.count} / #{item.product.unit}</td><td>#{item.product.price}元 / #{item.product.unit}</td><td>#{item.amount}元</td></tr>"
    end
    mail = SendMail.new
    mail.content = content
    mail.receivers = "525483886@qq.com"
    #mail.receivers = "18071400@qq.com"
    mail.done = false
    mail.save
  end
end
