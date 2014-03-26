namespace :admin do
  desc "TODO"
  task sendmail: :environment do
    require 'mail'

    Mail.defaults do
      delivery_method :smtp, {
        :address => 'smtp.gmail.com',
        :port => '587',
        :user_name => 'p.chenliang@gmail.com',
        :password => 'Xiaoke1021',
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    end

    mails=SendMail.where(:done=>false)
    puts "#{Time.now} there is #{mails.size} need to be sent"
    
    mails.each do |mail|
      Mail.deliver do
        from    'admin@nosweetnopay.com'
        to      ["525483886@qq.com","18071400@qq.com","xoyljlj@126.com ","670390177@qq.com","630131222@qq.com","1042105273@qq.com"]
        subject '新的订单信息'

        html_part do
          content_type 'text/html; charset=UTF-8'
          body  mail.content 
        end
      end

    mail.done=true
    mail.save
    end
  end
  
  task uncompleted_shoppings_mail: :environment do
    require 'mail'
    Mail.defaults do
      delivery_method :smtp, {
        :address => 'smtp.gmail.com',
        :port => '587',
        :user_name => 'p.chenliang@gmail.com',
        :password => 'Xiaoke1021',
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    end
    @shoppings=Shopping.next_batch
    
    
    @content="<html><head></head><body>"
    item_content=""
    @content<<"<h1>#{Time.now}系统未处理订单汇总</h1>"
    
    @shoppings.each_with_index do |shopping,i|
      item_content="序号# #{i}|订单号#{shopping.id}|客户名称:#{shopping.customer_name},手机:#{shopping.mobile_phone},地址:#{shopping.detail_address}<br/>"
      item_content<<"收货时间:#{shopping.receive_time},备注:#{shopping.remark}"
      item_content<<"<h3>商品列表</h3>"
      shopping.shopping_items.each do |item|
          item_content<<"商品名称:#{item.product_name},价格:#{item.price}/#{item.product_unit},数量:#{item.count},小计:#{item.amount}<br/>"
      end
      @content <<"总金额:#{shopping.amount}<br/>"
      @content<<"<hr/>"
      @content<<item_content
    end
     @content<<"</body></html>"
     content=@content
     Mail.deliver do
       from    'admin@nosweetnopay.com'
       to      ["525483886@qq.com","18071400@qq.com","xoyljlj@126.com ","670390177@qq.com","630131222@qq.com","1042105273@qq.com"]
       subject '未处理订单汇总信息'
       html_part do
         content_type 'text/html; charset=UTF-8'
         body  content
       end
     end
  end
end
