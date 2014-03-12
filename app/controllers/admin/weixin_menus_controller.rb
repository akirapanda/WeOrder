class Admin::WeixinMenusController < Admin::BaseController
  require "open-uri"
  require "json"
  def show
    
  end
  
  def index
    #uri = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx5d9287baf40608ae&secret=3ba6582ad30075d4ae3271102e1cf636"
    uri = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=q-RQJM7ndaYxnivbX6Xi14WWwzbR5-QahzcMgVzhwWBRjr1Ez6t6FIo9QMRCeS82tGdU0Lv3YwY-841QnlUXHd8IzmxOJzl-bCN17ME8PQUX_XWxgpN2HCTcszYyRN11YKol6JT3XGBZR5p3C9kJ3A"
    html_response = ""
    open(uri) do |http|  
      while line = http.gets
        html_response = html_response + line.encode('utf-8','utf-8')
      end
    end
    json_resp=JSON.parse(html_response)
    @menu = WeixinMenu.find(1)
    
   # @ui_menus='''{"button":[{"name":"热销水果","sub_button":[{"type":"click","name":"苹果","key":"V1001_01_01","sub_button":[]},{"type":"click","name":"橘橙","key":"V1001_01_02","sub_button":[]},{"type":"click","name":"生梨","key":"V1001_01_03","sub_button":[]},{"type":"click","name":"香蕉","key":"V1001_01_04","sub_button":[]},{"type":"click","name":"柚子","key":"V1001_01_05","sub_button":[]}]},{"name":"其他水果","sub_button":[{"type":"click","name":"火龙\/木瓜","key":"V1001_02_01","sub_button":[]},{"type":"click","name":" 缇子与葡萄","key":"V1001_02_02","sub_button":[]},{"type":"click","name":"枣\/小番茄","key":"V1001_02_03","sub_button":[]},{"type":"click","name":"精品","key":"V1001_02_04","sub_button":[]},{"type":"click","name":"其他","key":"V1001_02_05","sub_button":[]}]},{"name":"双蛋活动","sub_button":[{"type":"click","name":"双蛋活动","key":"V1001_03_01","sub_button":[]},{"type":"click","name":"优惠活动","key":"V1001_03_02","sub_button":[]},{"type":"click","name":"指令查询","key":"V1001_03_03","sub_button":[]},{"type":"click","name":"客户服务","key":"V1001_03_04","sub_button":[]},{"type":"click","name":"加入我们","key":"V1001_03_05","sub_button":[]}]}]}'''
    access_token="B2uzDPfowSvkS2FLlyq8iWQKS_T16Vjvw6PLzKsGYspM8EsfwmL_OFwBuTqGn0DUbOSUvEmqIjHQraHSAfXBvSSXI2QYGba58EKCIDiRSf31K-gpAk6sTckhX08-AtHswvzHJ8mGzqI8AaU4b1YXkw"
   # response =  HTTParty.post "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=#{access_token}",
  #   body: @ui_menus, headers: {'ContentType' => 'application/json'}   
     @html_response=@menu.to_json
  
    
  end
  

  
end