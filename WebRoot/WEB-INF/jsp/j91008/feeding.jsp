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
    <title>喂养</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="j91008/css/style.css"/>
</head>
<body>
<header class="mui-bar mui-bar-nav headernav-bg jump">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
    <h1 class="mui-title header-h1">喂养</h1>
</header>
<div class="content-view content-nav">
    <!--轮播图start-->
    <div id="slider" class="mui-slider slider-height1">
        <div class="mui-slider-group mui-slider-loop">

            <div class="mui-slider-item mui-slider-item-duplicate">
                <a href="#" style="display: none"><img src="j91008/images/index00.png"></a>
            </div>

            <c:forEach items="${pic}" var="pd">
                <div class="mui-slider-item">
                    <a href="#"><img src="${pd.PIC_PATH}"></a>
                </div>
            </c:forEach>

            <div class="mui-slider-item mui-slider-item-duplicate">
                <a href="#" ><img src="${pic[0].PIC_PATH}"></a>
            </div>

        </div>
    </div>
    <!--轮播图end-->
    <div class="feeding-pb">
        <div class="feeding-view-flex">
            <div class="feeding-content">
                <div class="feeding-tab">
                    <img src="j91008/images/feeding.png"/>
                </div>
                <div class="feeding-view">
                    <p>名称：鱼料</p>
                    <p>价格：${par.FEED_PRICE}</p>
                    <button class="feeding-btn">喂养小鱼</button>
                </div>
            </div>
            <div class="feeding-content">
                <div class="feeding-tab">
                    <img src="j91008/images/feeding.png"/>
                </div>
                <div class="feeding-view">
                    <p>名称：鱼料</p>
                    <p>价格：${par.FEED_PRICE}</p>
                    <button class="feeding-btn">喂养小鱼</button>
                </div>
            </div>
        </div>
        <div class="feeding-view-flex">
            <div class="feeding-content">
                <div class="feeding-tab">
                    <img src="j91008/images/feeding.png"/>
                </div>
                <div class="feeding-view">
                    <p>名称：鱼料</p>
                    <p>价格：${par.FEED_PRICE}</p>
                    <button class="feeding-btn">喂养小鱼</button>
                </div>
            </div>
            <div class="feeding-content">
                <div class="feeding-tab">
                    <img src="j91008/images/feeding.png"/>
                </div>
                <div class="feeding-view">
                    <p>名称：鱼料</p>
                    <p>价格：${par.FEED_PRICE}</p>
                    <button class="feeding-btn">喂养小鱼</button>
                </div>
            </div>
        </div>
    </div>

</div>

<footer>
    <nav class="mui-bar mui-bar-tab nav-bg1 jump">
        <a class="mui-tab-item nav-item" href="fish/toIndex.do">
            <span class="mui-icon iconfont icon-shouye8"></span>
            <span class="mui-tab-label">领养</span>
        </a>
        <a class="mui-tab-item nav-item mui-active" href="fish/toFeeding.do">
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
    // 喂养小鱼
    $(".feeding-btn").click(function () {
        var btnArray = ['取消', '确认'];
        mui.confirm('是否喂养？', '喂养', btnArray, function (e) {
            // 点击确认的回调
            if (e.index == 1) {
                // 验证余额是否足够
                var money = ${user.MONEY};
                var phone = '${user.PHONE}';
                if (money < 50) {
                    mui.toast('饲料不足，请先充值！');
                    return false;
                }
                // 服务端校验
                $.post("fish/feedFish.do", {PHONE: phone}, function (data) {
                    if (data === "success") {
                        mui.toast("喂养成功！");
                        return false;
                    }
                    if (data === "login") {
                        mui.toast("请先登录！");
                        setTimeout(function () {
                            window.location.href = "fish/toLogin";
                        }, 1000);
                        return false;
                    }
                    if (data === "less") {
                        mui.toast("饲料不足，请先充值！");
                        return false;
                    }
                    if (data === "MaxFeed") {
                        mui.toast("今天喂养已上限！");
                        return false;
                    }
                });
            }
        });
    });


    var slider = mui("#slider");
    slider.slider({
        interval: 5000
    });



    mui('body').on('tap', '.jump a', function () {
        var href = this.getAttribute('href');
        location.href=href
    });
</script>

</html>