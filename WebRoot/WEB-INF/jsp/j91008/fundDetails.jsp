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
    <title>奖金明细</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" href="j91008/css/style.css"/>
</head>
<body>
<header class="mui-bar mui-bar-nav headernav-bg">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
    <h1 class="mui-title header-h1">奖金明细</h1>
</header>
<div class="content-view">
    <ul class="mui-table-view fund-view">

        <c:forEach items="${bonusRec}" var="pd">
            <li class="mui-table-view-cell fund-cell">
                <div class="mui-row">
                    <div class="mui-col-xs-8">
                        <p class="fund-number">${user.PHONE}</p>
                        <c:if test="${pd.STATE == 1}">
                            <p class="fund-row">类型：${pd.TYPE}</p>
                        </c:if>
                        <c:if test="${pd.WITHDRAW_TYPE > 0 }">
                            <p class="fund-row">类型：提现:</p>
                        </c:if>
                        <c:if test="${pd.PAYMENT_TYPE > 0}">
                            <p class="fund-row">类型：充值</p>
                        </c:if>
                        <p class="fund-row">时间：${pd.GMT_CREATE}</p>
                    </div>
                    <div class="mui-col-xs-4 mui-text-right">
                        <c:if test="${pd.STATE == 1 }">
                            <p class="fund-row">数量：<span class="fund-text">+${pd.NUMBER}</span></p>
                        </c:if>
                        <c:if test="${pd.PAYMENT_TYPE > 0}">
                            <p class="fund-row">数量：<span class="fund-text">+${pd.NUMBER}</span></p>
                        </c:if>
                        <c:if test="${pd.WITHDRAW_TYPE > 0 and pd.IS_AUDITING < 2 }">
                            <p class="fund-row">数量：<span class="fund-text1">-${pd.NUMBER}</span></p>
                        </c:if>
                        <c:if test="${pd.WITHDRAW_TYPE > 0 and pd.IS_AUDITING == 2}">
                            <p class="fund-row">数量：<span class="fund-text">+${pd.NUMBER}</span></p>
                        </c:if>
                        <c:if test="${pd.STATE == 1}">
                        <p class="fund-row">状态：已完成</p>
                        </c:if>
                        <c:if test="${pd.IS_AUDITING == 1}">
                            <p class="fund-row">状态：已审核</p>
                        </c:if>
                        <c:if test="${pd.IS_AUDITING == 0}">
                            <p class="fund-row">状态：未审核</p>
                        </c:if>
                        <c:if test="${pd.IS_AUDITING == 2}">
                            <p class="fund-row">状态：驳回</p>
                        </c:if>


                    </div>
                </div>
            </li>
        </c:forEach>

    </ul>
</div>
</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>
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
