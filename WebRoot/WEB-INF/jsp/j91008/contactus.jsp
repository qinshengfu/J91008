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
		<title>联系我们</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="j91008/css/mui.min.css">
		<link rel="stylesheet" href="j91008/fonts/iconfont.css" />
		<link rel="stylesheet" href="j91008/css/style.css" />
	</head>
	<body>
		<header class="mui-bar mui-bar-nav headernav-bg">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
			<h1 class="mui-title header-h1">联系我们</h1>
		</header>
	   	<div class="content-view">
	    	<div class="pwdset-view">
				<div class="pwdset-tab">
					<div class="contact-div">
						<div class="qqimg"></div><%--QQ--%>
						<span class="contact-span">${par.QQ_TOUCH}</span>
					</div>
				</div>
				<div class="pwdset-tab">
					<div class="contact-div">
						<div class="chartimg"></div><%--微信--%>
						<span class="contact-span">${par.WECHAT_TOUCH}</span>
					</div>
				</div>				
			</div>		
	    </div>  
	</body>
    <script type="text/javascript" src="j91008/js/mui.min.js" ></script>
	<script type="text/javascript">

		mui('body').on('tap', 'a', function() {
			var href = this.getAttribute('href');
			if(href != null) {
				//非plus环境，直接走href跳转
				if(!mui.os.plus) {
					location.href = href;
					return;
				}
				if(href) {
					//打开窗口的相关参数
					var options = {
						styles: {
							popGesture: "close"
						},
						setFun: "refreshlocation",
						show: {
							duration: "100", //页面动画持续时间，Android平台默认100毫秒，iOS平台默认200毫秒；
						},
						waiting: {
							autoShow: true, //自动显示等待框，默认为true
						},
					};
					//打开新窗口
					mui.openWindow(href, id, options);
				}
			}
		});
	</script>
</html>
