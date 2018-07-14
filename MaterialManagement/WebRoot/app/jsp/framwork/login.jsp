<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<link href="<%=basePath%>app/css/login/login.css" rel="stylesheet" type="text/css" >
	<style>
	
			.div{
				width: 200px;
				height: 200px;
				background: red;
				border-radius: 50%;
				transition: all .4s linear infinite;
			}
			
			.div:hover{
				-webkit-transform:translateX(200px);
				color: white;
				background: blue;
			}
			
			.box{
				width:200px;
				height:200px;
				transition: all linear 3s;
				transform-style: preserve-3d;
				animation: mm 2s linear  infinite alternate;
			}
			
			@keyframes mm{
				0%{
					transform: rotateX(360deg) rotateY(360deg);
				}
			}
			.box>div{
				width: 200px;
				height: 200px;
				position: absolute;
				font-size:30px;
				opacity: 0.6;
			}
			.box>div:nth-of-type(1){
				background: red;
				-webkit-transform: translateZ(100px);
			}
			.box>div:nth-of-type(2){
				
				background: yellow;
				-webkit-transform: translateZ(-100px);
			}
			.box>div:nth-of-type(3){
				background: brown;
				-webkit-transform: rotateY(90deg);
				left: 100px;
			}
			.box>div:nth-of-type(4){
				
				background: gray;
				-webkit-transform: rotateY(90deg);
				left: -100px;
			}
			.box>div:nth-of-type(5){
				background: white;
				-webkit-transform: rotateX(90deg);
				top: 100px;
			}
			.box>div:nth-of-type(6){
				background: cyan;
				-webkit-transform: rotateX(90deg);
				top: -100px;
			}
			.span{
				width: 98px;
				height: 95px;
				border: 1px solid white;
				display: inline-block;
			}
		</style>
</head>
<body>
<div class="goods" >
	欢迎使用校园物资管理系统
