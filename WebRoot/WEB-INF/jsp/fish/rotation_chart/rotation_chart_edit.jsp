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
		<style>
			.upload_pic{
				height: 100px;width: 100px;
			}
			.preimg{position: absolute;
				top: 50%;
				right: 214px;
				width: 95px;
				height: 99px;
				opacity: 0;
				margin-top: -52px;}
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
					
					<form action="rotation_chart/${msg }.do" name="Form" id="Form" method="post" >
						<input type="hidden" name="ROTATION_CHART_ID" id="ROTATION_CHART_ID" value="${pd.ROTATION_CHART_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">轮播图:</td>
								<td>
									<input type="hidden" name="PIC_PATH" id="PIC_PATH" value="${pd.PIC_PATH}" maxlength="255" style="width:98%;"/>
									<p style="position:relative">
										<a class="imageup">
											<c:if test="${pd.PIC_PATH==null}">
												<img class="upload_pic" id="photourlShow" height="150" width="150" src="<%=basePath%>static/images/upload.png" />
											</c:if>
											<c:if test="${pd.PIC_PATH!=null}">
												<img class="upload_pic" id="photourlShow" height="150" width="150" src="${pd.PIC_PATH}" />
											</c:if>
											<input type="file" name="pictureFile" onchange="setImg(this)" id="pictureFile" class="preimg"/>
										</a>
									</p>
								</td>
								<%--<td>
									<input type='file' name='pictureFile' id='pictureFile' onchange='setImg(this)'>
									<img id='photourlShow' src=' ' width='90%' height='50%'/>
								</td>--%>
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

	<%-- form表单ajax提交 --%>
	<script src="static/js/jquery.form.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#PIC_PATH").src==""){
				console.log($("#PIC_PATH").attr("src"))
				$("#PIC_PATH").tips({
					side:3,
		            msg:'请选择图片',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PIC_PATH").focus();
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

		//用于进行图片上传格式验证
		function setImg(obj) {
			var f = $(obj).val();
			if (f == null || f == undefined || f == '') {
				return false;
			}
			console.log(f)
			if (!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f)) {
				$("#photourlShow").tips({side:3,msg:'请上传图片文件!!!',bg:'#AE81FF',time:2});
				$("#photourlShow").focus();
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
					$("#photourlShow").attr({src: sta});
					$("#PIC_PATH").attr("value",sta);
					$(obj).val('');
					$("#photourlShow").tips({side:3,msg:'上传成功',bg:'#AE81FF',time:2});
					$("#photourlShow").focus();
				}
			};
			$("#Form").ajaxSubmit(options);
		}

		</script>
</body>
</html>