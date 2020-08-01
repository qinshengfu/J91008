<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
					
					<form action="feed_record/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="FEED_RECORD_ID" id="FEED_RECORD_ID" value="${pd.FEED_RECORD_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input class="span10 date-picker" name="GMT_CREATE" id="GMT_CREATE" value="${pd.GMT_CREATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">更新时间:</td>
								<td><input class="span10 date-picker" name="GMT_MODIFIED" id="GMT_MODIFIED" value="${pd.GMT_MODIFIED}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="更新时间" title="更新时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">喂养数额:</td>
								<td><input type="number" name="FEED_NUMBER" id="FEED_NUMBER" value="${pd.FEED_NUMBER}" maxlength="32" placeholder="这里输入喂养数额" title="喂养数额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户ID:</td>
								<td><input type="text" name="用户ID" id="用户ID" value="${pd.USER_ID}" maxlength="100" placeholder="这里输入user_id" title="user_id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">1 表示出局，0 表示未出局:</td>
								<td><input type="number" name="IS_OUT" id="IS_OUT" value="${pd.IS_OUT}" maxlength="32" placeholder="这里输入1 表示出局，0 表示未出局" title="1 表示出局，0 表示未出局" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排号:</td>
								<td><input type="number" name="ROW_NUMBER" id="ROW_NUMBER" value="${pd.ROW_NUMBER}" maxlength="32" placeholder="这里输入排号" title="排号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#GMT_CREATE").val()==""){
				$("#GMT_CREATE").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GMT_CREATE").focus();
			return false;
			}
			if($("#GMT_MODIFIED").val()==""){
				$("#GMT_MODIFIED").tips({
					side:3,
		            msg:'请输入更新时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GMT_MODIFIED").focus();
			return false;
			}
			if($("#FEED_NUMBER").val()==""){
				$("#FEED_NUMBER").tips({
					side:3,
		            msg:'请输入喂养数额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FEED_NUMBER").focus();
			return false;
			}
			if($("#用户ID").val()==""){
				$("#用户ID").tips({
					side:3,
		            msg:'请输入user_id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#用户ID").focus();
			return false;
			}
			if($("#IS_OUT").val()==""){
				$("#IS_OUT").tips({
					side:3,
		            msg:'请输入1 表示出局，0 表示未出局',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_OUT").focus();
			return false;
			}
			if($("#ROW_NUMBER").val()==""){
				$("#ROW_NUMBER").tips({
					side:3,
		            msg:'请输入排号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ROW_NUMBER").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>