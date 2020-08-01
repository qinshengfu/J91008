<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css"/>
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp" %>
    <!-- 日期框 -->
    <link rel="stylesheet" href="static/ace/css/datepicker.css"/>
    <style>
        .upload_pic {
            height: 100px;
            width: 100px;
        }

        .preimg {
            position: absolute;
            top: 50%;
            right: 214px;
            width: 95px;
            height: 99px;
            opacity: 0;
            margin-top: -52px;
        }
    </style>
</head>
<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">

                        <!-- 检索  -->
                        <form action="system_config/list.do" method="post" name="Form" id="Form">

                            <table id="simple-table" class="table table-striped table-bordered table-hover"
                                   style="margin-top:5px;">
                                <tbody>

                                <c:if test="${QX.cha == 1 }">
                                    <tr>
                                        <th class='center'>每天提现次数：</th>
                                        <td class='center'><input class="forminput" type="number" name="WITHDRAW_TODAY"
                                                                  id="WITHDRAW_TODAY"
                                                                  value="${pd.WITHDRAW_TODAY}"
                                                                  maxlength="20" placeholder="这里输入每天提现次数"
                                                                  style="width:98%;"/></td>
                                        <th class='center'>提现手续费：</th>
                                        <td><input class="forminput" type="number" name="PAYMENT_FEE" id="PAYMENT_FEE"
                                                   value="${pd.PAYMENT_FEE}" maxlength="20"
                                                   placeholder="这里输入提现手续费" style="width:98%;"/>
                                        </td>
                                        <th class='center'>提现倍数：</th>
                                        <td><input class="forminput" type="number" name="CASH_MULTIPLIER"
                                                   id="CASH_MULTIPLIER"
                                                   value="${pd.CASH_MULTIPLIER}" maxlength="32"
                                                   placeholder="这里输入提现倍数" style="width:98%;"/></td>
                                    </tr>
                                    <tr>
                                        <th class='center'>推广人数：</th>
                                        <td><input class="forminput" type="number" name="EXTENSION" id="EXTENSION"
                                                   value="${pd.EXTENSION}" maxlength="32"
                                                   placeholder="这里输入推广人数" style="width:98%;"/></td>
                                        <th class='center'>获得喂养次数：</th>
                                        <td><input class="forminput" type="number" name="GET_FREQUENCY"
                                                   id="GET_FREQUENCY"
                                                   value="${pd.GET_FREQUENCY}" maxlength="32"
                                                   placeholder="这里输入获得喂养次数" style="width:98%;"/></td>
                                        <th class='center'>喂养封顶：</th>
                                        <td><input class="forminput" type="number" name="FEED_CAPPING" id="FEED_CAPPING"
                                                   value="${pd.FEED_CAPPING}" maxlength="32"
                                                   placeholder="这里输入喂养封顶" style="width:98%;"/></td>
                                    </tr>
                                    <tr>
                                        <th class='center'>饲料价格：</th>
                                        <td><input class="forminput" class="forminput" type="number" name="FEED_PRICE"
                                                   id="FEED_PRICE"
                                                   value="${pd.FEED_PRICE}" maxlength="32"
                                                   placeholder="这里输入饲料价格" style="width:98%;"/></td>
                                        <th class='center'>出局收益：</th>
                                        <td><input class="forminput" type="number" name="OUT_EARNINGS" id="OUT_EARNINGS"
                                                   value="${pd.OUT_EARNINGS}" maxlength="32"
                                                   placeholder="这里输入出局收益" style="width:98%;"/></td>
                                        <th class='center'>没有推人喂养次数：</th>
                                        <td><input class="forminput" type="number" name="FEEDING_TIMES"
                                                   id="FEEDING_TIMES"
                                                   value="${pd.FEEDING_TIMES}" maxlength="32"
                                                   placeholder="这里输入没有推人喂养次数" style="width:98%;"/></td>
                                    </tr>

                                    <tr>
                                        <th class='center'>微信收款码：</th>
                                        <td>
                                            <input class="forminput" type="hidden" name="WECHAT" id="WECHAT"
                                                   value="${pd.WECHAT}" maxlength="255"
                                                   style="width:98%;"/>
                                            <p style="position:relative">
                                                <a class="imageup">
                                                    <c:if test="${pd.WECHAT == null}">
                                                        <img class="upload_pic" id="photourlShow1" height="150"
                                                             width="150"
                                                             src="<%=basePath%>static/images/upload.png"/>
                                                    </c:if>
                                                    <c:if test="${pd.WECHAT != null}">
                                                        <img class="upload_pic" id="photourlShow1" height="150"
                                                             width="150" src="${pd.WECHAT}"/>
                                                    </c:if>
                                                    <input type="file" name="pictureFile"
                                                           onchange="setImg(this,1)" id="pictureFile"
                                                           class="preimg"/>
                                                </a>
                                            </p>
                                        </td>
                                        <th class='center'>支付宝收款码：</th>
                                        <td>
                                            <input class="forminput" type="hidden" name="ALIPAY" id="ALIPAY"
                                                   value="${pd.ALIPAY}" maxlength="255"
                                                   style="width:98%;"/>
                                            <p style="position:relative">
                                                <a class="imageup">
                                                    <c:if test="${pd.ALIPAY==null}">
                                                        <img class="upload_pic" id="photourlShow2" height="150"
                                                             width="150"
                                                             src="<%=basePath%>static/images/upload.png"/>
                                                    </c:if>
                                                    <c:if test="${pd.ALIPAY!=null}">
                                                        <img class="upload_pic" id="photourlShow2" height="150"
                                                             width="150" src="${pd.ALIPAY}"/>
                                                    </c:if>
                                                    <input type="file" name="pictureFile"
                                                           onchange="setImg(this,2)" id="pictureFile"
                                                           class="preimg"/>
                                                </a>
                                            </p>
                                        </td>
                                        <th class='center'>银行收款账号：</th>
                                        <td><input class="forminput" type="number" name="BANK_NUMBER" id="BANK_NUMBER"
                                                   value="${pd.BANK_NUMBER}" maxlength="32"
                                                   placeholder="这里输入银行收款账号" style="width:98%;"/></td>
                                    </tr>
                                    <tr>
                                        <th class='center'>QQ联系：</th>
                                        <td><input class="forminput" type="number" name="QQ_TOUCH" id="QQ_TOUCH"
                                                   value="${pd.QQ_TOUCH}" maxlength="32"
                                                   placeholder="这里输入QQ联系" style="width:98%;"/></td>
                                        <th class='center'>微信联系：</th>
                                        <td><input class="forminput" type="number" name="WECHAT_TOUCH" id="WECHAT_TOUCH"
                                                   value="${pd.WECHAT_TOUCH}" maxlength="32"
                                                   placeholder="这里输入微信联系" style="width:98%;"/></td>
                                    </tr>
                                    <tr>
                                        <th class='center'>第N个后出一个：</th>
                                        <td><input class="forminput" type="number" name="N_OUT_ONE" id="N_OUT_ONE"
                                                   value="${pd.N_OUT_ONE}" maxlength="32"
                                                   placeholder="这里输入第N个后出一个" style="width:98%;"/></td>
                                        <th class='center'>动态第一人收益：</th>
                                        <td><input class="forminput" type="number" name="PROFIT_ONE" id="PROFIT_ONE"
                                                   value="${pd.PROFIT_ONE}" maxlength="32"
                                                   placeholder="这里输入动态第一人收益" style="width:98%;"/></td>
                                        <th class='center'>2至N个收益：</th>
                                        <td><input class="forminput" type="number" name="TWO_N_PROFIT" id="TWO_N_PROFIT"
                                                   value="${pd.TWO_N_PROFIT}" maxlength="32"
                                                   placeholder="这里输入微信联系" style="width:98%;"/></td>
                                    </tr>
                                </c:if>
                                <c:if test="${QX.cha == 0 }">
                                    <tr>
                                        <td colspan="100" class="center">您无权查看</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                            <div class="page-header position-relative">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="vertical-align:top;">
                                            <c:if test="${QX.add == 1 }">
                                                <a class="btn btn-mini btn-success" onclick="edit();">更改</a>
                                                <a class="btn btn-mini " onclick="formReset()">取消</a>
                                                <a class="btn btn-mini btn-danger" onclick="wipeData();">清空数据</a>
                                            </c:if>

                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->

    <!-- 返回顶部 -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>

