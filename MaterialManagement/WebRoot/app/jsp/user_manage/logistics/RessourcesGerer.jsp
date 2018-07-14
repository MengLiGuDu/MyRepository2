<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物资管理</title>
<link rel="stylesheet" href="../../../css/bootstrap.css" />
	<script type="text/javascript" src="../../../js/jquery-3.2.1.js" ></script>
	<script type="text/javascript" src="../../../js/bootstrap.min.js" ></script>
	<style type="text/css">
		.wy{
			background: #5B8BD0;
			border: 1px solid #5B8BD0;
			width: 10%;
			margin-left: 150px;
			margin-top: 90px;
		}
		.wt{
			background: #5B8BD0;
			border: 1px solid #5B8BD0;
			width: 10%;
			margin-left: 350px;
			margin-top: -34px;
		}
		.wr{
			border: 1px solid gray;
			border-left: 0px;
			border-right:0px;
			border-bottom:0px;  
			margin-top: 125px;
			width: 1200px;
			margin-left:165px;
			position: absolute;
		}
		.wf{
			margin-left: 1100px;
			margin-top: 150px;
			position: absolute;
		}
		.wj{
			background: #5B8BD0;
			margin-left: 170px;
			margin-top: -30px;
			position: absolute;
			border: 1px solid #5B8BD0;
		}
		.wl{
			margin-left: 900px;
			margin-top: 152px;
			position: absolute;
		}
		.wm{
			width: 130px;
			height: 30px;
			border: 1px solid gray;
			position: absolute;
			margin-top: -5px;
		}
	</style>
</head>
<body>
	<div class="form-group">
		<div class="control-label col-xs-12">
			<button type="submit" class="btn btn-warning wy" id="check">物资查看</button>
		</div>
	</div>
	<div class="form-group" >
		<div class="control-label col-xs-12">
			<button class="btn btn-warning wt" id="type">物资类型管理</button>
		</div>
	</div>
	<div class="wr"></div>
	<div class="col-sm-10 col-sm-offset-1" style="border: 1px solid black;height: 600px; " id="ressources"></div>
</body>
<script type="text/javascript">
	$("#type").click(function(){
		$("#ressources").load("/MaterialManagement/app/jsp/user_manage/logistics/resourceType.jsp")
	})
	$("#check").click(function(){
		$("#ressources").load("/MaterialManagement/app/jsp/user_manage/logistics/Resource.jsp")
	})
</script>
</html>