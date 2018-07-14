<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="position: relative;left: 30px;top:20px;">
	<button class="btn btn-primary btn-lg" onclick="materialsView()">物资查看</button>
	<button class="btn btn-primary btn-lg" onclick="materialsTypeManagement()" style="position: relative;left: 15px;">物资类型管理</button>
</div><br>
<hr style="background-color: gray; height: 1px; border: none;">
<div id="contentView"></div>
</body>
<script type="text/javascript">
	function materialsView(){
		$("#contentView").load("/MaterialManagement/app/jsp/demo/content1.jsp");
	}
	function materialsTypeManagement(){
		$("#contentView").load("/MaterialManagement/app/jsp/demo/content2.jsp");
	}
</script>
</html>