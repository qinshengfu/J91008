<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>

<html>
<base href="<%=basePath%>">
	<head>
		<meta charset="utf-8">
		<title>找回密码</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="j91008/css/mui.min.css">
		<link rel="stylesheet" href="j91008/fonts/iconfont.css" />
		<link rel="stylesheet" href="j91008/css/style.css" />
		<link rel="stylesheet" href="j91008/css/login.css" />
	</head>
	<body>
		<header class="mui-bar mui-bar-nav headernav-bg">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
			<h1 class="mui-title header-h1">找回密码</h1>
		</header>
	   	<div class="content-view">
	    	<div class="register-view">
	    		<div class="login-tab">
	    			<div class="reg-row">
		    			<i class="iconfont icon-shouji4 reg-icon"></i>
						<div class="reg-phone">
			                <select class="reg-select">
			                    <option value="1">+86中国</option>
			                    <option value="2">+80中国</option>
			                </select>
			                <!--<span>+86中国</span>-->
			            </div>
			            <div class="reg-phone1">
			                <input type="text" placeholder="请输入手机号" />
			            </div>
					</div> 
		    		<div class="reg-row">
		    			<i class="iconfont icon-yanzhengma2 reg-icon"></i>
		    			<input type="text" placeholder="请输入验证码"/>
		    			<button class="login-auth"><img src="j91008/j91008/images/00.png" /></button>
		    		</div> 
		    		<div class="reg-row">
		    			<i class="iconfont icon-yanzhengma2 reg-icon"></i>
		    			<input type="text" placeholder="请输入短信验证码"/>
		    			<input type="button" value="获取验证码" onclick="settime(this)" class="forget-auth"/>
		    		</div>  		    				    		
					<div class="reg-row">
		    			<i class="iconfont icon-mima4 reg-icon"></i>
		    			<input type="password" placeholder="请输入密码"/> 			
		    		</div>  
	    		</div>   		
	    		<div class="login-btn">
		            <input type="button" class="login-btn-input" value="注册">
		        </div> 		      		          
	    	</div>	    		    	
	    </div>    
	</body>
    <script type="text/javascript" src="j91008/j91008/js/mui.min.js" ></script>
	<script type="text/javascript">
		mui('body').on('tap', 'a', function() {
            var id = this.getAttribute('href');
            var href = this.href;
            mui.openWindow({
                id: id,
                url: this.href,
                show: {
                    autoShow: true
                }
            });
        }); 
		var countdown = 60;
		function settime(obj) {    
			if(countdown == 0) {        
				obj.removeAttribute("disabled");           
				obj.value = "免费获取验证码";        
				countdown = 60;        
				return;    
			} else {        
				obj.setAttribute("disabled", true);        
				obj.value = "重新发送(" + countdown + ")";			        
				countdown--;    
			}
			setTimeout(function() {    
				settime(obj)
			}    , 1000)
		}
		
	</script>
</html>
