<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请管理</title>
</head>
<body>
<div style="position: relative;top:40px;">
	<button class="btn btn-primary btn-lg" onclick="borrowApply()" style="position: relative;left: 30px;">借用申请</button>
	<button class="btn btn-primary btn-lg" onclick="receiveApply()" style="position: relative;left: 45px;">领用申请</button>
	<button class="btn btn-primary btn-lg" onclick="applyDraft()" style="position: relative;left: 60px;">申请草稿</button>
</div><br>
<hr style="background-color: gray; height: 1px; border: none;">
<div id="contentView"></div>
</body>
<script type="text/javascript">
	$(function(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/user/applyManagement/borrowApply.jsp");
	})
	function borrowApply(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/user/applyManagement/borrowApply.jsp");
	}
	function receiveApply(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/user/applyManagement/receiveApply.jsp");
	}
	function applyDraft(){
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/user/applyManagement/applyDraft.jsp");
	}
</script>
</body>
</html>