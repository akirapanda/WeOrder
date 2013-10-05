# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require masonry.pkgd.min
//= require imagesloaded.pkgd.min
$ ->
	$('#masonry').masonry({
	  columnWidth: 256,
	  itemSelector: '.box',
	  gutter:10})
	$('#masonry').imagesLoaded ->
		$('#masonry').masonry({
		  columnWidth: 256,
		  itemSelector: '.box',
		  gutter:10})