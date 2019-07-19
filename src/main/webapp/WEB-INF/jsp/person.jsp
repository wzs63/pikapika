<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../css/person.css" type="text/css" />
<link rel="stylesheet" href="../css/nav.css" type="text/css" />
<link rel="stylesheet" href="../css/video-detail.css" type="text/css" />
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/nav.js"></script>
<script type="text/javascript" src="../js/person.js"></script>
<title>person</title>
	<style>
		*{
			padding: 0px;
			margin: 0px;
		}
		.beijing{
			position: relative;
			width:100%;
			height: 650px;
			background-image: url(/image/h4.jpg)
		}
		.touxiang{
			position: absolute;
			left: 50%;
			top: 100px;
			margin-left: -75px;
			width: 150px;
			height: 150px;
			border: 2px solid black;
			border-radius: 50%;
			overflow: hidden;
		}
		.touxiang img{
			width: 100%;
			height: 100%;
		}
		.xinxi{
			width: 150px;
			height: 100px;
			position: absolute;
			left: 50%;
			margin-left: -75px;
			top: 260px;
			position: relative;
		}
		.xinxi h1{
			text-align: center;
			font-style: normal;
			color: aliceblue;
		}
		.xinxi div ul li{
			display: inline-block;
			color: beige;
		}
		.xinxil{
			position: absolute;
			left: 50%;
			margin-left: -300px;
			top: 360px;
			width: 600px;
			height: 100px;
		}
		.xinxil-li{
			text-align: center;
			width: 100px;
			height: 100px;
			margin-left: 75px;
			display:inline-block;
			color: #50799b;
		}
		.fon{
			font-family: "Arial";
			font-size: 50px;
		}
		ul{
		 top: 40px;
    	 position: absolute;
       	 list-style: none;
       }

		table.hovertable {
		 font-family: verdana,arial,sans-serif;
		 font-size:20px;
		 color:aliceblue;
		 border-width: 1px;
		 border-color: #999999;
/*		 border-collapse: collapse;*/
		 margin-top: 50px;
		 border-spacing: 30px 10px;
	    }
		table.hovertable tr {
		 background-color:#B7AAB2;
		 margin-top: 20px;
		}
 		table.hovertable td {
		 border-width: 1px;
		 padding: 8px;
		 border-style: solid;
		 border-color:#AFA5A5;
		}
		.td-c{
			width: 700px;
		}
		.qianming{
			width: 100%;
			height: 200px;
			text-align: center;
		    position: relative;
		    width: 600px;
		    left: -218px;
			color: #d5e7f3;
		}
		.qianming-c{
			text-align: center;
			margin-top: 20px;
			line-height: 50px;
			font-family: Constantia, "Lucida Bright", "DejaVu Serif", Georgia, "serif";
		}
		
		input{
			display: none;
		}
	</style>
</head>

