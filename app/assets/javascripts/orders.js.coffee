# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('.increase').click ->
		count=parseInt($(this).prev().val())
		$(this).prev().val(count+1)
	$('.decrease').click ->
		count=$(this).next().val()
		$(this).next().val(count-1) if count>0
	