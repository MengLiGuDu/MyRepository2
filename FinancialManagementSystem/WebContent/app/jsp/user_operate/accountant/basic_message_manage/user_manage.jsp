<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String path = request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap-table.css" />
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap-editable.css" />
		
		<script type="text/javascript" src="<%=path %>/app/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap.js" ></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap-editable.js"></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table.js" ></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table-zh-CN.js" ></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table-editable.js" ></script>
		<style type="text/css">
			.goPage {
			    line-height: 30px;
			     margin-top: 10px;
			}
			.tab_operate{
				width:350px;
				height:150px;
				margin-left:110px;
			}
			.line_div{
				font-size:20px;
				font-family: '楷体';
				color: red;
				width: 92%;
				margin: 3% auto;
				border-bottom: 1.5px solid black;
			}
		</style>
</head>
<body>
	<div style="border-top:30px solid #505e7b;"></div>
	<div class="line_div"><label>用户管理</label></div>
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-content"style="height:500px;">
			<form id="fm_form" action="#" method="post" class="form-group">
				<table style="width:300px;height:480px;margin-left:115px;">
					<tr align="center">
						<td colspan="2" style="font-family: '华文楷体';font-size: 35px"><b id="title_b"></b></td>
					</tr>
					<tr>
						<td align="center" width="120"><label>用户名：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		 <input type="text" name="user_name" id="user_name" class="form-control col-xs-8" />
					 		</div>
					 		<span id="span_text" style="color:red"></span>
					 		<input style="display: none;" name="user_id" id="user_id"/>
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label> 密码：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		 <input type="password" name="password" id="password" class="form-control col-xs-8" />
					 		</div>
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label> 联系方式：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		 <input type="text" name="phone" id="phone" class="form-control col-xs-8" />
					 		</div>
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label>  性别：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		 <input type="radio" name="sex" id="sex1"  value="0" checked/>男
						 		 <input type="radio" name="sex" id="sex2"  value="1" />女
					 		</div>
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label>  年龄：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" name="age" id="age" class="form-control col-xs-8" />
					 		</div>
				            <input style="display: none;" name="option" id="option"/>
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label>  权限：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="radio" name="state" id="state1"  value="0" checked/>普通用户
					 			<input type="radio" name="state" id="state2"  value="1" />会计
					 			<input type="radio" name="state" id="state3"  value="2" />领导
					 		</div>
				 		</td>
					</tr>
					<tr>
						<td align="center"><input onclick="exit(1)" type="button" class="btn btn-default" style="width: 100px;" value="取 消" ></td>
						<td align="right"><input id="s_btn" onclick="sub()" type="submit" class="btn btn-success" style="width: 100px;" value="提 交"  disabled/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="modal" id="myDel">
		<div class="modal-dialog modal-content">
			<table class="tab_operate">
				<tr>
					<td align="center"id="alert_font" colspan="2"style="font-family:'华文行楷';font-size:20px;">您确定要删除此用户吗？</td>
				</tr>
				<tr>
					<td align="center"><input onclick="exit(2)" type="button" class="btn btn-info" style="width: 100px;" value="取 消" ></td>
					<td align="center"><input onclick="delet()" type="button" class="btn btn-danger" style="width: 100px;" value="删 除" /></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="toolbar" class="btn-group">
		<div style="width: 100px;float:left;">
			<a onclick="add()" href="#" class="btn btn-info" style="width: 80px;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span> 添加</a>
		</div>
    </div>
	<div class="panel panel-default" style="width:92%;margin:0 auto;">  
		<div class="panel-body">
			<table id="fm-table"></table> 
		</div>  
	</div>