</div>


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">用户增加</h4>
	            </div>
	            <form id="postForm" class="form-horizontal" role="form" enctype="multipart/form-data" method="post">
	            
				    <div class="form-group">
				        <label for="user_name" class="col-sm-2 control-label">用户名</label>
				        <div class="col-sm-8">
				            <input type="text" class="form-control" id="user_name"  name="user_name">
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="password" class="col-sm-2 control-label">密码</label>
				        <div class="col-sm-8">
				            <input type="password" class="form-control" id="password"  name="password">
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="money" class="col-sm-2 control-label">金额</label>
				        <div class="col-sm-8">
				            <input type="text" class="form-control" id="money"  name="money">
				        </div>
				    </div>
				</form>
				
				<div class="modal-footer">
					<div class="form-group">
				        <button type="button" class="btn btn-primary"  id="submit" data-dismiss="modal">注册</button>
				    </div>
				</div>
				
	        </div>
	    </div>
	</div>

	<center>
		<div class="img">
			<div class="max" >
				<img src="<%=basePath%>app/img/01.png" class="user_img" width="80" height="80" >
				<b class="font">用户登录</b>
				<div style="width: 300px; margin-left: 100px" class="user_login">
						<form action="<%=request.getContextPath()%>/login.action"  id="loginForm" class="form-horizontal" role="form" enctype="multipart/form-data" method="post">
							<div class="form-group">
					        <label for="user_name" class="col-sm-3 control-label">用户名</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="user_name"  name="user_name">
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="password" class="col-sm-3 control-label">密码</label>
					        <div class="col-sm-8">
					            <input type="password" class="form-control" id="password"  name="password">
					        </div>
					    </div>
						<br>
						<div  class="row form-group" >
							<input type="submit" value="立即登录" class="btn btn-primary"/>
							<a class="btn btn-success col-xs-offset-1" data-toggle="modal" data-target="#myModal">注册</a>
						</div>
					</form>
				</div>	
			</div>
		</div>
	</center>
	<script type="text/javascript">
		function saveAdmin(){
	     //开启验证

	     $('#postForm').data('bootstrapValidator').validate();  
	      if(!$('#postForm').data('bootstrapValidator').isValid()){  
	      	return ;  
	      } 
	      $.ajax({
			    url: '<%=PN%>/register.action',
			    type: 'POST',
			    cache: false,
			    data: new FormData($('#postForm')[0]),
			    processData: false,
			    contentType: false
			}).done(function(res) {
				console.log(res)
				alert("操作成功");
			}).fail(function(res) {
				alert("操作失败");
			}); 
	      
	    }
	    
		$(document).ready(function() {
		    formValidator();
		});
		
		
	    
		function formValidator(){
		     $('#postForm').bootstrapValidator({
		         message: 'This value is not valid',
		         feedbackIcons: {
			         valid: 'glyphicon glyphicon-ok',
			         invalid: 'glyphicon glyphicon-remove',
			         validating: 'glyphicon glyphicon-refresh'
		         },
		         fields: {
		             //用户名
		             user_name: {
		                 message: '用户名验证失败',
		                 validators: {
		                     notEmpty: {
		                         message: '用户名不能为空'
		                     }, 
		                     threshold :  1 , 
		                     remote: {
		                         url: '<%=PN%>/checkUserName.action',
		                         message: '用户已存在',//提示消息
		                         delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
		                         type: 'POST'//请求方式
		                     }
		                 }
		             },
		           //密码
		             password: {
		                 message: '密码验证失败',
		                 validators: {
		                     notEmpty: {
		                         message: '密码不能为空'
		                     },
		                     stringLength: {
		                         min: 3,
		                         max: 12,
		                         message: '密码长度在3到12之间'
		                     }
		                 }
		             },
		           //金额
		             money: {
		                 message: '金额验证失败',
		                 validators: {
		                     notEmpty: {
		                         message: '金额确认不能为空'
		                     }
		                 }
		             }
		         }
		     });
		 }
		
		$("#submit").click(function(){
			$.ajax({
			    url: '<%=PN%>/register.action',
			    type: 'POST',
			    cache: false,
			    data: new FormData($('#postForm')[0]),
			    processData: false,
			    contentType: false
			}).done(function(res) {
				alert("注册成功");
				common();
			}).fail(function(res) {
				alert("注册失败");
			}); 
		})
		
		
		function loginAdmin(){
		    
		    //开启验证
		     $('#loginForm').data('bootstrapValidator').validate();  
		      if(!$('#loginForm').data('bootstrapValidator').isValid()){  
		      	return ;  
		      } 
		      
		}
		$(document).ready(function() {
			var user_name = $("#user_name").val();
			loginValidator();
		});
	    
		function loginValidator(){
		    
			$('#loginForm').bootstrapValidator({
		         message: 'This value is not valid',
		         feedbackIcons: {
			         valid: 'glyphicon glyphicon-ok',
			         invalid: 'glyphicon glyphicon-remove',
			         validating: 'glyphicon glyphicon-refresh'
		         },
		         fields: {
		             //用户名
		             user_name: {
		                 message: '用户名验证失败',
		                 validators: {
		                     notEmpty: {
		                         message: '用户名不能为空'
		                     }, 
		                     threshold :  1 , 
		                     remote: {
		                         url: '<%=PN%>/checkLoginUserName.action',
		                         message: '用户不存在',//提示消息
		                         delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
		                         type: 'POST'//请求方式
		                     }
		                 }
		             },
		           //密码
		             password: {
		                 message: '密码验证失败',
		                 validators: {
		                     notEmpty: {
		                         message: '密码不能为空'
		                     },
		                     stringLength: {
		                         min: 3,
		                         max: 12,
		                         message: '密码长度在3到12之间'
		                     },
		                     threshold :  1 , 
		                     remote: {
		                         url: '<%=PN%>/checkLoginPassword.action?user_name='+user_name,
		                         message: '密码错误',//提示消息
		                         delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
		                         type: 'POST'//请求方式
		                     }
		                 }
		             }
		         }
		     });
		 }
		
	</script>
	
	<div class="modal" id="mymodel">
		<div class="modal-dialog">
			<div class="modal-content" style="width:500px; height:550px;">
				
			</div>
		</div> 
	</div>
	
	
	<!-- 魔方 -->
	
	<div class="box">
			<div>
				<table border="1" width="200" height="200">
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div>
				<table border="1" width="200" height="200">
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div>
				<table border="1" width="200" height="200">
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				
			</div>
			<div>
				<table border="1" width="200" height="200">
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				
			</div>
			<div>
				<table border="1" width="200" height="200">
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				
			</div>
			<div>
				<table border="1" width="200" height="200">
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	
</body>
</html>