<body>

	<div class="beijing">
		<div class="xinxi">
			<h1> ${user.getUserName()} </h1>
			<div>
				<div class="qianming">
					<!-- <h2 class="qianming-c" style="font-size: 40px">个性签名</h2> -->
					</br>
					<p> ${user.getUserSignature()} </p>
				</div>
			</div>
		</div>
		</br>
		<div class="xinxil">
		<c:if test="${ifYourself == 0}">
                                 
                                 
                                 
                                 <div  id=win style="z-index:20; display:none; POSITION:absolute; left:50%; top:50%; width:600px; height:400px; margin-left:-300px; margin-top:-200px; border:1px solid #888; background-color:#edf; text-align:center">
                                 			<form action="/addMessage/${user.getUserName().toLowerCase()}" method="post">
                                 			<input    name="messageContent"  style="    display: inline; width:300px"/>
                                 			<button type="submit">ok</button>
                                 			</form>
                                 			<a href="javascript:closeLogin();">
                                 			关闭</a>
                                 	
                                 			</div>
									
									<script>
									function openLogin(){
									   document.getElementById("win").style.display="";
									}
									function closeLogin(){
									   document.getElementById("win").style.display="none";
									}
									</script>
									<a href="/focus?focusedName=${user.getUserName().toLowerCase()}">关注</a>
									<a href="javascript:openLogin();">私信</a>
             
             
             
             
             </c:if>
			<ul>
			
				<li class="xinxil-li">
					<ul>
						<li class="fon">23</li>
						<li>关注</li>
					</ul>
				</li>
				<li class="xinxil-li">
					<ul>
						<li class="fon">34</li>
						<li >点赞</li>
					</ul>
				</li>
				
			</ul>
		</div>
		<div class="touxiang">
			<input type="file" name="file" accept="image/*" />
	<a onclick='changeHeadPortrait()'><img id="tximg" alt="image/guimie2.jpg"  src="/file/${user.getUserImg()}"></a>	
	<script type="text/javascript">
		var changeHeadPortrait = function(){
			var file = document.getElementsByTagName('input')[0];
			console.log('eee');

			//var submit = document.getElementsByTagName('input')[1];
					
			file.click();
			
		}
		var file = document.getElementsByTagName('input')[0];
		file.onchange = function(){ 
			base64ToSrc("#tximg", file.files[0]);
			
			var formFile = new FormData();
            formFile.append("file", file.files[0]);  
			console.log(file);
			$.ajax({
                async:true,
                type: "POST",
                url: "/uploadHeadPortrait.do",//注意路径
                data:formFile,
                dataType: "json",
                   cache: false,//上传文件无需缓存
                   processData: false,//用于对data参数进行序列化处理 这里必须false
         
                contentType: false, //必须
                success:function(){
                	console.log('ok');
                },
                error:function(){
                	console.log('nook');
                }
            });
		}
		
		var base64ToSrc = function(element, file) {
			var reader = new FileReader();
			reader.readAsDataURL(file);
			 reader.onload = function (e) {
			       base64Code=this.result;
			       $(element).attr("src",base64Code);
			     }
		}
		
	

		
	</script>
			
	    </div>
	</div>
	
<div class="content-box">
			<a name="dance"></a>
			<div class="content-box-nav">
				<h2>历史记录</h2>
				<a href="#" class="count">
					<div class="count-all">全部</div>
					<div class="button1">&#8250</div>
				</a>
			</div>
<!--		隐藏的话，<div class="content-detail" style="display: none">
			<div class="content-box" style="higth:80px"></div>			
