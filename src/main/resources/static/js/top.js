// JavaScript Document
$(document).ready(function(){
	$('#video').on('click',function(){
		$('.labble-option').css('background-color','#FFFFFF');
		$(this).css('background-color','#E95C25');
		$('.user-box').css('left','-100%');
	});
	$('#user').on('click',function(){
		$('.labble-option').css('background-color','#FFFFFF');
		$(this).css('background-color','#E95C25');
		$('.user-box').css('left','0');
	});
});