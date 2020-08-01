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
    <title>提现</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" href="j91008/css/style.css"/>
    <link rel="stylesheet" href="j91008/css/mui.picker.css"/>
    <link rel="stylesheet" href="j91008/css/mui.poppicker.css"/>
    <style>
        .mui-poppicker-header {
            background-color: #fff;
        }

        .mui-pciker-list li {
            font-size: 14px;
            color: #666;
        }

        .mui-poppicker {
            height: 190px;
        }

        .mui-pciker-list, .mui-pciker-rule {
            top: 23%;
        }

        .mui-poppicker-body .mui-picker {
            background-color: #fff;
        }

        .mui-poppicker-body {
            border-top: 1px solid #d8d8d8;
        }

        .mui-pciker-list li.highlight {
            color: #333;
        }
    </style>
</head>
<body>
<header class="mui-bar mui-bar-nav headernav-bg">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
    <h1 class="mui-title header-h1">提现</h1>
</header>

<div class="content-view">
    <div class="charge-content">
        <div class="charge-row mui-row">
            <div class="mui-col-xs-4"><label>饲料：</label></div>
            <div class="mui-col-xs-8 mui-text-right cash-row">${user.MONEY}</div>
        </div>
        <div class="charge-row mui-row">
            <div class="mui-col-xs-4"><label>提现现金：</label></div>
            <div class="mui-col-xs-8"><input type="number" id="cash" placeholder="请输入提现金额" oninput="synchro(this.value)"
                                             class="cash-input"/></div>
        </div>
        <div class="charge-row mui-row">
            <div class="mui-col-xs-4"><label>手续费：</label></div>
            <div class="mui-col-xs-8 mui-text-right cash-row colorred" id="brokerage"></div>
        </div>
        <div class="charge-row mui-row">
            <div class="mui-col-xs-5"><label>预计到账金额：</label></div>
            <div class="mui-col-xs-7 mui-text-right cash-row"><input type="number" id="show" readonly
                                                                     class="cash-input"/></div>
        </div>
        <div class="charge-row mui-row charge-pt">
            <div class="mui-col-xs-4"><label>提现方式：</label></div>
            <div class="mui-col-xs-8">
                <button id='showUserPicker' class="mui-btn mui-btn-block charge-btn-text" type='button'>请选择提现方式</button>
                <i class="iconfont icon-down-trangle select-icon"></i>
            </div>
        </div>

        <div class="charge-row mui-row assets" id="bank" hidden="">
            <div class="mui-col-xs-3"><label>银行卡：</label></div>
            <div class="mui-col-xs-9 mui-text-right cash-row ">
                <input id="num3" class="cash-input" type="number" maxlength="40" value="" placeholder="请输入银行卡号"/>
            </div>
        </div>
        <div class="charge-row mui-row assets " id="weixin" hidden="">
            <div class="mui-col-xs-3"><label>微信：</label></div>
            <div class="mui-col-xs-9 mui-text-right cash-row ">
                <input id="num1" class="cash-input" type="text" maxlength="40" value="" placeholder="请输入收款账号"/>
            </div>
        </div>
        <div class="charge-row mui-row assets " id="zhifb" hidden="">
            <div class="mui-col-xs-3"><label>支付宝：</label></div>
            <div class="mui-col-xs-9 mui-text-right cash-row ">
                <input id="num2" class="cash-input" type="text" maxlength="40" value="" placeholder="请输入收款账号"/>
            </div>
        </div>

        <div class="charge-row mui-row" id="per" hidden="">
            <div class="mui-col-xs-4"><label>收款人：</label></div>
            <div class="mui-col-xs-8"><input type="text" id="name" placeholder="请输入姓名"
                                             class="cash-input"/></div>
        </div>


    </div>
    <button type="button" class="charge-btn">确定提现</button>
</div>