-->
	<div class="content-detail">
				<div  class="video-common" >
					<div class="video-common-frame">
					<div class="video-common-structure">
						<img alt="common-video" src="/image/h6.jpg">
					</div>
					<a href="video.html" class="video-common-cover"></a>
					<div class="video-common-label">
						<p>视频的描述</p>
						<p>作者</p>
						<p>标签</p>
					</div>
					<div class="heart-box">
						<div class="heart">
      						 <div class="left"></div>
     					     <div class="middle"></div>
       						 <div class="right"></div>
   						</div>
					</div>
					</div>
				</div>
				<div  class="video-common" >
					<div class="video-common-frame">
					<div class="video-common-structure">
						<img alt="common-video" src="/image/h6.jpg">
					</div>
					<a href="video.html" class="video-common-cover"></a>
					<div class="video-common-label">
						<p>视频的描述</p>
						<p>作者</p>
						<p>标签</p>
					</div>
					<div class="heart-box">
						<div class="heart">
      						 <div class="left"></div>
     					     <div class="middle"></div>
       						 <div class="right"></div>
   						</div>
					</div>
					</div>
				</div>
				<div  class="video-common" >
					<div class="video-common-frame">
					<div class="video-common-structure">
						<img alt="common-video" src="/image/h6.jpg">
					</div>
					<a href="video.html" class="video-common-cover"></a>
					<div class="video-common-label">
						<p>视频的描述</p>
						<p>作者</p>
						<p>标签</p>
					</div>
					<div class="heart-box">
						<div class="heart">
      						 <div class="left"></div>
     					     <div class="middle"></div>
       						 <div class="right"></div>
   						</div>
					</div>
					</div>
				</div>
				<div  class="video-common" >
					<div class="video-common-frame">
					<div class="video-common-structure">
						<img alt="common-video" src="image/h6.jpg">
					</div>
					<a href="video.html" class="video-common-cover"></a>
					<div class="video-common-label">
						<p>视频的描述</p>
						<p>作者</p>
						<p>标签</p>
					</div>
					<div class="heart-box">
						<div class="heart">
      						 <div class="left"></div>
     					     <div class="middle"></div>
       						 <div class="right"></div>
   						</div>
					</div>
					</div>
				</div>
				<div  class="video-common" >
					<div class="video-common-frame">
					<div class="video-common-structure">
						<img alt="common-video" src="image/h6.jpg">
					</div>
					<a href="video.html" class="video-common-cover"></a>
					<div class="video-common-label">
						<p>视频的描述</p>
						<p>作者</p>
						<p>标签</p>
					</div>
					<div class="heart-box">
						<div class="heart">
      						 <div class="left"></div>
     					     <div class="middle"></div>
       						 <div class="right"></div>
   						</div>
					</div>
					</div>
				</div>
			</div>
	</div>
	<div class="content-box">
			<a name="dance"></a>
			<div class="content-box-nav">
				<h2>我的收藏</h2>
				<a href="#" class="count">
					<div class="count-all">全部</div>
					<div class="button1">&#8250</div>
				</a>
			</div>
	<div class="content-detail">
				<div  class="video-common" >
					<div class="video-common-frame">
					<div class="video-common-structure">
						<img alt="common-video" src="image/h6.jpg">
					</div>
					<a href="video.html" class="video-common-cover"></a>
					<div class="video-common-label">
						<p>视频的描述</p>
						<p>作者</p>
						<p>标签</p>
					</div>
					<div class="heart-box">
						<div class="heart">
      						 <div class="left"></div>
     					     <div class="middle"></div>
       						 <div class="right"></div>
   						</div>
					</div>
					</div>
				</div>
				<div  class="video-common" >
					<div class="video-common-frame">
					<div class="video-common-structure">
						<img alt="common-video" src="image/h6.jpg">
					</div>
					<a href="video.html" class="video-common-cover"></a>
					<div class="video-common-label">
						<p>视频的描述</p>
						<p>作者</p>
						<p>标签</p>
					</div>
					<div class="heart-box">
						<div class="heart">
      						 <div class="left"></div>
     					     <div class="middle"></div>
       						 <div class="right"></div>
   						</div>
					</div>
					</div>
				</div>
				<div  class="video-common" >
					<div class="video-common-frame">
					<div class="video-common-structure">
						<img alt="common-video" src="image/h6.jpg">
					</div>
					<a href="video.html" class="video-common-cover"></a>
					<div class="video-common-label">
						<p>视频的描述</p>
						<p>作者</p>
						<p>标签</p>
					</div>
					<div class="heart-box">
						<div class="heart">
      						 <div class="left"></div>
     					     <div class="middle"></div>
       						 <div class="right"></div>
   						</div>
					</div>
					</div>
				</div>
				<div  class="video-common" >
					<div class="video-common-frame">
					<div class="video-common-structure">
						<img alt="common-video" src="image/h6.jpg">
					</div>
					<a href="video.html" class="video-common-cover"></a>
					<div class="video-common-label">
						<p>视频的描述</p>
						<p>作者</p>
						<p>标签</p>
					</div>
					<div class="heart-box">
						<div class="heart">
      						 <div class="left"></div>
     					     <div class="middle"></div>
       						 <div class="right"></div>
   						</div>
					</div>
					</div>
				</div>
				<div  class="video-common" >
					<div class="video-common-frame">
					<div class="video-common-structure">
						<img alt="common-video" src="image/h6.jpg">
					</div>
					<a href="video.html" class="video-common-cover"></a>
					<div class="video-common-label">
						<p>视频的描述</p>
						<p>作者</p>
						<p>标签</p>
					</div>
					<div class="heart-box">
						<div class="heart">
      						 <div class="left"></div>
     					     <div class="middle"></div>
       						 <div class="right"></div>
   						</div>
					</div>
					</div>
				</div>
			</div>
	</div>
	<frame src="banquan.html" width: 100% height: 200px >

	<script type="text/javascript">
//	if(localStorage.tximg != undefined){
//		var tximg = document.getElementById("tximg")
//		tximg.src = localStorage.tximg;
//	}

	</script>
</body>
</html>
