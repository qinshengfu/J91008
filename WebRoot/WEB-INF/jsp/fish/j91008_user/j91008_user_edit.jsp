<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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

                        <form action="user_j91008/${msg }.do" name="Form" id="Form" method="post">
                            <input type="hidden" name="J91008_USER_ID" id="J91008_USER_ID"
                                   value="${pd.J91008_USER_ID}"/>
                            <div id="zhongxin" style="padding-top: 13px;">
                                <table id="table_report" class="table table-striped table-bordered table-hover">
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">密码:</td>
                                        <td><input type="text" name="PASSWORD" id="PASSWORD" value="${pd.PASSWORD}"
                                                   maxlength="255" placeholder="这里输入密码" title="密码" style="width:98%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">钱:</td>
                                        <td><input type="number" name="MONEY" id="MONEY" value="${pd.MONEY}"
                                                   maxlength="32" placeholder="这里输入钱" title="钱" style="width:98%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">爱心币:</td>
                                        <td><input type="number" name="LOVE_COIN" id="LOVE_COIN" value="${pd.LOVE_COIN}"
                                                   maxlength="32" placeholder="这里输入爱心币" title="爱心币" style="width:98%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">昵称:</td>
                                        <td><input type="text" name="NICKNAME" id="NICKNAME" value="${pd.NICKNAME}"
                                                   maxlength="255" placeholder="这里输入昵称" title="昵称" style="width:98%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">1 表示领养，0 表示未领养:</td>
                                        <td><input type="number" name="IS_ADOPTION" id="IS_ADOPTION"
                                                   value="${pd.IS_ADOPTION}" maxlength="32"
                                                   placeholder="这里输入1 表示领养，0 表示未领养" title="1 表示领养，0 表示未领养"
                                                   style="width:98%;"/></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;" colspan="10">
                                            <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                                            <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img
                                    src="static/images/jiazai.gif"/><br/><h4 class="lighter block green">提交中...</h4>
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
</div>
<!-- /.main-container -->


<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp" %>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="j91008/js/md5.js"></script>

<script type="text/javascript">
    $(top.hangge());

    //保存
    function save() {
        if ($("#PASSWORD").val() == "") {
            $("#PASSWORD").tips({
                side: 3,
                msg: '请输入密码',
                bg: '#AE81FF',
                time: 2
            });
            $("#PASSWORD").focus();
            return false;
        }
        if ($("#MONEY").val() == "") {
            $("#MONEY").tips({
                side: 3,
                msg: '请输入钱',
                bg: '#AE81FF',
                time: 2
            });
            $("#MONEY").focus();
            return false;
        }
        if ($("#LOVE_COIN").val() == "") {
            $("#LOVE_COIN").tips({
                side: 3,
                msg: '请输入爱心币',
                bg: '#AE81FF',
                time: 2
            });
            $("#LOVE_COIN").focus();
            return false;
        }
        if ($("#NICKNAME").val() == "") {
            $("#NICKNAME").tips({
                side: 3,
                msg: '请输入昵称',
                bg: '#AE81FF',
                time: 2
            });
            $("#NICKNAME").focus();
            return false;
        }
        if ($("#IS_ADOPTION").val() == "") {
            $("#IS_ADOPTION").tips({
                side: 3,
                msg: '请输入1 表示领养，0 表示未领养',
                bg: '#AE81FF',
                time: 2
            });
            $("#IS_ADOPTION").focus();
            return false;
        }
        // 密码MD5加密
        var pwd = md5($("#PASSWORD").val());
        $("#PASSWORD").val(pwd);

        $("#Form").submit();
        $("#zhongxin").hide();
        $("#zhongxin2").show();
    }

    // md5加密
    function md5(param) {
        return hex_md5(param);
    }

    $(function () {
        //日期框
        $('.date-picker').datepicker({autoclose: true, todayHighlight: true});
    });
</script>
</body>
</html>