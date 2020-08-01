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
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" href="j91008/css/style.css"/>
    <link rel="stylesheet" href="j91008/css/login.css"/>
</head>
<body>
<header class="mui-bar mui-bar-nav headernav-bg">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
    <h1 class="mui-title header-h1">注册</h1>
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
                    <input type="number" id="phone" oninput="if(value.length>11) value=value.slice(0,11)" placeholder="请输入手机号"/>
                </div>
            </div>
            <div class="reg-row">
                <i class="iconfont icon-mima4 reg-icon"></i>
                <input type="password" id="password" placeholder="请输入密码"/>
            </div>
            <div class="reg-row">
                <i class="iconfont icon-mima4 reg-icon"></i>
                <input type="password" id="password1" placeholder="请确认密码"/>
            </div>

            <div class="reg-row">
                <i class="iconfont icon-lianjie11 reg-icon"></i>
                <input type="number" id="extend" oninput="if(value.length>11) value=value.slice(0,11)" value=""/>
                <span class="promotion-text"  >推广号</span>
            </div>
            <div class="agreement mui-checkbox mui-left">
                <input type="checkbox"/> <span>已阅读并同意<a href="javascript:void(0);">《用户协议》</a></span>
            </div>
        </div>
        <div class="login-btn">
            <input type="button" class="login-btn-input" value="注册">
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<%--MD5加密--%>
<script type="text/javascript" src="j91008/js/md5.js"></script>
<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

    $(function(){
        var tag = '${tag}';
        if (tag != '') {
            $('#extend').attr({value:tag});
            $('#extend').attr('readonly','readonly');
        }
    });

    // 当注册按钮被点击后
    $(".login-btn").click(function register () {
        // 获取手机号、密码、确认密码、推广号、是否勾选协议
        var phone = $("#phone").val();
        var password = $("#password").val();
        var password1 = $("#password1").val();
        var extend = $("#extend").val();
        var is_confirm = $("input[type='checkbox']").is(':checked');
        if (phone === "" || !isphone(phone)) {
            mui.toast("请输入确认的手机号~");
            return false;
        }
        if (password === "") {
            mui.toast("请输入密码~");
            return false;
        }
        if (password1 === "") {
            mui.toast("请输入确认密码~");
            return false;
        }
        if (password !== password1){
            mui.toast("密码不一致~");
            return false;
        }
        if (isHTML(password) || isHTML(password1)){
            mui.toast("禁止输入非法参数");
            return false;
        }
        if (extend === "" || !isphone(extend)) {
            mui.toast("请输入确认的推广号~");
            return false;
        }
        if (!is_confirm) {
            mui.toast("需同意用户协议~");
            return false;
        }
        // 把数据封装到数组中
        var record = [];
        record.push(phone);
        record.push(md5(password));
        record.push(md5(password1));
        record.push(extend);
        // 服务端校验
        $.ajax({
            url : "fish/register",
            type : "post",
            data : {USER:record},
            traditional : true, //传集合或者数组到后台service接收
            success : function(data) { //回调函数
                if (data === "success") {
                    mui.toast("注册成功！");
                    window.location.href="fish/toLogin";
                    return false;
                }
                if (data === "phoneError") {
                    mui.toast("请输入正确的手机号");
                    return false;
                }
                if (data === "alreadyExist") {
                    mui.toast("该手机号已被注册请检查！");
                    return false;
                }
                if (data === "passwordError") {
                    mui.toast("密码不一致请检查！");
                    return false;
                }
                if (data === "recommenderError") {
                    mui.toast("推广号错误！");
                    return false;
                }
                if (data === "nonAdoption") {
                    mui.toast("推广人未领养不可当推荐人！");
                    return false;
                }
                if (data === "illegal") {
                    mui.toast("禁止输入非法参数！");
                    return false;
                }
            }
        })

    });


    // HTML标记验证
    function isHTML (obj) {
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
