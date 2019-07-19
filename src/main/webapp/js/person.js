// JavaScript Document
$(document).ready(function(){
	$('.video-common-frame').hover(function(){
		$(this).children('.video-common-structure').css('z-index','5');
	},function(){
		$(this).children('.video-common-structure').css('z-index','10');
	});
	$('.content-box-nav').on('click',function(){
		$(this).parent('.content-box').toggleClass('content-box-show');
		$(this).parent('.content-box').find('.content-detail').toggleClass('content-detail-show');
	});
	$('.heart').on('click',function(){
		$(this).children('div').toggleClass('heart-show');
	});
});
