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
    <title>公排</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="j91008/css/style.css"/>
</head>
<body>
<header class="mui-bar mui-bar-nav headernav-bg">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1 "></a>
    <h1 class="mui-title header-h1">公排</h1>
</header>

<div class="content-view content-nav">
    <div class="platoon-content">
        <div class="platoon-view">
            当前结算排号：${feedRec[0].ROW_NUMBER}号
        </div>
        <p>共${feedRec.size()}条记录</p>
        <div class="order-view">
            <table width="100%">
                <tbody>
                <tr class="th-body">
                    <th>序号</th>
                    <th>排号</th>
                    <th>时间</th>
                </tr>
                <c:forEach items="${feedRec}" var="pd" varStatus="vs">
                    <tr class="tr-text">
                        <td>${vs.index+1}</td>
                        <td>${pd.ROW_NUMBER}</td>
                        <td>${pd.GMT_CREATE}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>

</div>

<footer>
    <nav class="mui-bar mui-bar-tab nav-bg1">
        <a class="mui-tab-item nav-item " href="fish/toIndex.do">
            <span class="mui-icon iconfont icon-shouye8"></span>
            <span class="mui-tab-label">领养</span>
        </a>
        <a class="mui-tab-item nav-item " href="fish/toFeeding.do">
            <span class="mui-icon iconfont icon-weiyang"></span>
            <span class="mui-tab-label">喂养</span>
        </a>
        <a class="mui-tab-item nav-item mui-active " href="fish/toPlatoon.do">
            <span class="mui-icon iconfont icon-dingdan7"></span>
            <span class="mui-tab-label">公排</span>
        </a>
        <a class="mui-tab-item nav-item " href="fish/toCenter.do">
            <span class="mui-icon iconfont icon-huiyuan21"></span>
            <span class="mui-tab-label">我的</span>
        </a>
    </nav>
</footer>
</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<script>

   mui('body').on('tap', 'a', function () {
       var href = this.getAttribute('href');
       location.href=href
    });



</script>

</html>