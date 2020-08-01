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
    <title>充值</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" href="j91008/css/style.css"/>
    <link rel="stylesheet" href="j91008/css/mui.picker.css"/>
    <link rel="stylesheet" href="j91008/css/mui.poppicker.css"/>
    <link rel="stylesheet" href="j91008/css/mui.picture.css"/>
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
    <h1 class="mui-title header-h1">充值</h1>
</header>

<div class="content-view">
    <div class="charge-content">
        <div class="charge-row mui-row">
            <div class="mui-col-xs-4"><label>充值现金：</label></div>
            <div class="mui-col-xs-8"><input type="number" oninput="synchro(this.value)" placeholder="请输入要充值的现金"/></div>
        </div>
        <div class="charge-row mui-row charge-pt">
            <div class="mui-col-xs-6"><label>需要支付的RMB为：</label></div>
            <div class="mui-col-xs-6"><input type="number" id="payment" readonly value="0"/></div>
            <!--<div class="mui-col-xs-6 cash-row">154</div>-->
        </div>
        <div class="charge-row mui-row charge-pt">
            <div class="mui-col-xs-4"><label>支付方式：</label></div>
            <div class="mui-col-xs-8">
                <button id='showUserPicker' class="mui-btn mui-btn-block charge-btn-text" type='button'>请选择付款方式</button>
                <i class="iconfont icon-down-trangle select-icon"></i>
            </div>
        </div>

        <form id="Form" enctype='multipart/form-data' method='post'>
            <div class="charge-row mui-row assets" id="bank" hidden="">
                <div class="mui-col-xs-3"><label>银行卡：</label></div>
                <div class="mui-col-xs-9 mui-text-right cash-row">
                    <input type="number" value="${par.BANK_NUMBER}" readonly="readonly" class="cash-input" >
                </div>
            </div>
            <div class="charge-row-code mui-row charge-pt assets cash-pt" id="bank1" hidden="">
                <div class="mui-col-xs-3"><label>支付凭证：</label></div>
                <div class="mui-col-xs-9">
                    <input class="picPath" type="hidden" value=""/>
                    <div class="charge-code">
                        <img class="photourlShow" src="j91008/images/upload.png"/>
                        <input type="file" name="pictureFile" class="upload-file" onchange="setImg(this)"/>
                    </div>
                </div>
            </div>
            <div class="charge-row-code mui-row charge-pt assets cash-pt" id="zhifb" hidden="">
                <div class="mui-col-xs-5"><label>支付宝收款码：</label></div>
                <div class="mui-col-xs-7">
                    <div class="charge-code enlarge"><img src="${par.ALIPAY}" data-preview-src="" data-preview-group="1" /></div>
                </div>
            </div>
            <div class="charge-row-code mui-row charge-pt assets cash-pt" id="zhifb1" hidden="">
                <div class="mui-col-xs-5"><label>支付凭证：</label></div>
                <div class="mui-col-xs-7">
                    <input class="picPath" type="hidden" value=""/>
                    <div class="charge-code">
                        <img class="photourlShow" src="j91008/images/upload.png" />
                        <input type="file" name="pictureFile" class="upload-file" onchange="setImg(this)"/>
                    </div>
                </div>
            </div>

            <div class="charge-row-code mui-row charge-pt assets cash-pt" id="weixin" hidden="">
                <div class="mui-col-xs-4"><label>微信收款码：</label></div>
                <div class="mui-col-xs-8">
                    <div class="charge-code enlarge"><img src="${par.WECHAT}" data-preview-src="" data-preview-group="2" /></div>
                </div>
            </div>
            <div class="charge-row-code mui-row charge-pt assets cash-pt" id="weixin1" hidden="">
                <div class="mui-col-xs-4"><label>支付凭证：</label></div>
                <div class="mui-col-xs-8">
                    <input class="picPath" type="hidden" value=""/>
                    <div class="charge-code">
                        <img class="photourlShow" src="j91008/images/upload.png"/>
                        <input type="file" name="pictureFile" class="upload-file" onchange="setImg(this)"/>
                    </div>
                </div>
            </div>
        </form>

    </div>
    <button type="button" class="charge-btn">确定充值</button>
