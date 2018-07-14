<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>盘点管理</title>
	<link rel="stylesheet" href="../../../css/bootstrap.css" />
	<script type="text/javascript" src="../../../js/jquery-3.2.1.js" ></script>
	<script type="text/javascript" src="../../../js/bootstrap.min.js" ></script>
<style type="text/css">
	.box{
		width: 100%;
		height:120px;
		border:1px solid gray;
		line-height: 190px;
		border-right: none;
		border-left: none;
		border-top: none;
		position: absolute;
		top: -20px;
		background-color:#F9F9F9; 
	}
	body{
	overflow:scroll;
	overflow-x:hidden;
	overflow-y:hidden;
	}
</style>
</head>
<body>
<div class="box" >
		<a href="<%=request.getContextPath()%>/app/jsp/user_manage/logistics/check/checkManage_below.jsp" class="btn btn-default" id="one"  style="font-size:18px; width:160px;margin-left: 20px;background-color: white;" target="check_below">已处理</a>
		<a href="<%=request.getContextPath()%>/app/jsp/user_manage/logistics/check/checkManageBelow_two.jsp"  class="btn btn-default" id="two"  style="font-size:18px;margin-left: 20px;width:160px;" target="check_below">处理中</a>
</div>
</body>
<script type="text/javascript">
$(function(){
	$("#one").click(function(){
		$(this).css("background-color","#3AB2FF");
		$(this).css("color","white");
		$("#two").css("background-color","white");
		$("#two").css("color","black");
	})
	
	$("#two").click(function(){
		$(this).css("background-color","#3AB2FF");
		$(this).css("color","white");
		$("#one").css("background-color","white");
		$("#one").css("color","black");
	})
	
	
	
	
})


</script>
</html>