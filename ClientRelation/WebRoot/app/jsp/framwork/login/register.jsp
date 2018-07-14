<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户信息管理系统登录界面</title>
<style type="text/css">
 body{
 	background:url("<%=PATH%>/app/images/register.jpg")no-repeat; 
 	 background-size:cover;
 }
 .bd{
	border:1px solid red;
}
.box{
	width: 450px;
	height: 450px; 
	margin-left:1100px; 
	margin-top:350px;
	position: absolute;
	background: white; 
	opacity:1;
}
.title{
	width: 350px;
	height: 70px;
	position: absolute;
	margin-left:1100px;
	margin-top:250px;
	text-align: center;
	line-height: 70px;
	opacity:1;
}
.subtitle{
	width:400px;
	height:1px;
	position: absolute;
	margin-left: 20px;
	margin-top: 5px;
	border-bottom: 1px solid black;
}
.name{
	width: 350px;
	height: 40px;
	position: absolute;
	margin-left:30px;
	margin-top:70px;
	text-align: center;
	font-size:20px;
	padding-top: 5px;
}
.password{
	width: 350px;
	height: 40px;
	position: absolute;
	margin-left:30px; 
	margin-top:170px;
	text-align: center;
	font-size:20px;
	padding-top: 5px;
}
.buttons{
	width: 350px;
	height: 40px;
	position: absolute;
	margin-left:100px;
	margin-top:270px;
	color:white;
	text-align: cente;
}
</style>
</head>
<script type="text/javascript">
$(function(){
	
	$("#formModel").bootstrapValidator({  
	    live: 'enabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证  
	    excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的  
	    submitButtons: '#btn-test',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面  
	    message: '通用的验证失败消息',//好像从来没出现过  
	    feedbackIcons: {//根据验证结果显示的各种图标  
	        valid: 'glyphicon glyphicon-ok',  
	        invalid: 'glyphicon glyphicon-remove',  
	        validating: 'glyphicon glyphicon-refresh'  
	    },  
	    fields: {  
	    	client_name: {  
	            validators: {
				notEmpty: {//检测非空,radio也可用  
	                 		message: '用户名必须输出'  
	                  },  
	                  stringLength: {//检测长度  
	                  	min: 2,  
	                  	max: 6,  
	                  	message: '长度必须在2-6之间'  
	                  },  
	            }  
	        },
	    	  password: {  
	            validators: {
				notEmpty: {//检测非空,radio也可用  
	                 		message: '请输入密码'  
	                  },  
	                  stringLength: {//检测长度   
	                  	min: 2,  
	                  	max: 6,  
	                  	message: '长度为6'  
	                  },  
	            }  
	        }  
	    }  
	});  
	$("#button01").click(function(){
		if ($("#formModel").data('bootstrapValidator').isValid()) {//获取验证结果，如果成功，执行下面代码  
			var post = $("#formModel").serialize();
			var t = $('#formModel').serializeArray();
			var b = {};
			$.each(t,function(){
				b[this.name] = this.value;
			})
			$.post("<%=PATH%>/login.action", {name:b.client_name,password:b.password}, function(data){
				window.location.href="<%=PATH%>/"+data;
			});
		}
	})
})
</script>
<body>
	<div class="title"><font style="font-size: 40px;font-weight: bold;color:#5EB0FA; font-family: '微软雅黑';">客户关系管理系统</font></div>
	<div class="box">
		<div style="margin-top: 25px;margin-left: 20px;"><font style="font-size: 26px;color:#5EB0FA; font-family: '微软雅黑';">用户登录           </font><font color="gray">User login</font></div>
		<div class="subtitle"></div>
	 	<form class="form-horizontal" style="width: 400px;height: 300px;padding-top: 40px;padding-left: 40px;" id="formModel" >
			<div class="form-group name">
				<label class="col-xs-4 control-label" id="titles">用户名:</label>
				<div class="col-xs-8">
					<input type="text" id="cname" class="form-control" name="client_name"/>
				</div>
			</div>
			<div class="form-group password">
				<label class="col-xs-4 control-label" id="titles">密码:</label>
				<div class="col-xs-8">
					<input type="password" id="cname" class="form-control" name="password"/>
				</div>
			</div>		
			<div class="form-group buttons">
				<div class="col-xs-6">
					<input type="reset" value="重置" class="col-xs-12" style="background: orange;"/>     
				</div>
				<div class="col-xs-6">   
					<input type="button" id="button01" value="确认" class="col-xs-12" style="background: gold;"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>