</div>


</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<script src="j91008/js/mui.picker.js"></script>
<script src="j91008/js/mui.poppicker.js"></script>
<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>
<%--图片点击放大--%>
<script src="j91008/js/mui.zoom.js"></script>
<script src="j91008/js/mui.previewimage.js"></script>

<%-- form表单ajax提交 --%>
<script src="static/js/jquery.form.js"></script>
<script>

    //点击图片放大（事件）
    mui('.charge-row-code').on('tap', '.enlarge', function() {
        mui.previewImage();//调用函数
    })


    // 充值多少钱就显示需要支付多少钱
    function synchro(num) {
        $("#payment").attr({value: num});
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

    // 充值
    $(".charge-btn").click(function recharge() {
        // 获取充值多少钱
        var money = $("#payment").val();
        console.log(money);
        // 获取支付方式
        var type = $("#showUserPicker").text();
        console.log(type);
        // 验证是否为空
        if (money === "" || money <= 0) {
            mui.toast('请输入大于0的充值数额！');
            return false;
        }
        // 验证钱的格式
        if (!isMoney(money)) {
            mui.toast('请输入正确的数额，最多保留2位小数！');
            return false;
        }
        // 验证是否为空
        if (type === "请选择付款方式") {
            mui.toast('请选择支付类型！');
            return false;
        }
        // 验证支付凭证
        var voucher = $("input[class=picPath]").val();
        if (voucher == '') {
            mui.toast('请上传支付凭证！！！');
            return false;
        }
        var i = paymentMethod(type);
        console.log(i)
        // 把数据添加到数组中
        var array = [];
        array.push(money);
        array.push(i);
        array.push(voucher);
        array.push('${user.J91008_USER_ID}');

        serverCheck(array)
    });

    // 服务器校验
    function serverCheck(array) {
        console.log(array);

        $.ajax({
            url: "fish/charge.do",
            type: "post",
            data: {recInfo: array},
            traditional: true, //传集合或者数组到后台service接收 阻止jq的深度序列化
            success: function (data) { //回调函数
                console.log(data)
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
                if (data === "tooLittle") {
                    mui.toast('请输入大于0的充值数额！');
                    return false;
                }
                if (data === "typeEmpty") {
                    mui.toast('请选择支付类型！');
                    return false;
                }
                if (data === "imgEmpty") {
                    mui.toast('请上传支付凭证！！！');
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
        var url = "fish/addPic";
        //异步提交表单(先确保jquery.form.js已经引入了)
        var options = {
            url: url,
            success: function (data) {
                picture_path = (data + "").trim();
                var sta = picture_path;
                $("img[class=photourlShow]").attr({src: sta});
                $("input[class=picPath]").attr({value: sta});
                $(obj).val('');
                mui.toast('上传成功~')
            }
        };
        $("#Form").ajaxSubmit(options);
    }


    //钱的输入格式验证
    function isMoney(num) {
        //RegExp 对象表示正则表达式，它是对字符串执行模式匹配的强大工具。
        return (new RegExp(/^([1-9][0-9]*)+(\.[0-9]{1,2})?$/).test(num));
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
                    var zhifb1 = doc.getElementById('zhifb1');
                    var weixin = doc.getElementById('weixin');
                    var weixin1 = doc.getElementById('weixin1');
                    var bank = doc.getElementById('bank');
                    var bank1 = doc.getElementById('bank1');
                    zhifb.style.display = "none";
                    zhifb1.style.display = "none";
                    bank.style.display = "none";
                    bank1.style.display = "none";
                    weixin.style.display = "none";
                    weixin1.style.display = "none";
                    if (items[0].text == '支付宝') {
                        zhifb.style.display = "block";
                        zhifb1.style.display = "block";
                    } else if (items[0].text == '银行卡') {
                        bank.style.display = "block";
                        bank1.style.display = "block";
                    } else if (items[0].text == '微信') {
                        weixin.style.display = "block";
                        weixin1.style.display = "block";
                    }
                });
            }, false);
        });
    })(mui, document);
</script>

</html>