</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<script src="j91008/js/mui.picker.js"></script>
<script src="j91008/js/mui.poppicker.js"></script>
<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>
<script src="static/js/jquery.form.js"></script>
<script>

    // 提现倍数
    var multiple = ${par.CASH_MULTIPLIER};
    // 提现手续费
    var charge =
    ${par.PAYMENT_FEE}

    // 饲料
    var sum = ${user.MONEY};

    // 提现多少钱就显示扣除手续费到账多少钱
    function synchro(num) {
        num -= charge * num
        $("#show").attr({value: num});
    }

    // 支付方式 1：微信，2：支付宝：3银行卡
    function paymentMethod(type) {
        if (type == "微信") {
            return 1;
        }
        if (type == "支付宝") {
            return 2;
        }
        if (type == "银行卡") {
            return 3;
        }
    }

    // 提现
    $(".charge-btn").click(function recharge() {
        // 获取提现多少钱
        var money = $("#cash").val();
        // 获取支付方式
        var type = $("#showUserPicker").text();
        // 验证是否为空
        if (money === "" || money <= 0) {
            mui.toast('请输入大于0的充值数额！');
            return false;
        }
        // 验证饲料是否足够
        if (money > sum) {
            mui.toast("饲料不足！！！")
            return false;
        }
        // 验证钱的格式
        if (money % multiple != 0) {
            mui.toast('请输入' + multiple + ' 的倍数');
            return false;
        }
        // 验证是否为空
        if (type === "请选择提现方式") {
            mui.toast('请选择提现方式！');
            return false;
        }
        var i = paymentMethod(type);
        // 验证提现账号
        var account = $("#num" + i).val();
        if (account == '') {
            mui.toast('请输入收款账号！！！');
            return false;
        }
        // 验证收款人姓名
        var name = $('#name').val();
        if (name == '') {
            mui.toast('请输入收款人姓名！！！');
            return false;
        }
        // 把数据添加到数组中
        var cost = $("#show").val();
        var array = [];
        array.push(money);
        array.push(i);
        array.push('${user.J91008_USER_ID}');
        array.push(account);
        array.push(multiple);
        array.push(cost);
        array.push(name);
        serverCheck(array)
    });

    // 服务器校验
    function serverCheck(array) {

        $.ajax({
            url: "fish/cash.do",
            type: "post",
            data: {recInfo: array},
            traditional: true, //传集合或者数组到后台service接收 阻止jq的深度序列化
            success: function (data) { //回调函数
                if (data === "success") {
                    mui.toast("等待后台审核！");
                    setTimeout(function () {
                        location.reload();
                    }, 2000);
                    return false;
                }
                if (data === "login") {
                    mui.toast("请先登录！");
                    setTimeout(function () {
                        window.location.href = "fish/toLogin";
                    }, 1500);
                    return false;
                }
                if (data === "MaxSum") {
                    mui.toast('提现已达今天封顶次数！');
                    return false;
                }
                if (data === "tooLittle") {
                    mui.toast('请输入大于0的充值数额！');
                    return false;
                }
                if (data === "multipError") {
                    mui.toast('请输入大于' + multiple + ' 的数额');
                    return false;
                }
                if (data === "typeEmpty") {
                    mui.toast('请选择提现类型！');
                    return false;
                }
                if (data === "accoutEmpty") {
                    mui.toast('请输入收款账号！！！');
                    return false;
                }
                if (data === "nameEmpty") {
                    mui.toast('请输入收款人姓名！！！');
                    return false;
                }
            }
        });
    }


    // 图片上传
    function setImg(obj) {
        var f = $(obj).val();
        if (f == null || f == undefined || f == '') {
            return false;
        }
        if (!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f)) {
            mui.toast('请上传图片文件！！！')
            $(obj).val('');
            return false;
        }
        var url = "fish/addPic.do";
        //异步提交表单(先确保jquery.form.js已经引入了)
        console.log(url)
        var options = {
            url: url,
            success: function (data) {
                picture_path = (data + "").trim();
                var sta = picture_path;
                console.log(sta)
                $("img[class=photourlShow]").attr({src: sta});
                $("input[class=picPath]").attr({value: sta});
                $(obj).val('');
                mui.toast('上传成功~')
            }
        };
        $("#Form").ajaxSubmit(options);
    }


    $(function () {
        var brokerage = ${par.PAYMENT_FEE};
        brokerage *= 100;
        console.log(brokerage)
        $("#brokerage").html(brokerage + '%');

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

    (function ($, doc) {
        $.init();
        $.ready(function () {
            /**
             * 获取对象属性的值
             * 主要用于过滤三级联动中，可能出现的最低级的数据不存在的情况，实际开发中需要注意这一点；
             * @param {Object} obj 对象
             * @param {String} param 属性名
             */
            var _getParam = function (obj, param) {
                return obj[param] || '';
            };
            //普通示例
            var userPicker = new $.PopPicker();
            userPicker.setData([{
                value: 'zfb',
                text: '支付宝'
            }, {
                value: 'yhk',
                text: '银行卡'
            }, {
                value: 'wx',
                text: '微信'
            }]);
            var showUserPickerButton = doc.getElementById('showUserPicker');
            showUserPickerButton.addEventListener('tap', function (event) {
                userPicker.show(function (items) {
                    showUserPickerButton.innerText = items[0].text;
                    var zhifb = doc.getElementById('zhifb');
                    var weixin = doc.getElementById('weixin');
                    var bank = doc.getElementById('bank');
                    var per = doc.getElementById('per');
                    zhifb.style.display = "none";
                    bank.style.display = "none";
                    weixin.style.display = "none";
                    per.style.display = "none";
                    if (items[0].text == '支付宝') {
                        zhifb.style.display = "block";
                        per.style.display = "block";
                    } else if (items[0].text == '银行卡') {
                        bank.style.display = "block";
                        per.style.display = "block";
                    } else if (items[0].text == '微信') {
                        weixin.style.display = "block";
                        per.style.display = "block";
                    }
                });
            }, false);
        });
    })(mui, document);
</script>

</html>