</div>
<!-- /.main-container -->

<!-- basic scripts -->
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp" %>
<!-- 删除时确认窗口 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>

<%-- form表单ajax提交 --%>
<script src="static/js/jquery.form.js"></script>

<script type="text/javascript">
    $(top.hangge());//关闭加载状态
    //检索
    function tosearch() {
        top.jzts();
        $("#Form").submit();
    }


    //清空数据
    function wipeData() {
        bootbox.confirm("确定要清空数据吗?", function (result) {
            if (result) {
                top.jzts();
                var url = "fish/resetSystem.do";
                $.get(url, function (data) {
                    if (data === "success") {
                        alert("清空数据成功！")
                        location.reload(); //刷新页面
                    }
                });
            }
        });
    }

    //复位
    function formReset() {
        document.getElementById("Form").reset();
    }

    //判断不能为空
    function check() {
        var lock = false;
        $('input[class=forminput]').each(function () {
            if ($(this).val() == '') {
                alert("当前表单不能有空项");
                lock = false;
                return false;
            } else {
                lock = true;
                return true;
            }
        });
        return lock;
    }

    //获取from表单数据并传到后台
    function edit() {
        //取表单值
        finalRes = $("#Form").serializeArray().reduce(function (result, item) {
            result[item.name] = item.value;
            return result;
        }, {});

        //通过ajax传到后台
        if (check()) {
            $.ajax({
                url: "system_config/edit",
                type: "post",
                data: finalRes,
                timeout: 10000, //超时时间设置为10秒
                success: function (data) { //回调函数
                    if (data === "success") {
                        alert("参数更改成功~");
                        location.reload(); //刷新页面
                    } else {
                        alert("参数更改失败~");
                        location.reload(); //刷新页面
                    }
                },
            });
        }
    }

    //导出excel
    function toExcel() {
        window.location.href = '<%=basePath%>system_config/excel.do';
    }

    //用于进行图片上传格式验证
    function setImg(obj, tag) {
        var f = $(obj).val();
        if (f == null || f == undefined || f == '') {
            return false;
        }
        console.log(f)
        if (!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f)) {
            $("#photourlShow" + tag).tips({side: 3, msg: '请上传图片文件!!!', bg: '#AE81FF', time: 2});
            $("#photourlShow" + tag).focus();
            $(obj).val('');
            return false;
        }
        var url = "rotation_chart/addPic";
        //异步提交表单(先确保jquery.form.js已经引入了)
        var options = {
            url: url,
            success: function (data) {
                picture_path = (data + "").trim();
                var sta = picture_path;
                $("#photourlShow" + tag).attr({src: sta});
                switch (tag) {
                    case 1:
                        $("#WECHAT").attr("value", sta);
                        break;
                    case 2:
                        $("#ALIPAY").attr("value", sta);
                        break;
                }
                $(obj).val('');
                $("#photourlShow" + tag).tips({side: 3, msg: '上传成功', bg: '#AE81FF', time: 2});
                $("#photourlShow" + tag).focus();
            }
        };
        $("#Form").ajaxSubmit(options);
    }


</script>


</body>
</html>