// JavaScript Document
$(document).ready(function(){
	$('.dynamic-video-frame').hover(function(){
		$(this).children('.dynamic-video-structure').css('z-index','5');
	},function(){
		$(this).children('.dynamic-video-structure').css('z-index','10');
	});
});