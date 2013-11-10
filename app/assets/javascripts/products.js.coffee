# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
formatNum = (num) ->
	D=['00','01','02','03','04','05','06','07','08','09'] 
	if num<10 
		return D[num]
	else
		return num
	
jQuery ->
	if $('body').data('controller-name') in ['products']
		dt = new Date()
		end = new Date("2013/11/14")
		date3=end-dt

		time=new Array()
		
		days=Math.floor(date3/(24*3600*1000))
		
		time.push  formatNum(days)
		
		
		leave1=date3%(24*3600*1000)
		hours=Math.floor(leave1/(3600*1000))
		time.push formatNum(hours)
		
		
		
		leave2=leave1%(3600*1000)
		minutes=Math.floor(leave2/(60*1000))
		time.push formatNum(minutes)
		
		leave3=leave2%(60*1000)
		seconds=Math.round(leave3/1000)
		time.push formatNum(seconds)
		
		$('#counter').countdown({
	    stepTime: 60,
	    format: 'dd:hh:mm:ss',
	    startTime: time.join(":"),

	    image: "/digits.png"
	  })
		
