<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		body{
			color:white;
		}
		.box{
			width:550px;
			height:85px;
			font-size:45px;
			font-family:'楷体';
			float: left;
			margin-left:50px;
			margin-top:20px;
		}
		.box_two{
			width:200px;
			float:right;
			margin-top:50px;
		}
		.b_image{
			display:inline-block;
			width:25px;
			height:25px;
			background: url("<%=path%>/app/images/kc-loginout.png");
			float:right;
			margin-right:35px;
			margin-top:-3px;
		}
	</style>
</head>
<body bgcolor="#5d6981">

	<div class="box"><b>$ 财务管理系统</b></div>
	
	<div class="box_two">当前操作人：<b>${loginUser.user_name}</b>
		<a href="<%=path%>/app/jsp/framwork/login.jsp" target="_parent"><b class="b_image"></b></a>
	</div>
	
</body>
<script language="vbscript">
	 session.timeout=30;
</script>
</html>