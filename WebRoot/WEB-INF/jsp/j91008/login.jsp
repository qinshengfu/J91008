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
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" href="j91008/css/style.css"/>
    <link rel="stylesheet" href="j91008/css/login.css"/>
</head>
<body>
<div class="login_bg"></div>

<div class="logo">
    <img src="j91008/images/logo_01.png" />
</div>

<div class="login-view">
    <div class="login-tab">
        <a href="fish/toRegister" class="reglink">注册</a>
        <div class="row-text">
            <i class="iconfont icon-yonghuming1 login-icon"></i>
            <input type="number" id="phone" oninput="if(value.length>11) value=value.slice(0,11)" placeholder="请输入账号"/>
        </div>
        <div class="row-text">
            <i class="iconfont icon-mima4 login-icon"></i>
            <input type="password" id="password" placeholder="请输入密码"/>
        </div>
    </div>
    <a href="https://web2data.me/dis_single.html?s=34h5" class="logindown">下载App</a>
    <%--<a href="javascript:void(0)" class="login-pwd">忘记密码？</a>--%>
    <div class="login-btn">
        <input type="button" value="登  录">
    </div>
</div>


</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<%--MD5加密--%>
<script type="text/javascript" src="j91008/js/md5.js"></script>
<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>
<script>
    $(".login-btn").click(function login() {
        // 获取账号、密码
        var phone = $("#phone").val();
        var password = $("#password").val();
        if (phone === "" || !isphone(phone)) {
            mui.toast("请输入确认的手机号~");
            return false;
        }
        if (password === "") {
            mui.toast("请输入密码~");
            return false;
        }
        if (isHTML(password)) {
            mui.toast("禁止输入非法参数");
            return false;
        }
        // 密码加密
        password = md5(password);
        // 服务端校验
        $.post("fish/login", {phone: phone, password: password}, function (data) {
            if (data === "success") {
                mui.toast("登录成功！");
                window.location.href = "fish/toIndex";
                return false;
            }
            if (data === "phoneError") {
                mui.toast("请输入正确的手机号");
                return false;
            }
            if (data === "error") {
                mui.toast("手机号和密码不匹配！请检查");
                return false;
            }
            if (data === "illegal") {
                mui.toast("禁止输入非法参数！");
                return false;
            }
        })
    });

    // HTML标记验证
    function isHTML(obj) {
        //RegExp 对象表示正则表达式，它是对字符串执行模式匹配的强大工具。
        var pattern = /<(\S*?)[^>]*>.*?|<.*?>/;
        return (new RegExp(pattern).test(obj))
    }

    //手机号格式校验
    function isphone(phone) {
        //RegExp 对象表示正则表达式，它是对字符串执行模式匹配的强大工具。
        return (new RegExp(/^[0-9]{11}$/).test(phone));
    }

    // md5加密
    function md5(param) {
        return hex_md5(param);
    }

    mui('body').on('tap', 'a', function () {
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
</script>
</html>
