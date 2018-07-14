<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%
	String name = request.getContextPath();
%>
<link rel="stylesheet" href="<%=name%>/app/css/bootstrap.css">  
<link rel="stylesheet" href="<%=name%>/app/css/bootstrapValidator.css">
<link rel="stylesheet" href="<%=name%>/app/css/login.css">
<script src="<%=name%>/app/js/jquery-3.2.1.js"></script> 
<script src="<%=name%>/app/js/bootstrap.js"></script> 
<script src="<%=name%>/app/js/bootstrapValidator.js"></script>
</head>
<body>
	<div class="box">
		<center>
		<img  class="circle" src="<%=name%>/app/images/money.jpg" style="border-radius: 50%;"width="200"height="200"/>
		<div class="title" style="font-family:'楷体';">
			$ 财务管理系统
		</div>
		<div class="content">
			<div class="container col-sm-8 col-sm-offset-2">
				<div class="page-header">
					<h2 style="font-family:'楷体'"><b>用户登录</b></h2>
				</div>
				<div style="width:350px;margin-left:-55px;">
					<form action="<%=name%>/app/jsp/framwork/framwork.jsp" id="loginForm" method="post">
						<div class="form-group" style="margin-top:60px;">
							<label class="control-label">
								用户名:
							</label>
							<input style="width:200px;" type="text" class="form-control " id="user_name" placeholder="请输入用户名" name="user_name">
						</div>
						<div class="form-group">
							<label class="control-label ">
								密码:
							</label>
							<input style="width:200px;" type="password" class="form-control" placeholder="请输入密码" name="password">
						</div>
						<br>
						<div class="form-group" style="margin-top:40px;">
							<button type="submit" class="btn btn-success" style="width:300px;">登录</button>
						</div>
						<br>
					</form>
				</div>
			</div>
		</div>
		</center>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#loginForm").bootstrapValidator({
			message:'This value is not valid',
			feedbackIcons: {  
	            valid: 'glyphicon glyphicon-ok',  
	            invalid: 'glyphicon glyphicon-remove',  
	            validating: 'glyphicon glyphicon-refresh'  
	        },
	        fields: {
	        	user_name: {
	                message: '用户名验证失败',
	                validators: {
	                    notEmpty: {
	                        message: '用户名不能为空'
	                    },
	        			remote:{
	        				url:'<%=name%>/judgeUserName.action',
	        				message:'该用户名不存在!',
	        				delay:500,
	        				type:'post',
	        				dataType: 'json',
	        			}
	                }
	            },
	        password:{
	            	message:'密码验证失败',
	            	validators: {
	                    notEmpty: {
	                        message: '密码不能为空'
	                    },
	        			remote:{
	        				url:function(){
	        					var v;
	        					$.ajax({
	        						async:false,
	        						type:'POST',
	        						data:$("#loginForm").serialize(),
	        						url:'<%=name%>/judgePassword.action',
	        						success:function(data){
	        							v="<%=name%>/"+data+".action";
	        						}
	        					})
	        					return v;
	        				},
	        				message:'密码错误!',
	        				delay:500,
	        				type:'post',
	        				dataType: 'json',
	        			}
	                }
	            }
	        }
		})
	})
</script>
</html>
