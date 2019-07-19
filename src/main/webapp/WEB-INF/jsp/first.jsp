<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>登录</title>
<link type="text/css" rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css"/>
   
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/sign-up-login.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/inputEffect.css" />
<link rel="stylesheet" href="css/tooltips.css" />
<link rel="stylesheet" href="css/spop.min.css" />
<link rel="stylesheet" type="text/css" href="css/verify.css">

<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="../js/jquery.md5.js"></script>
<script src="js/snow.js"></script>
<script src="js/jquery.pure.tooltips.js"></script>
<script src="js/spop.min.js"></script>
<script type="text/javascript" src="js/verify.js" ></script>
<script>
	(function() {
		// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
		if (!String.prototype.trim) {
			(function() {
				// Make sure we trim BOM and NBSP
				var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
				String.prototype.trim = function() {
					return this.replace(rtrim, '');
				};
			})();
		}

		[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
			// in case the input is already filled..
			if( inputEl.value.trim() !== '' ) {
				classie.add( inputEl.parentNode, 'input--filled' );
			}

			// events:
			inputEl.addEventListener( 'focus', onInputFocus );
			inputEl.addEventListener( 'blur', onInputBlur );
		} );

		function onInputFocus( ev ) {
			classie.add( ev.target.parentNode, 'input--filled' );
		}

		function onInputBlur( ev ) {
			if( ev.target.value.trim() === '' ) {
				classie.remove( ev.target.parentNode, 'input--filled' );
			}
		}
	})();

	$(function() {
		$('#login #input-password').focus(function() {
			$('.login-owl').addClass('password');
		}).blur(function() {
			$('.login-owl').removeClass('password');
		});
		$('#login #register-password').focus(function() {
			$('.register-owl').addClass('password');
		}).blur(function() {
			$('.register-owl').removeClass('password');
		});
		$('#login #register-repassword').focus(function() {
			$('.register-owl').addClass('password');
		}).blur(function() {
			$('.register-owl').removeClass('password');
		});
		$('#login #forget-password').focus(function() {
			$('.forget-owl').addClass('password');
		}).blur(function() {
			$('.forget-owl').removeClass('password');
		});
	});

	function goto_register(){
		$("#register-username").val("");
		$("#register-password").val("");
		$("#register-repassword").val("");
		$("#emailCode").val("");
		$("#tab-2").prop("checked",true);
	}

	function goto_login(){
		$("#userName").val("");
		$("#input-password").val("");
		$("#tab-1").prop("checked",true);
	}

	function goto_forget(){
		$("#forget-username").val("");
		$("#forget-password").val("");
		$("#forget-code").val("");
		$("#tab-3").prop("checked",true);
	}

	// function login(){//登录
	// 	var username = $("#userName").val(),
	// 		password = $("#input-password").val(),
	// 		validatecode = null,
	// 		flag = false;
	// 	//判断用户名密码是否为空
	// 	if(username == ""){
	// 		$.pt({
    //     		target: $("#userName"),
    //     		position: 'r',
    //     		align: 't',
    //     		width: 'auto',
    //     		height: 'auto',
    //     		content:"用户名不能为空"
    //     	});
	// 		flag = true;
	// 	}
	// 	if(password == ""){
	// 		$.pt({
    //     		target: $("#input-password"),
    //     		position: 'r',
    //     		align: 't',
    //     		width: 'auto',
    //     		height: 'auto',
    //     		content:"密码不能为空"
    //     	});
	// 		flag = true;
	// 	}
	// 	//用户名只能是15位以下的字母或数字
	// 	var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
	// 	if(!regExp.test(username)){
	// 		$.pt({
    //     		target: $("#userName"),
    //     		position: 'r',
    //     		align: 't',
    //     		width: 'auto',
    //     		height: 'auto',
    //     		content:"用户名必须为15位以下的字母或数字"
    //     	});
	// 		flag = true;
	// 	}
	//
	// 	if(flag){
	// 		return false;
	// 	}else{//登录
	// 		//调用后台登录验证的方法
	// 		alert('登录成功');
	// 		return false;
	// 	}
	// }

	//注册
	// function register(){
	// 	var username = $("#register-username").val(),
	// 		password = $("#register-password").val(),
	// 		repassword = $("#register-repassword").val(),
	// 		code = $("#emailCode").val(),
	// 		flag = false,
	// 		validatecode = null;
	// 	//判断用户名密码是否为空
	// 	if(username == ""){
	// 		$.pt({
    //     		target: $("#register-username"),
    //     		position: 'r',
    //     		align: 't',
    //     		width: 'auto',
    //     		height: 'auto',
    //     		content:"用户名不能为空"
    //     	});
	// 		flag = true;
	// 	}
	// 	if(password == ""){
	// 		$.pt({
    //     		target: $("#register-password"),
    //     		position: 'r',
    //     		align: 't',
    //     		width: 'auto',
    //     		height: 'auto',
    //     		content:"密码不能为空"
    //     	});
	// 		flag = true;
	// 	}else{
	// 		if(password != repassword){
	// 			$.pt({
	//         		target: $("#register-repassword"),
	//         		position: 'r',
	//         		align: 't',
	//         		width: 'auto',
	//         		height: 'auto',
	//         		content:"两次输入的密码不一致"
	//         	});
	// 			flag = true;
	// 		}
	// 	}
		// //用户名只能是15位以下的字母或数字
		// var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
		// if(!regExp.test(username)){
		// 	$.pt({
        // 		target: $("#register-username"),
        // 		position: 'r',
        // 		align: 't',
        // 		width: 'auto',
        // 		height: 'auto',
        // 		content:"用户名必须为15位以下的字母或数字"
        // 	});
		// 	flag = true;
		// }
		//检查用户名是否已经存在
		//调后台代码检查用户名是否已经被注册

		//检查注册码是否正确
		//调后台方法检查注册码，这里写死为11111111
		// if(code != '11111111'){
		// 	$.pt({
		//         target: $("#emailCode"),
		//         position: 'r',
		//         align: 't',
		//         width: 'auto',
		//         height: 'auto',
		//         content:"注册码不正确"
		//        });
		// 	flag = true;
		// }
