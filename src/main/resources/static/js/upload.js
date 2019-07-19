// JavaScript Document
$(document).ready(function(){
	$('#up-img').on('click',function(){
	  	$('.up-img').trigger('click');
	  	$('.up-cover-img').css('display','none');
		$('.default-img').css('display','block');
	});
	$('#up-video').on('click',function(){
	  	$('.up-file').trigger('click');
	  	$('.up-video').css('display','none');
		$('.default-video').css('display','block');
	});
	$('.sub-btn').on('click',function(){
		$('.sub-btn').removeClass('sub-btn-show');
		$(this).addClass('sub-btn-show');
	});
});