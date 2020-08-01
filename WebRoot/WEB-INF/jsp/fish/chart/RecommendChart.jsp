<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html lang="en">

<base href="<%=basePath%>">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>推荐关系图</title>
</head>


<style>
html, body {
	margin: 0px;
	padding: 14px 0px 0px 0px;
	width: 100%;
	height: 100%;
	overflow: hidden;
	font-family: Helvetica;
}

#tree {
	width: 100%;
	height: 100%;
}
</style>

<body>

<script src="https:///balkangraph.com/js/latest/OrgChart.js"></script>

	<div id="tree"></div>

</body>

<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>
<script>

    $(top.hangge());//关闭加载状态

	//创建一个空集合
	var chart = new Array();
	//接收后台传过来的集合
	<c:forEach var="item" items="${varList}" varStatus="s">
	chart[${s.index}] = '${item}'; //防止数字出错，用单引号括起来
    </c:forEach>
	//打印到浏览器控制台
	for(var i = 0 ; i<chart.length ; i++){
		console.log(chart[i]);
	}

		window.onload = function() {
			//接收后台传过来的集合
			//防止数字出错，用单引号括起来
			var nodes = [ {
				id : '${vertex.J91008_USER_ID}',
				昵称 : '${vertex.NICKNAME}',
				手机号 : '${vertex.PHONE}',
				编号 : '${vertex.J91008_USER_ID}',
				img : "https://balkangraph.com/js/img/1.jpg"
			},
			<c:forEach var="item" items="${varList}" varStatus="s">
			{
				id : '${item.J91008_USER_ID}',
				pid : '${item.RECOMMENDER}',
				昵称 : '${item.NICKNAME}',
				手机号 : '${item.PHONE}',
				编号 : '${item.J91008_USER_ID}',
				img : "https://balkangraph.com/js/img/2.jpg"
			},
			</c:forEach>
			];

			for (var i = 0; i < nodes.length; i++) {
				nodes[i].field_number_children = childCount(nodes[i].id);
			}

			function childCount(id) {
				count = 0;
				for (var i = 0; i < nodes.length; i++) {
					if (nodes[i].pid == id) {
						count++;
						count += childCount(nodes[i].id);
					}
				}

				return count;
			}

			OrgChart.templates.rony.field_number_children = '<circle cx="60" cy="110" r="15" fill="#F57C00"></circle><text fill="#ffffff" x="60" y="120" text-anchor="middle">{val}</text>';

			var chart = new OrgChart(document.getElementById("tree"), {
				template : "rony",
				collapse : {
					level : 3
				},
				nodeBinding : {
					field_0 : "昵称",
					field_1 : "手机号",
					field_2 : "编号",
					img_0 : "img",
					field_number_children : "field_number_children"
				},
				nodes : nodes
			});
		};

</script>
</html>