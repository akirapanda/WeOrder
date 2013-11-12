class Admin::ReportsController < Admin::BaseController
  
  def sale
    @shoppings=Shopping.select("sum(amount) as total,date(created_at) as day").group("date(created_at)").order("date(created_at) asc") 
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
       f.title({ :text=>"日营业额(元)统计"})
       dates=[]
       amounts=[]
       @shoppings.each do |shopping|
         dates<<shopping.day
         amounts<<shopping.total.to_f
       end

       f.options[:xAxis][:categories] = dates
       f.labels(:items=>[:html=>"从2013年10月21日", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
       f.yAxis [
         {:title => {:text => "营业额(元)", :margin => 70} }
       ]   
       f.series(:type=> 'line',:name=> '营业额',:data=>amounts, :yAxis => 0)
     end
  
  end
  
  
  def customer_sale
    mobile_phone=""
    if params[:mobile_phone].present?
      mobile_phone=params[:mobile_phone]
      @shoppings=Shopping.select("sum(amount) as weekly_amount,yearweek(created_at) as week,mobile_phone").where("mobile_phone=?",mobile_phone).group("mobile_phone").group("yearweek(created_at)")
      @mobiles=Shopping.select("distinct(customer_name)").where("mobile_phone=?",mobile_phone)
    else
      @shoppings=[]
      @mobiles=[]
    end
    
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
       f.title({ :text=>"#{mobile_phone}消费金额周报"})
       dates=[]
       amounts=[]
       @shoppings.each do |shopping|
         dates<<shopping.week
         amounts<<shopping.weekly_amount.to_f
       end

       f.options[:xAxis][:categories] = dates
       f.yAxis [
         {:title => {:text => "消费金额(元)", :margin => 70} }
       ]   
       f.series(:type=> 'line',:name=> '消费金额',:data=>amounts, :yAxis => 0)
     end
  end
  
  
  def customers
     @customers=Shopping.select("mobile_phone,sum(amount) as total").group('mobile_phone').order('sum(amount)  desc')
     @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title({ :text=>"客人消费统计"})
        names=[]
        amounts=[]
        @customers.each do |customer|
          names<<customer.mobile_phone
          amounts<<customer.total.to_f
        end

        f.options[:xAxis][:categories] = names
        f.labels(:items=>[:html=>"从2013年10月21日", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
        f.yAxis [
          {:title => {:text => "消费金额(元)", :margin => 70} }
        ]   
        f.series(:type=> 'column',:name=> '消费金额',:data=>amounts, :yAxis => 0)
      end
  end
  
  
  def products
    @products=Product.joins(:shopping_items).select("products.name,products.unit,sum(shopping_items.amount) as amount,sum(shopping_items.count) as count").where("shopping_items.shopping_id is not null").group("products.id").order("sum(shopping_items.amount) desc")
    
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"商品销售统计"})
      names=[]
      amounts=[]
      counts=[]
      @products.each do |product|
        names<<product.name
        amounts<<product.amount.to_f
        counts<<product.count.to_f
      end
      
      f.options[:xAxis][:categories] = names
      f.labels(:items=>[:html=>"从2013年10月21日", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
      f.yAxis [
        {:title => {:text => "销售额(元)", :margin => 70} },
        {:title => {:text => "销售量(件)"}, :opposite => true},
      ]   
      
      
      f.series(:type=> 'column',:name=> '销售额',:data=>amounts, :yAxis => 0)
      f.series(:type=> 'column',:name=> '销售量',:data=> counts, :yAxis => 1)

    end
  end
end