</body>
<script type="text/javascript">
//删除
function delet(){
	var value=$("#user_id").val();
	$.post("<%=path%>/user_delete.action",{user_id:value},function(data){
		$('#fm-table').bootstrapTable('refresh',{url: "<%=path%>/user_select.action"});
	},'json')
	$("#myDel").modal("hide");
}
$("#user_name").blur(function(){
	if($("#user_name").val() != ''){
		$.post("<%=path%>/judgeUserName.action",{user_name:$("#user_name").val()},function(data){
			alert("1326");
			if(data.valid == true){
				$("#span_text").text("用户名已存在！");
				$("#s_btn").attr("disabled",true);
			}else{
				$("#s_btn").attr("disabled",false);
				$("#span_text").text("");
			}
		},'json')
	}else{
		$("#s_btn").attr("disabled",true);
		$("#span_text").text("用户名不能为空！");
	}
})
//添加
function add(){
	$("#fm_form")[0].reset();
	$("#option").val("add");
	$("#user_name").attr("readonly",false);
	$("#title_b").text("用户添加");
}
//修改
function mod(value){
	$("#s_btn").attr("disabled",false);
	$("#option").val("mod");
	$("#user_name").attr("readonly",true);
	$("#title_b").text("用户修改");
	$.post("<%=path%>/user_modify.action",{user_id:value},function(data){
		$("#user_id").val(""+data.user_id);
		$("#user_name").val(""+data.user_name);
		$("#password").val(""+data.password);
		$("#affirm_password").val(""+data.password);
		$("#phone").val(""+data.phone);
		if(data.sex == 0){
			$("#sex1").attr("checked",true);
		}else{
			$("#sex2").attr("checked",true);
		}
		$("#age").val(""+data.age);
		if(data.state == 0){
			$("#state1").attr("checked",true);
		}else if(data.state == 1){
			$("#state2").attr("checked",true);
		}else{
			$("#state3").attr("checked",true);
		}
	},'json')
}
//取消
function exit(value){
	if(value == 1){
		$("#myModal").modal("hide");
	}else{
		$("#myDel").modal("hide");
	}
	$("#fm_form")[0].reset();
}
//数据操作
function sub(){
	if($("#user_name").val() != ''){
		if($("#option").val() == 'add'){
			$.post("<%=path%>/user_insert.action",$("#fm_form").serialize(),function(data){
				$('#fm-table').bootstrapTable('refresh',{url: "<%=path%>/user_select.action"});
			},'json')
		}else{
			$.post("<%=path%>/user_update.action",$("#fm_form").serialize(),function(data){
				$('#fm-table').bootstrapTable('refresh',{url: "<%=path%>/user_select.action"});
			},'json')
		}
		$("#myModal").modal("hide");
	}
}
$(function(){
/*-----------------------------------------------------------------------*/	
    $('#fm-table').bootstrapTable({
    	contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		url: "<%=path%>/user_select.action",
		method:"post",
		dataType: "json",
		toolbar:'#toolbar',
		striped:true,//隔行变色
		clickToSelect:true,//是否选中
		cache:false,  //是否使用缓存
		showColumns:false,// 列
		pagination: true, //分页
		sortable: false, //是否启用排序
		singleSelect: false,
		search:true, //显示搜索框
		buttonsAlign: "right", //按钮对齐方式
		showRefresh:true,//是否显示刷新按钮
		sidePagination: "server", //客户端处理分页　服务端：server
		pageNumber:1,//启用插件时默认页数
		pageSize:5,//启用插件是默认每页的数据条数
		pageList:[5, 10, 15, 20],//自定义每页的数量
		undefinedText:'--',
		uniqueId: "year_id", //每一行的唯一标识，一般为主键列
		queryParamsType:'',
		showPaginationSwitch:true,//隐藏分页
		searchAlign:'right',//搜索栏位置
		paginationPreText:'上一页',
		paginationNextText:'下一页',
		height:600,
		maintainSelected:true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项。
        columns: [{
            field: 'user_name',
            title: '用户名称',
            align: 'center'
        },{
            field: 'sex',
            title: '性别',
            align: 'center',
            formatter:function(value,row,index){
            	if(value == '0'){
            		return '男';
            	}else{
            		return '女';
            	}
            }
        }, {
            field: 'age',
            title: '年龄',
            align: 'center'
        }, {
            field: 'state',
            title: '级别',
            align: 'center',
            formatter:function(value,row,index){
            	if(value == '0'){
            		return '普通用户';
            	}else if(value == '1'){
            		return '会计';
            	}else{
            		return '领导';
            	}
            }
        }, {
            field: 'phone',
            title: '联系方式',
            align: 'center'
        }, {
            field: 'create_time',
            title: '创建时间',
            align: 'center'
        },{
            field: 'user_id',
            title: '操作',
            align: 'center',
            formatter:function(value,row,index){
               	var e = '<button  class="btn btn-info"  onclick="mod(\''+value+'\')" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span> 修改</button> ';
                var d = '<button  class="btn btn-danger"  onclick="del(\''+value+'\')" data-toggle="modal" data-target="#myDel"><span class="glyphicon glyphicon-trash"></span> 删除</button> ';
                return e+d;
            }
        }],
    })
})
//跳转
function toPage() {
    var pageNum = $("#pageNum").val();
    if (pageNum) {
        $('#fm-table').bootstrapTable('selectPage', parseInt(pageNum));
    }
}
//删除填充
function del(value){
	$("#user_id").val(""+value);
}
</script>
</html>