//
	//
	// 	if(flag){
	// 		return false;
	// 	}else{//注册
	// 		// spop({
	// 		// 	template: '<h4 class="spop-title">注册成功</h4>即将于3秒后返回登录',
	// 		// 	position: 'top-center',
	// 		// 	style: 'success',
	// 		// 	autoclose: 3000,
	// 		// 	onOpen : function(){
	// 		// 		var second = 2;
	// 		// 		var showPop = setInterval(function(){
	// 		// 			if(second == 0){
	// 		// 				clearInterval(showPop);
	// 		// 			}
	// 		// 			$('.spop-body').html('<h4 class="spop-title">注册成功</h4>即将于'+second+'秒后返回登录');
	// 		// 			second--;
	// 		// 		},1000);
	// 		// 	},
	// 		// 		onClose : function(){
	// 		// 		goto_login();
	// 		// 	}
	// 		// });
	// 		return true;
	// 	}
	// }

	






</script>
<style type="text/css">
html{width: 100%; height: 100%;}
.theme {
            animation: theme 3s ease-in-out infinite;
            animation-direction: alternate;
            position: absolute;
            top: 0;
            left: 0;
            -webkit-backface-visibility: hidden;
        }

@keyframes theme {
            0% {
                background-image: url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558699918307&di=999fa5bdb1a9b764a04ca7df7d20a61b&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F24%2F20150524221849_FYHky.thumb.700_0.gif);

            }
            100% {
            / / background-image: url(../image/pika.jpg);
                background-image: url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558699918307&di=999fa5bdb1a9b764a04ca7df7d20a61b&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F24%2F20150524221849_FYHky.thumb.700_0.gif);
            }
        }

