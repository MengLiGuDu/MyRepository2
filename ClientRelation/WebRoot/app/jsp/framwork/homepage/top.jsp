<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a{
		text-decoration:none;
	}
</style>
</head>
<body style="background:#3F7ACF">
	<h3 style="font:left;color:white">客户关系管理系统</h3>
	<div style="float:right;color:white">
		<a class="icon icon-home" href="<%=PATH%>/reLogin.action" target="right">首页</a>
		登录名：<%=session.getAttribute("userName") %>
	</div>
	<div style="position:absolute;left:10%;top:65%">
		<a href="<%=PATH%>/app/jsp/framwork/homepage/left.jsp?test=1&user=${user}" target="left" style="color:white;width:80px">管理工作</a>
		<a href="<%=PATH%>/app/jsp/framwork/homepage/left.jsp?test=2&user=${user}" target="left" style="color:white;margin-left:100px">销售工作</a>
	</div>
</body>
</html>