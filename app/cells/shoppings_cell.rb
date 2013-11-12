class ShoppingsCell < Cell::Rails
  def today
    today=Date.strptime Time.now.to_s "%m/%d/%Y"
    @shoppings=Shopping.where("date(created_at)=?",today)
    render
  end
  
  
  def this_last_week_sale_chart
    @DATES=["日","一","二","三","四","五","六"]
    @shoppings=Shopping.select("sum(amount) as total,date(created_at) as day,dayofweek(date(created_at)) as week").where("week(created_at)=week(now())").group("date(created_at)").order("date(created_at) asc") 
    @last_shoppings=Shopping.select("sum(amount) as total,date(created_at) as day,dayofweek(date(created_at)) as week").where("week(created_at)=week(now())-1").group("date(created_at)").order("date(created_at) asc") 
    
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
       f.title({ :text=>"日营业额(元)统计"})
       dates=[]
       amounts=[]
       last_amounts=[]
       dates= @DATES
       
       @shoppings.each_with_index do |shopping|
         amounts[shopping.week-1]=shopping.total.to_f
         
       end

       @last_shoppings.each_with_index do |shopping,index|
         last_amounts[shopping.week-1]=shopping.total.to_f
       end
       f.options[:xAxis][:categories] = dates
       f.yAxis [
         {:title => {:text => "本周营业额(元)", :margin => 0} }
       ]   
       
       f.series(:type=> 'line',:name=> '本周营业额',:data=>amounts, :yAxis => 0)
       f.series(:type=> 'line',:name=> '上周营业额',:data=>last_amounts, :yAxis => 0)
       
     end
     render
  end
end
