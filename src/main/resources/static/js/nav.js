// JavaScript Document
$(document).ready(function(){
	"use strict";
$('.nav-b').hover(function(){
		$(this).children('div').addClass('shadow');
	},function(){
		$(this).children('div').removeClass('shadow');
	});
});