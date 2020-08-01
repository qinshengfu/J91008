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

<style>
    .invitation-view{
        margin: 0px 20px;
    }
    .share-btn {
        display: block;
        margin: 14px auto;
        border: 0;
        background-color: #037ff0;
        color: #fff;
        border-radius: 16px;
        font-size: 13px;
    }
    .invitation-view p {
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }
</style>

<head>
    <meta charset="utf-8">
    <title>邀请好友</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="j91008/css/style.css"/>
</head>
<body>
<header class="mui-bar mui-bar-nav headernav-nobg">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
    <h1 class="mui-title header-h1">邀请好友</h1>
</header>
<div class="invitationbg"></div>
<div class="content-view">
    <div class="invitation-view">

        <div class="invitation-code">
            <%--二维码 j91008/images/code.png --%>
            <img id="code" src=""/>
        </div>
        <p>扫描二维码 , 加入我们</p>
        <p id="extend_href">推广链接 : </p>
        <button class="share-btn copy" data-clipboard-text=" ">复制链接</button>
    </div>

</div>


</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>

<script type="text/javascript" src="j91008/js/clipboard.min.js" ></script>
<script type="text/javascript" src="j91008/layui/layui.all.js" ></script>

<script>

    // 二维码和链接
    $(function () {
        var context = "<%=basePath%>"+"fish/toRegister.do?tag=" + ${user.PHONE} ;
        $("#code").attr("src", "fish/qr_code.do?phone=" + ${user.PHONE});
        $("#extend_href").html('推广链接 :'+"fish/toRegister.do?phone=" + ${user.PHONE});
        $(".share-btn").attr("data-clipboard-text",context);
    });

    var clipboard = new ClipboardJS('.copy');
    //优雅降级:safari 版本号>=10,提示复制成功;否则提示需在文字选中后，手动选择“拷贝”进行复制
    clipboard.on('success', function (e) {
        layer.msg('复制成功！');
        e.clearSelection();
    });
    clipboard.on('error', function (e) {
        layer.msg('请选择“拷贝”进行复制！');
    });


    mui('body').on('tap', 'a', function () {
        var href = this.getAttribute('href');
        if (href != null) {
            //非plus环境，直接走href跳转
            if (!mui.os.plus) {
                location.href = href;
                return;
            }
            if (href) {
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