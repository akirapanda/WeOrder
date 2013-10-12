require 'net/http'
require 'uri'  

token="FRrTT5HMmjF1JjR303D1QM3eB4sx1NjDXGEhs30cM2DnswGzCaihLldXfY899n-71n1BNVA5V69nFFUsQ4D1stg51nMMXog_A_Gs6W4BapgRW8Xh-IjPW1tRcgu2RzWQ5toOF4cixPl26n8XJ3b_Yg"
url = URI.parse("https://api.weixin.qq.com/cgi-bin/menu/create?access_token="+token);
 
 
string='''
{
    "button":[
    {	
         "type":"click",
         "name":"今日歌曲",
         "key":"V1001_TODAY_MUSIC"
     },
     {
          "type":"view",
          "name":"歌手简介",
          "url":"http://www.qq.com/"
     },
     {
          "name":"菜单",
          "sub_button":[
           {
              "type":"click",
              "name":"hello word",
              "key":"V1001_HELLO_WORLD"
           },
           {
              "type":"click",
              "name":"赞一下我们",
              "key":"V1001_GOOD"
           }]
      }]
}
'''
req = Net::HTTP::Post.new(url.path,{'Content-Type' => 'application/json'})  
req.body = string  
res = Net::HTTP.new(url.host,url.port).start{|http| http.request(req)}  

puts res.body

