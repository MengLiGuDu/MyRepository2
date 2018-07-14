<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户申请记录</title>
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
		.box{
			width: 1400px;
			height: 600px;
			border: 1px solid gray;
			margin-left: 166px;
			margin-top: 140px;
			position: absolute;
		}
	</style>
</head>
<body>
	<div class="form-group">
		<div class="control-label col-xs-12">
			<button type="submit" class="btn btn-warning wy" id="borrow">借用信息</button>
		</div>
	</div>
	<div class="form-group" >
		<div class="control-label col-xs-12">
			<button class="btn btn-warning wt" id="draw">领取记录</button>
		</div>
	</div>
	<div class="box"></div>
</body>
<script type="text/javascript">
	$("#borrow").click(function(){
		$(".box").load("/MaterialManagement/app/jsp/user_manage/logistics/UsagerDemandeBorrow.jsp")
	})
	$("#draw").click(function(){
		$(".box").load("/MaterialManagement/app/jsp/user_manage/logistics/UsagerDemandeDraw.jsp")
	})
</script>
</html>