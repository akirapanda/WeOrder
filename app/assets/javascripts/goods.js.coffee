# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	if $('body').data('controller-name') in ['goods']
		$("[rel='tooltip']").tooltip()
		$('.dropdown-toggle').dropdown()
		$("#post_body").qeditor({})
		
