<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已审批记录</title>
</head>
<body>
<div style="position: relative;top:20px;">
	<button class="btn btn-primary btn-lg" onclick="subscribeList()" style="position: relative;left: 30px;">申购列表</button>
	<button class="btn btn-primary btn-lg" onclick="ledList()" style="position: relative;left: 45px;">领申列表</button>
	<button class="btn btn-primary btn-lg" onclick="borrowList()" style="position: relative;left: 60px;">借用列表</button>
	<button class="btn btn-primary btn-lg" onclick="checkList()" style="position: relative;left: 75px;">盘点列表</button>
</div><br>
<hr style="background-color: gray; height: 1px; border: none;">
<div id="contentView"></div>
</body>
<script type="text/javascript">
	function subscribeList(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/lead/yetApproval/subscribeList.jsp");
	}
	function ledList(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/lead/yetApproval/ledList.jsp");
	}
	function borrowList(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/lead/yetApproval/borrowList.jsp");
	}
	function checkList(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/lead/yetApproval/checkList.jsp");
	}
</script>
</body>
</html>