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
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="j91008/css/style.css"/>
</head>
<body>
<div class="indexbg"></div>
<div class="index-content">
    <!--header -->
    <div class="index_header mui-row">
        <div class="index_header_tab1 mui-col-xs-3">
            <a href="fish/toCharge.do">
                <div class="index_header_charge_cash">充值</div>
            </a>
            <a href="fish/toCash.do">
                <div class="index_header_charge_cash index_header_cash_mt">提现</div>
            </a>
        </div>
        <div class="index_header_tab2 mui-col-xs-5">
            <div class="index_header_feed">
                <img src="j91008/images/add.png" class="index_header_feed_add"/>
                <%--饲料--%>
                <b>${user.MONEY}</b>
                <img src="j91008/images/feed.png" class="index_header_feed_img"/>
            </div>
        </div>
        <div class="index_header_tab3 mui-col-xs-4">
            <div class="index_header_number_today">
                <%--推荐人数--%>
                <b class="number">${user.RECOMMENDED_NUMBER}</b>
                <img src="j91008/images/today.png" class="index_header_number_img"/>
            </div>
            <div class="index_header_number_today index-mt">
                <%--今日喂养--%>
                <b class="number">${user.FEEDING_TODAY}</b>
                <img src="j91008/images/number.png" class="index_header_number_img"/>
            </div>
        </div>
    </div>
    <div class="fish">
        <img src="j91008/images/fish.gif"/>
    </div>

    <c:if test="${user.IS_ADOPTION==0}" >
    <div class="index_adoption">
        <button>领养</button>
    </div>
    </c:if>
</div>


<footer>
    <nav class="mui-bar mui-bar-tab nav-bg">
        <a class="mui-tab-item nav-item mui-active" href="fish/toIndex.do">
            <span class="mui-icon iconfont icon-shouye8"></span>
            <span class="mui-tab-label">领养</span>
        </a>
        <a class="mui-tab-item nav-item" href="fish/toFeeding.do">
            <span class="mui-icon iconfont icon-weiyang"></span>
            <span class="mui-tab-label">喂养</span>
        </a>
        <a class="mui-tab-item nav-item" href="fish/toPlatoon.do">
            <span class="mui-icon iconfont icon-dingdan7"></span>
            <span class="mui-tab-label">公排</span>
        </a>
        <a class="mui-tab-item nav-item" href="fish/toCenter.do">
            <span class="mui-icon iconfont icon-huiyuan21"></span>
            <span class="mui-tab-label">我的</span>
        </a>
    </nav>
</footer>
</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>
<script>
    // 领养小鱼
    $(".index_adoption").click(function adopt() {
        var btnArray = ['取消', '确认'];
        mui.confirm('领养需要1元饲料，是否领养？', '领养', btnArray, function(e) {
            // 点击确认的回调
            if (e.index == 1) {
                // 验证余额是否足够
                var money = ${user.MONEY};
                var phone = '${user.PHONE}';
                if(money <= 0){
                    mui.toast('饲料不足，请先充值！');
                    return false;
                }
                // 服务端校验
                $.post("fish/adopt",{PHONE:phone},function(data) {
                    if (data === "success") {
                        mui.toast("领养成功！");
                       location.reload();
                        return false;
                    }
                    if (data === "login") {
                        mui.toast("请先登录！");
                        window.location.href="fish/toLogin";
                        return false;
                    }
                    if (data === "less") {
                        mui.toast("饲料不足，请先充值！");
                        return false;
                    }
                });
            }
        });
    });


    mui('body').on('tap', 'a', function () {
        var href = this.getAttribute('href');
        location.href=href
    });
</script>

</html>