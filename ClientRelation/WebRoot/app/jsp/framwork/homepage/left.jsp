<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String test = request.getParameter("test");
	String user = request.getParameter("user");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a{
		text-decoration:none;
		color:white;
	}
</style>
</head>
<body style="background:#3F7ACF">
	<div id="1">
		<a href="<%=PATH%>/client_manage.action" target="right">客户管理</a><br><br>
		<a href="<%=PATH%>/staff.action" id="a2" target="right">员工管理</a><br><br>
		<a href="<%=PATH%>/lookContacts.action"  target="right">查看联系人</a><br><br>
		<a href="<%=PATH%>/sellChance.action"  target="right">销售机会管理</a><br><br>
		<a href="<%=PATH%>/productpage.action" id="a3" target="right">产品管理</a><br><br>
		<a href="<%=PATH%>/order.action"  target="right">销售订单管理</a><br><br>
		<a href="<%=PATH%>/app/jsp/framwork/just/just.jsp" id="a1" target="right">权限管理</a><br><br>
	</div>
	<div id="2">
		<a href="<%=PATH%>/client.action" target="right">客户管理</a><br><br>
		<a href="<%=PATH%>/contacts.action"  target="right">联系人管理</a><br><br>
		<a href="<%=PATH%>/clientManage.action"  target="right">客户关系管理</a><br><br>
		<a href="<%=PATH%>/sellChance.action"  target="right">销售机会管理</a><br><br>
		<a href="<%=PATH%>/sellOrder.action"  target="right">销售订单管理</a><br><br>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		if(<%=test%> == 1){
			$("#1").attr("style","display:block;width:99%;height:99%;margin:0px auto;text-align:center;background:#3F7ACF");
			$("#2").attr("style","display:none;");
			getUsers();
		} else if(<%=test%> == 2) {
			$("#1").attr("style","display:none;");
			$("#2").attr("style","display:black;width:99%;height:99%;margin:0px auto;text-align:center;background:#3F7ACF");
			getUsers();
		} else {
			$("#1").attr("style","display:none;");
			$("#2").attr("style","display:none;");
		}
	})
	function getUsers(){
		if(<%=user%> == "0"){
			$("#a1").attr("style","display:block;");
			$("#a2").attr("style","display:block;");
			$("#a3").attr("style","display:block;");
		}else if(<%=user%> == "1"){
			$("#a1").attr("style","display:none;");
			$("#a2").attr("style","display:block;");
			$("#a3").attr("style","display:block;");
		}else{
			$("#a1").attr("style","display:none;");
			$("#a2").attr("style","display:none;");
			$("#a3").attr("style","display:none;");
		}
	}
</script>
</html>