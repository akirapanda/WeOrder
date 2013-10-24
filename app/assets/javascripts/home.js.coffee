# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	if $('body').data('controller-name') in ['home']
		$('#masonry').masonry({
		  columnWidth: 256,
		  itemSelector: '.box',
		  gutter:10})
		$('#masonry').imagesLoaded ->
			$('#masonry').masonry({
			  columnWidth: 256,
			  itemSelector: '.box',
			  gutter:10})
		$('.carousel').carousel({interval: 5000})
		$('.box img').click ->
			window.location.href=$(this).attr("data")