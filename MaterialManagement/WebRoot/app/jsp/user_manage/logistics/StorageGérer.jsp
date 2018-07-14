<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>入库管理</title>
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
			margin-top: 110px;
			width: 1500px;
			margin-left:80px;
			position: absolute;
		}
		
		.box{
			width: 90%;
			height: 550px;
			border: 1px solid gray;
			margin-left:50px;
			margin-top: 158px;
			position: absolute;
		}
		
		.one{
			position: absolute;
			left: 80px;
			top:60px;
		}
		
		.two{
			position: absolute;
			left:240px;
			top:60px;
		}
		
		#app{
			position: absolute;
			top:150px;
		}
		
	</style>
</head>

<body> 
	<div class="form-group one" >
		<div class="control-label col-xs-12">
			<button class="btn btn-default" id="yy" style="width: 120px; height: 35px;">审购入库</button>
		</div>
	</div>
	
	<div class="form-group two" >
		<div class="control-label col-xs-12">
			<button class="btn btn-default" id="back" style="width: 120px; height: 35px;">归还入库</button>
		</div>
	</div>
	<div class="wr"></div>
	<div  id="app"></div>
</body>
<script type="text/javascript">

$("#yy").click(function(){
	$("#app").load("<%=PN%>/app/jsp/user_manage/logistics/storage/subscribe_storage.jsp");
})

$("#back").click(function(){
	$("#app").load("<%=PN%>/app/jsp/user_manage/logistics/storage/return_storage.jsp");
})







</script>
</html>