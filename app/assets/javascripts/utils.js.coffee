@accMul = (arg1,arg2) ->
	m=0
	s1=arg1.toString()
	s2=arg2.toString()
	console.debug s1.split(".").length
	if (s1.indexOf ".")>0
		m+=s1.split(".")[1].length
	
	if  (s2.indexOf(".")) >0
		m+=s2.split(".")[1].length
		
	Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)