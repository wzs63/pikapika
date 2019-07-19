// JavaScript Document
$(document).ready(function(){
	$('.video-recommend-frame').hover(function(){
			$(this).children('.video-recommend-structure').css('z-index','5');
		},function(){
			$(this).children('.video-recommend-structure').css('z-index','10');
		});
	$('.heart').on('click',function(){
		$(this).children('div').toggleClass('heart-show');
		//根据URL获取videoId
		var videoId = document.URL.split('/')[4];

		if($(this).children('div').hasClass('heart-show')){//如果是点赞
            $.ajax({
                async:true,
                url: "/like",
                type: "POST",
                data:{"videoId":videoId},
                dataType: "json",
                success:function(data){
                    console.log("success");
                    var likeCount =  $("#likeCount")[0];
                    likeCount.innerText = data.likeCount;

                }
            });
		}else{
            $.ajax({
                async:true,
                url: "/dislike",
                type: "POST",
                data:{"videoId":videoId},
                dataType: "json",
                success:function(data){
                    console.log("success");
                    var likeCount =  $("#likeCount")[0];
                    likeCount.innerText = data.likeCount;

                }
            });
        }

	});
});