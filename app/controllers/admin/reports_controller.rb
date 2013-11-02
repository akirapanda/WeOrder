class Admin::ReportsController < Admin::BaseController
  def products
    @products=Product.joins(:shopping_items).select("products.name,products.unit,sum(shopping_items.amount) as amount,sum(shopping_items.count) as count").group("products.id").order("sum(shopping_items.amount) desc")
    
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
