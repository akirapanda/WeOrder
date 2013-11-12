# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require utils

jQuery ->
	if $('body').data('controller-name') in ['carts']		
		$('.increase').click ->
			count=parseInt($(this).prev().val())
			$(this).prev().val(count+1)
			price=$(this).next().next().val()			
			amount=accMul(count+1,price)
			$(this).parent().parent().next().next().html("&yen"+amount)
			
		$('.decrease').click ->
			count=$(this).next().val()
			if count > 1
				$(this).next().val(count-1)
				price=$(this).next().next().next().next().val()			
				amount=accMul(count-1,price)
				$(this).parent().parent().next().next().html("&yen"+amount)
			