.theme-gif {
            mix-blend-mode: screen;
            position: absolute;
            top: 0;
            width: 100%;
            height: 400px;
            background-position: center top;
            background-image: url(https://img.zcool.cn/community/038a4f2586b6d30a8012060c873f410.gif);
        }

body{
	
	
  	background-repeat: no-repeat;

  		background-position: center top;

  	

  	background: url(images/snow.jpg) no-repeat;

    background-image: url(image/pikabackground.gif) ;

  	background-size: 100% 100%;
  
	
	

}

form{
	opacity: 0.8
	}
.snow-container { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 100001; }

</style>
</head>
<body>
	<!-- 雪花背景 -->
	<div class="snow-container"></div>
	<!-- 登录控件 -->
	<div id="login">
		<input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked />
		<input id="tab-2" type="radio" name="tab" class="sign-up hidden" />
		<input id="tab-3" type="radio" name="tab" class="sign-out hidden" />
		<div class="wrapper" >
			<!-- 登录页面 -->
			<div class="login sign-in-htm">
				<form id="loginForm" action="/login_check.do" class="container offset1 loginform">
					<!-- 皮卡丘控件 -->
					<div id="owl-login" class="login-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="userName"
									name="userName" autocomplete="off" placeholder="请输入用户名" tabindex="1" maxlength="15" />
								<label class="input__label input__label--hideo" for="userName">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="input-password" placeholder="请输入密码" tabindex="2" maxlength="15"/>
                                <input type="hidden" id="loginPassword" name="userPassWord">
								<label class="input__label input__label--hideo" for="input-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>

							</span>
						</section>
					</div>
					<div class="form-actions">

						<a tabindex="3" class="btn pull-left btn-link text-muted"><label><input id="remember" type="checkbox">记住密码</label></a>
						<a tabindex="4" class="btn pull-left btn-link text-muted" onClick="goto_forget()">忘记密码?</a>
						<a tabindex="5" class="btn btn-link text-muted" onClick="goto_register()">注册</a>
						<button class="btn btn-primary" type="button" tabindex="3" value="登录" onclick="openLogin()"
							style="color:white;"/>登录
						</button>
						<h6 style="text-align:right;color:red;">${ fail_message }</h6>
					</div>
				</form>
			</div>
			<!-- 忘记密码页面 -->
			<div class="login sign-out-htm">
				<form id="forgetForm" action="/changePassword.do" method="post" class="container offset1 loginform">
					<!-- 皮卡丘控件 -->
					<div id="owl-login" class="forget-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-username" name="userName" autocomplete="off" placeholder="请输入用户名"/>
								<label class="input__label input__label--hideo" for="forget-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-code" autocomplete="off" placeholder="请输入注册码"/>
								<label class="input__label input__label--hideo" for="forget-code">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="forget-password" name="userPassWord" placeholder="请重置密码" />
								<label class="input__label input__label--hideo" for="forget-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="forget-repassword" placeholder="请确认密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-repassword">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
						</section>
					</div>
					<div class="form-actions">
						<a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>
						<button class="btn btn-primary" id="checkEmailByUser" type="button" >验证邮箱</button>
						<input class="btn btn-primary" type="button" onClick="forget()" value="重置密码"
							style="color:white;"/>
					</div>
				</form>
			</div>
			<!-- 注册页面 -->
			<div class="login sign-up-htm">
				<form id="registerForm" action="register_check.do" method="post" onsubmit="return registerCheckForm()" class="container offset1 loginform">
					<!-- 皮卡丘控件 -->
					<div id="owl-login" class="register-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">

							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="register-username"
									name="userName" autocomplete="off" placeholder="请输入用户名" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>

							<!-- <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" />
								<button class="input" id="checkEmail" type="button" >验证邮箱</button>
								<label class="input__label input__label--hideo" for="emailAddress">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span> -->

							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="register-password" placeholder="请输入密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>

							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="register-repassword" placeholder="请确认密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-repassword">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
								<input type="hidden" id="registerUserPassWord" name="userPassWord" />
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="emailAddress" name="userEmail" placeholder="请输入邮箱" autocomplete="off" maxlength="20"/>
								<label class="input__label input__label--hideo" for="emailAddress">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="emailCode" autocomplete="off" placeholder="请输入注册码"/>
								<label class="input__label input__label--hideo" for="emailCode">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
						</section>
					</div>

					<div class="form-actions">
						<a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>

						<button class="btn btn-primary" id="checkEmail" type="button" >验证邮箱</button>
						<button class="btn btn-primary" type="submit" onClick="register()" value="注册"
							style="color:white;">注册
						</button>
					</div>
				</form>
			</div>
			
	        <div id="mpanel1" style="display:none;margin-top: 83px;
    position: relative;
    left: 490px;">
	        </div>
	        <script>

	        function openLogin(){
	        	   document.getElementById("mpanel1").style.display="";
	        	}
	        	function closeLogin(){
	        	   document.getElementById("mpanel1").style.display="none";
	        	}
        </script>
	        
		</div>
	</div>
	<script>
    var code = "6f3b22a5f28c40509cd17473597b405e"//没啥用，只是方便测试
	  window.onload = function(){
	    var oForm = document.getElementById('loginForm');
	    var registerForm = document.getElementById('registerForm');
	  	var forgetForm = document.getElementById('forgetForm');
	   
	  	var oUser = document.getElementById('userName');//用户名
	    var oPswd = document.getElementById('input-password');//密码
	    var oRemember = document.getElementById('remember');
	    
	    var input_pwd = document.getElementById('input-password');
		//var salt = document.getElementById('salt');
		var md5_pwd = document.getElementById('loginPassword');
        var checkEmail = document.getElementById("checkEmail")
        var checkEmailByUser = document.getElementById("checkEmailByUser")
	    //页面初始化时，如果帐号密码cookie存在则填充
	    if(getCookie('userName') && getCookie('input-password')){
	      oUser.value = getCookie('userName');
	      oPswd.value = getCookie('input-password');
	      oRemember.checked = true;
	    }
	    //复选框勾选状态发生改变时，如果未勾选则清除cookie
	    oRemember.onchange = function(){
	      if(!this.checked){
	        delCookie('userName');
	        delCookie('input-password');
	      }
	    };
	    
	    $('#mpanel1').slideVerify({

			type : 2,
			mode : 'fixed',
			vOffset : 5,
			vSpace : 5,
			explain : '向右滑动完成验证',
			imgUrl : 'image/',
			imgName : ['pika3.jpg', 'pika2.jpg', 'pika1.jpg'],
			imgSize : {
				width: '400px',
				height: '200px',
			},
			blockSize : {
				width: '40px',
				height: '40px',
			},
			barSize : {
				width: '400px',
				height : '40px',
			}, 	
			ready : function() {
			},
			success : function() {
				md5_pwd.value = $.md5(input_pwd.value);	
				if(remember.checked){
				      setCookie('userName',oUser.value,7); //保存帐号到cookie，有效期7天
				      setCookie('input-password',oPswd.value,7); //保存密码到cookie，有效期7天
				}
				      oForm.submit();
			},
			error : function() {
				closeLogin();
				alert('验证码不匹配！');
			}

		});

	    
        
      checkEmailByUser.onclick = function() {
            console.log("checkEmailByUser");
            if( $("#forget-username").val()==''){
                alert('用户名不能为空');
                return;
            }
          $.ajax({
             async:true,
                url: "/checkEmailByUser.do",
                type: "POST",
                data:{"userName":document.getElementById("forget-username").value},
                dataType: "json",
                success:function(data){
                 //console.log(data);
                 //console.log(data.code);
                 code = data.code;
                }
              });
   }
   
	    registerForm.onsubmit = function(){
	    	//alert("submit");
	    	
	    	var emailCode = document.getElementById("emailCode");//输入的验证码
	   		var p1 = document.getElementById("register-password");//设置密码
	   		var p2 = document.getElementById("register-repassword");//重复输入密码
	   		var md5_registerpwd = document.getElementById('registerUserPassWord');
	   		
    		if(emailCode.value != code) {
    			alert("邮箱验证码错误");
	    		 return false;
	    	 }
	   		 if(p1.value === p2.value) {
	   			// alert("bingo"+p1.value+" "+p2.value);
	   			  // 把用户输入的明文变为MD5:
	   			  md5_registerpwd.value = $.md5(p1.value);
    			  // alert("bingo"+p1+" "+p2+" "+md5_pwd.value);
	    			// console.log("md:" + md5_pwd.value);
	    		  //alert("bingo"+p1+" "+p2+" "+md5_pwd.value);
	    		 return true;
	    	 }else{
	   			 alert("两次密码不相同");
	   			 return false;
	   		 }
	   		 return true;
	    }

	
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
	   
	 







	  //爱心动画点击效果
	  !function (e, t, a) {
		  function r() {
			  for (var e = 0; e < s.length; e++) s[e].alpha <= 0 ? (t.body.removeChild(s[e].el), s.splice(e, 1)) : (s[e].y--, s[e].scale += .004, s[e].alpha -= .013, s[e].el.style.cssText = "left:" + s[e].x + "px;top:" + s[e].y + "px;opacity:" + s[e].alpha + ";transform:scale(" + s[e].scale + "," + s[e].scale + ") rotate(45deg);background:" + s[e].color + ";z-index:99999");
			  requestAnimationFrame(r)
		  }

		  function n() {
			  var t = "function" == typeof e.onclick && e.onclick;
			  e.onclick = function (e) {
				  t && t(), o(e)
			  }
		  }

		  function o(e) {
			  var a = t.createElement("div");
			  a.className = "heart", s.push({
				  el: a,
				  x: e.clientX - 5,
				  y: e.clientY - 5,
				  scale: 1,
				  alpha: 1,
				  color: c()
			  }), t.body.appendChild(a)
		  }

		  function i(e) {
			  var a = t.createElement("style");
			  a.type = "text/css";
			  try {
				  a.appendChild(t.createTextNode(e))
			  } catch (t) {
				  a.styleSheet.cssText = e
			  }
			  t.getElementsByTagName("head")[0].appendChild(a)
		  }

		  function c() {
			  return "rgb(" + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + ")"
		  }

		  var s = [];
		  e.requestAnimationFrame = e.requestAnimationFrame || e.webkitRequestAnimationFrame || e.mozRequestAnimationFrame || e.oRequestAnimationFrame || e.msRequestAnimationFrame || function (e) {
			  setTimeout(e, 1e3 / 60)
		  }, i(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"), n(), r()
	  
	  }(window, document);

	  };
  }
  //重置密码
  function forget(){
      var username = $("#forget-username").val(),
          password = $("#forget-password").val(),
          forgetCode = $("#forget-code").val(),
          flag = false,
          validatecode = null;
      //判断用户名密码是否为空
      if(username == ""){
          $.pt({
              target: $("#forget-username"),
              position: 'r',
              align: 't',
              width: 'auto',
              height: 'auto',
              content:"用户名不能为空"
          });
          flag = true;
      }
      if(password == ""){
          $.pt({
              target: $("#forget-password"),
              position: 'r',
              align: 't',
              width: 'auto',
              height: 'auto',
              content:"密码不能为空"
          });
          flag = true;
      }
      //用户名只能是15位以下的字母或数字
      var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
      if(!regExp.test(username)){
          $.pt({
              target: $("#forget-username"),
              position: 'r',
              align: 't',
              width: 'auto',
              height: 'auto',
              content:"用户名必须为15位以下的字母或数字"
          });
          flag = true;
      }
      //检查用户名是否存在
      //调后台方法

      //检查注册码是否正确
      if(forgetCode != code){
          $.pt({
              target: $("#forget-code"),
              position: 'r',
              align: 't',
              width: 'auto',
              height: 'auto',
              content:"注册码不正确"
             });
          flag = true;
      }



      if(flag){
          alert("false");
      }else{//重置密码
          forgetForm.submit();
      }
  }

	  //设置cookie
	  function setCookie(name,value,day){
	    var date = new Date();
	    date.setDate(date.getDate() + day);
	    document.cookie = name + '=' + value + ';expires='+ date;
	  };
	  //获取cookie
	  function getCookie(name){
	    var reg = RegExp(name+'=([^;]+)');
	    var arr = document.cookie.match(reg);
	    if(arr){
	      return arr[1];
	    }else{
	      return '';
	    }
	  };
	  
	  //删除cookie
	  function delCookie(name){
	    setCookie(name,null,-1);
	  };




	</script>

</body>
</html>
