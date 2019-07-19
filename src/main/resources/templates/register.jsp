<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>注册</title>
<link type="text/css" rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="bootstrap-3.3.5-dist/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="js/jquery.md5.js"></script>
<style type="text/css">

.theme{          
    background-image: url(https://uk.imageservice.sky.com/contentid/iYsxVQhsSbWDXxYHDcwC6f/LAND_16_9-SEASON);    
    animation: theme 3s ease-in-out infinite;    
    animation-direction:alternate;
	   position: absolute;    top: 0;	
    left: 0; 
-webkit-backface-visibility: hidden;
	}

@keyframes theme {                
    0% {                   
       // background-image: url(http://img.soogif.com/W5Y2GjJiVBID3ydzEYpuqkIN7K6zuPVG.gif_s400x0);
       // background-image: url(http://img.soogif.com/sS8vqd0JsuuwjZrck2Erx8jJ3KuqQkSX.gif_s400x0);                
    }    	
    100% {                    
      // background-image: url(http://img.soogif.com/sS8vqd0JsuuwjZrck2Erx8jJ3KuqQkSX.gif_s400x0);
    }            
}    
.theme-gif{    
    mix-blend-mode: screen;    
    position: absolute;    
    top: 0;	
    width: 100%;	
    height: 400px;    
    background-position: center top;    
    background-image: url(https://img.zcool.cn/community/038a4f2586b6d30a8012060c873f410.gif);
}  
 
.input{
	background-color: rgba(0,0,0,0);
	border: none;
	margin-bottom: 15px;
	outline:none;
    border-color: #03a9f4;
    box-shadow: 0 0 15px #03a9f4;
    color:chartreuse;
}
body{
	color: #fff;
}
.form{
    margin: auto;
	border-radius: 1.5em;
	background-color: rgba(0,0,0,0.3);
    overflow: auto;
    position: absolute;
    left: 50%;
    top: 50%;
    width: auto;
    height: auto;
    max-height: 80%;
    -webkit-transform: translate(-50%, -50%);

    border-color: #03a9f4;
    box-shadow: 0 0 15px #03a9f4;
    color:chartreuse;
}
  </style>
</head>

<body>
<div class="theme" style="width: 100%;height: 100%;background: #222; background-size: cover; background-position:center;">     
   <div class="theme-gif"></div>
	
	
 <div class="col-md-6 col-md-offset-3 form">

            <form action="register_check.do" method="post" onsubmit="return checkForm()">
            <div>
	         </br>
			     <h4 style="text-align:center;">注册</h4>
			       <p style="border-top: 1px solid #d3d3d3;"></p>
	         </div>
            <div>
            	<input class="input" type="text" name="userEmail" id="emailAddress" placeholder=" 邮箱" class="form-control" style="width:300px"/>
            	<button class="input" id="checkEmail" type="button" >验证邮箱</button>
            </div>
            <div>
          	    <input class="input" type="text" name="userName" placeholder=" 用户名" class="form-control" style="width:300px"/>
       	    </div>
 
          	<div>
           	<input class="input" type="text" id="emailCode" placeholder=" 验证码" class="form-control" style="width:300px"/>
          	</div>
         	<div>
           		<input class="input" type="password" id="input-password" placeholder=" 密码" class="form-control" style="width:300px"/>
       	 	</div>  
        
        <div>
           <input class="input" type="password" id="input-password2" placeholder=" 确认密码" class="form-control" style="width:300px"/>
        </div> 
        
      <input type="hidden" name="userPassWord" />
      
        <div>
              <button class="input" type="submit" style="margin-bottom: 10px;">确定</button><a href="login.do" style="color: #fff">| 返回</a>
        	  <p style="border-top: 1px solid #d3d3d3;"></p>
        	  </br>
        </div> 
                
        </form>
</div> 
</div>

<!-- scripts -->
 <script>
function checkForm() {
	  var emailCode = document.getElementById("emailCode").value;//输入的验证码
	  var p1 = document.getElementById("input-password").value;//设置密码
	  var p2 = document.getElementById("input-password2").value;//重复输入密码
	  var md5_pwd = document.getElementsByName('userPassWord')[0];
	  if(emailCode != code) {
		   alert("邮箱验证码错误");
		   return false;
	   }
	   if(p1 === p2) {
		   alert("bingo"+p1+" "+p2);
		  	// 把用户输入的明文变为MD5:
		  	md5_pwd.value = $.md5(p1);
		  	// alert("bingo"+p1+" "+p2+" "+md5_pwd.value);
		  	console.log("md:" + md5_pwd.value);
		  	//alert("bingo"+p1+" "+p2+" "+md5_pwd.value);
		   return true;
	   }else{
		   alert("两次密码不相同");
		   return false;
	   }
	   return true;
}

var code = "6f3b22a5f28c40509cd17473597b405e"
var checkEmail = document.getElementById("checkEmail")
checkEmail.onclick = function() {
	 $.ajax({
     	async:true,
         url: "/checkEmail.do",
         type: "POST",
         data:{"emailAddress":document.getElementById("emailAddress").value},
         dataType: "json",
         success:function(data){
        	//console.log(data);
         	//console.log(data.code);
         	code = data.code;
         }
		 });	
}
//爱心动画点击效果
!function(e,t,a){function r(){for(var e=0;e<s.length;e++)s[e].alpha<=0?(t.body.removeChild(s[e].el),s.splice(e,1)):(s[e].y--,s[e].scale+=.004,s[e].alpha-=.013,s[e].el.style.cssText="left:"+s[e].x+"px;top:"+s[e].y+"px;opacity:"+s[e].alpha+";transform:scale("+s[e].scale+","+s[e].scale+") rotate(45deg);background:"+s[e].color+";z-index:99999");requestAnimationFrame(r)}function n(){var t="function"==typeof e.onclick&&e.onclick;e.onclick=function(e){t&&t(),o(e)}}function o(e){var a=t.createElement("div");a.className="heart",s.push({el:a,x:e.clientX-5,y:e.clientY-5,scale:1,alpha:1,color:c()}),t.body.appendChild(a)}function i(e){var a=t.createElement("style");a.type="text/css";try{a.appendChild(t.createTextNode(e))}catch(t){a.styleSheet.cssText=e}t.getElementsByTagName("head")[0].appendChild(a)}function c(){return"rgb("+~~(255*Math.random())+","+~~(255*Math.random())+","+~~(255*Math.random())+")"}var s=[];e.requestAnimationFrame=e.requestAnimationFrame||e.webkitRequestAnimationFrame||e.mozRequestAnimationFrame||e.oRequestAnimationFrame||e.msRequestAnimationFrame||function(e){setTimeout(e,1e3/60)},i(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"),n(),r()}(window,document);  

</script>   
</body>
</html>
