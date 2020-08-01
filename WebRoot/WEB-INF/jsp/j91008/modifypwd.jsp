<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<base href="<%=basePath%>">
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="j91008/css/style.css"/>
</head>
<body>
<header class="mui-bar mui-bar-nav headernav-bg">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
    <h1 class="mui-title header-h1">修改密码</h1>
</header>

<div class="content-view">
    <div class="charge-row mui-row">
        <div class="mui-col-xs-4"><label>旧密码</label></div>
        <div class="mui-col-xs-8"><input id="oid" type="password" placeholder="请输入旧密码"/></div>
    </div>
    <div class="charge-row mui-row">
        <div class="mui-col-xs-4"><label>新密码</label></div>
        <div class="mui-col-xs-8"><input id="new" type="password" placeholder="请输入新密码"/></div>
    </div>
    <div class="charge-row mui-row noborderb">
        <div class="mui-col-xs-4"><label>确认密码</label></div>
        <div class="mui-col-xs-8"><input id="confirm" type="password" placeholder="请确认新密码"/></div>
    </div>
    <button type="button" class="charge-btn">确定</button>
</div>


</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<%--MD5加密--%>
<script type="text/javascript" src="j91008/js/md5.js"></script>
<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>
<script>

    $(".charge-btn").click(function(){
        // 旧密码、新密码、确认密码
        var old_password = $("#oid").val();
        var new_password = $("#new").val();
        var confirm_password = $("#confirm").val();

        if (old_password === '') {
            mui.toast("请输入旧密码！");
            return false;
        }
        if (new_password === '') {
            mui.toast("请输入新密码！");
            return false;
        }
        if (confirm_password === '') {
            mui.toast("请输入确认密码！");
            return false;
        }
        if (new_password !== confirm_password) {
            mui.toast("新密码和确认密码不一致！");
            return false;
        }

        // 密码加密
        old_password = md5(old_password);
        new_password = md5(new_password);
        confirm_password = md5(confirm_password);
        // 封装到数组
        var array = [];
        array.push(old_password);
        array.push(new_password);
        array.push(confirm_password);

        // 服务端校验
        $.ajax({
            url : "fish/editPws.do",
            type : "post",
            data : {renInfo:array},
            traditional : true, //传集合或者数组到后台service接收
            success : function(data) { //回调函数
                if (data === "success") {
                    mui.toast("修改成功！");
                    window.location.href="fish/toCenter.do";
                    return false;
                }
                if (data === "oidErroe") {
                    mui.toast("旧密码错误");
                    return false;
                }
                if (data === "newErroe") {
                    mui.toast("新密码和确认密码不一致！");
                    return false;
                }
            }
        });

    });

    // md5加密
    function md5(param) {
        return hex_md5(param);
    }

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