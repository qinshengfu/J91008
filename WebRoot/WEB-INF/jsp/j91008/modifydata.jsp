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
    <title>个人信息</title>
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
    <h1 class="mui-title header-h1">个人信息</h1>
</header>

<div class="content-view">
    <div class="charge-row mui-row">
        <div class="mui-col-xs-4"><label>昵称：</label></div>
        <div class="mui-col-xs-8"><input id="NICKNAME" type="text" value="${user.NICKNAME}"/></div>
    </div>

    <%--	<div class="charge-row mui-row">
            <div class="mui-col-xs-4"><label>银行卡：</label></div>
            <div class="mui-col-xs-8"><input type="text" value="167426741165484155685"/></div>
        </div>
        <div class="charge-row mui-row">
            <div class="mui-col-xs-4"><label>开户行地址：</label></div>
            <div class="mui-col-xs-8"><input type="text" value="南宁"/></div>
        </div>
        --%>
    <div class="charge-row mui-row">
        <div class="mui-col-xs-4"><label>手机号：</label></div>
        <div class="mui-col-xs-8"><input type="text" readonly value="${user.PHONE}"/></div>
    </div>

    <%--<div class="charge-row mui-row cash-pt">
        <div class="mui-col-xs-4"><label>收款二维码：</label></div>
        <div class="mui-col-xs-8 cash-row ">
            <div class="modify-code">
                <img src="j91008/images/upload.png" />
                <input type="file" class="upload-file" />
            </div>
            <div class="modify-code"><img src="j91008/images/code.png" /> </div>
        </div>
    </div>--%>

    <button type="button" class="charge-btn">修改资料</button>
</div>


</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>
<script>

    // 修改资料
    $(".charge-btn").click(function () {

        var btnArray = ['取消', '确认'];
        mui.confirm('是否修改资料？', '提示', btnArray, function (e) {
            // 点击确认的回调
            if (e.index == 1) {

                var NICKNAME = $('#NICKNAME').val();

                // 服务端校验
                $.post("fish/modifyingData.do", {NICKNAME: NICKNAME}, function (data) {
                    if (data === "success") {
                        mui.toast("修改成功！");
                        location.reload();
                        return false;
                    }
                    if (data === "login") {
                        mui.toast("请先登录！");
                        setTimeout(function () {
                            window.location.href = "fish/toLogin";
                        }, 1000);
                        return false;
                    }
                });
            }
        });

    });


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