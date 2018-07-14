<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String path = request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>支出科目管理</title>
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap-table.css" />
		<style type="text/css">
			.tab_operate{
				width:300px;
				height:400px;
				margin-left:115px;
			}
			.tab_div{
				width: 92%;
				margin: 0 auto;
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
	<div class="line_div"><label>支出科目管理</label></div>
	<div id="toolbar" class="btn-group">
		<button id="btn_add" type="button" class="btn btn-default" onclick="add();">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
    </div>
	<div class="panel panel-default tab_div">  
		<div class="panel-body">  
			<table id="table_server"></table> 
		</div>  
	</div>
	<div style="width: 100px;float:left;">
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-content">
				<form id="form" action="#" method="post" class="form-group">
				<table class="tab_operate">
					<tr align="center">
						<td colspan="2" style="font-family: '华文楷体';font-size: 35px"><b id="title_b"></b></td>
					</tr>
					<tr>
						<td align="center" width="120"><label>支出父科目：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
								<select name="fatherCourse_id" id="pay_fatherSubject" class="form-control"></select>
					 		</div>
					 		<input style="display: none" id="course_id" name="course_id">
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label>支出科目名称：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="course_name" maxlength="15" id="paySubject_name"/>
					 		</div>
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label>支出科目描述：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<textarea class="form-control" rows="3" name="course_remark" id="paySubject_desc"></textarea> 
					 		</div>
				 		</td>
					</tr>
					<tr>
						<td align="center"><input onclick="exit()" type="button" class="btn btn-default" style="width: 100px;" value="取 消" ></td>
						<td align="right"><input onclick="sub()" type="button" class="btn btn-success" style="width: 100px;" value="提 交" /></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path %>/app/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=path %>/app/js/bootstrap.js" ></script>
<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table.js" ></script>
<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table-zh-CN.js" ></script>
<script type="text/javascript">

//取消
function exit(){
	$("#myModal").modal("hide");
	$("#form")[0].reset();
}

//刷新
function refresh(){
	$('#table_server').bootstrapTable('refresh',{url: "<%=path%>/paySubject_sel.action"});
}

//提交
function sub(){
	if($("#title_b").text() == "添加科目"){
		$.post("<%=path%>/paySubject_add.action",$("#form").serialize(),function(res){
			if(res == true){
				alert("添加成功！");
				refresh();
			}
		},'json')
	}else if($("#title_b").text() == "修改科目"){
		$.post("<%=path%>/paySubject_upd.action",$("#form").serialize(),function(res){
			if(res == true){
				alert("修改成功！");
				refresh();
			}
		},'json')
	}
	$("#myModal").modal("hide");
}

//添加
function add(){
	//ajax从后台拿到所有支出父科目，用来填充支出父科目复选框
	$.post("<%=path%>/father_paySubject.action",{"operation":"allFatherPaySubject"},function(res){
		$("#pay_fatherSubject").find("option").remove();
		for(var i = 0; i < res.length; i++){
			$("#pay_fatherSubject").append("<option value=\""+res[i].course_id+"\">"+res[i].course_name+"</option>");
		}
		$("#pay_fatherSubject").append("<option value=\""+0+"\">null</option>");
		$("#title_b").text("添加科目");
		$("#myModal").modal("show");
	},"json")
}

//修改
function edit(array){
	var arr = array.split(',');
	//默认选中原项
	$.post("<%=path%>/father_paySubject.action",{"operation":"allFatherPaySubject"},function(res){
		$("#pay_fatherSubject").find("option").remove();
		for(var i = 0; i < res.length; i++){
			if(res[i].course_id == arr[2]){
				$("#pay_fatherSubject").append("<option selected='selected' value=\""
						+res[i].course_id+"\">"+res[i].course_name+"</option>");
			}else{
				$("#pay_fatherSubject").append("<option value=\""
						+res[i].course_id+"\">"+res[i].course_name+"</option>");
			}
		}
		$("#pay_fatherSubject").append("<option value=\""+0+"\">null</option>");
		$("#paySubject_name").val(arr[1]);
		$("#paySubject_desc").val(arr[3]);
		$("#course_id").val(arr[0]);
		$("#title_b").text("修改科目");
		$("#myModal").modal("show");
	},"json")
}

//删除
function del(arr){
	var array = arr.split(',');
	var course_id = array[0];
	var fatherCourse_id = array[1];
	$.ajax({
		type:'post',
		data:{course_id:course_id},
		url:'<%=path %>/paySubject_del.action',
		success:function(res){
			if(res == true){
				alert("删除成功！");
				refresh();
			}else{
				alert("该科目下有子科目存在，不能进行删除操作！");
			}
		},
		error:function(res){
			alert("操作失败！");
		},
		async:true
	})
}

$(function(){
	$('#table_server').bootstrapTable({
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        sidePagination: "server",
        url:'<%=path%>/paySubject_sel.action',
        idField: "course_id",
        method: 'post',
        dataType: "json",
        toolbar : "#toolbar",
        data_local: "zh-US",
        pageNumber: 1,
        pageSize:5,
        pageList:[5, 10, 15, 20],
        undefinedText: "空",
        paginationPreText: '‹',
        paginationNextText: '›',
        search: true,
        striped:true,
        pagination: true,
        showRefresh: true,
        singleSelect: false,
        clickToSelect: false,
        showPaginationSwitch:true,
        queryParamsType:'',
        columns: [{
	        	field: 'course_id',
	        	title: '科目ID',
	        	align: 'center'
        	},{
        		field: 'fatherCourse_name',
        		title: '父科目名称',
        		align: 'center'
        	},{
        		field: 'course_name',
        		title: '科目名称',
        		align: 'center'
        	},{
        		field: 'course_remark',
        		title: '科目描述',
        		align: 'center'
        	},{
        		field: 'create_name',
        		title: '创建人',
        		align: 'center'
        	},{
        		field: 'create_date',
        		title: '创建时间',
        		align: 'center'
        	},{
        		field: 'operation',
                title: '操作',
                align: 'center',
                formatter:function(value,row,index){
                   	var e = '<button  class="btn btn-info" onclick="edit(\''+row.course_id+","
                   				+row.course_name+","+row.fatherCourse_id+","+row.course_remark+'\')">'
                   					+'<span class="glyphicon glyphicon-pencil"></span>修改'
                  			+'</button> ';
                    var d = '<button  class="btn btn-danger"  onclick="del(\''+row.course_id+'\')">'
                    			+'<span class="glyphicon glyphicon-remove"></span>删除'
                  			+'</button> ';
                    return e + d;
                }
        	}
        ]
	})
})
</script>
</html>