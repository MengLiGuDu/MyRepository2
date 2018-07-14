<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请记录查看</title>
</head>
<body>
<div style="position: relative;top:40px;">
	<button class="btn btn-primary btn-lg" onclick="borrowApplyRecord()" style="position: relative;left: 30px;">借用申请记录</button>
	<button class="btn btn-primary btn-lg" onclick="receiveApplyRecord()" style="position: relative;left: 45px;">领用申请记录</button>
</div><br>
<hr style="background-color: gray; height: 1px; border: none;">
<div id="contentView"></div>
</body>
<script type="text/javascript">

	$(function(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/user/applyRecordSee/borrowApplyRecord.jsp");
	})
	function borrowApplyRecord(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/user/applyRecordSee/borrowApplyRecord.jsp");
	}
	function receiveApplyRecord(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/user/applyRecordSee/receiveApplyRecord.jsp");
	}
</script>
</body>
</html>