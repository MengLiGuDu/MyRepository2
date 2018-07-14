<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String path = request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>年度管理</title>
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap-table.css" />
		
		<script type="text/javascript" src="<%=path %>/app/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap.js" ></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table.js" ></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table-zh-CN.js" ></script>
		<style type="text/css">
			.goPage {
			    line-height: 30px;
			     margin-top: 10px;
			}
			.batchDel{
				margin-left:30px;
				margin-top:10px;
				float: left;
			}
			.tab_operate{
				width:300px;
				height:400px;
				margin-left:115px;
			}
		</style>
</head>
<body>

	<div style="width:100px;float:left;">
		<a onclick="add()" href="#" class="btn btn-info" style="width: 80px;margin-left:10px;margin-top:10px;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span> 添加</a>
	</div>
	<div style="width: 100px;float:left;">
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-content">
				<form id="fm_form" action="#" method="post" class="form-group">
				<table class="tab_operate">
					<tr align="center">
						<td colspan="2" style="font-family: '华文楷体';font-size: 35px"><b id="title_b"></b></td>
					</tr>
					<tr>
						<td align="center" width="120"><label>年度名称：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="year_name" maxlength="15" id="year_name"/>
					 		</div>
					 		<input style="display: none;" id="year_id" name="year_id">
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label>开始时间：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="date" class="form-control" name="year_beginDate" maxlength="15" id="year_beginDate"/>
					 		</div>
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label>结束时间：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="date" class="form-control" name="year_finishDate" id="year_finishDate"/>
					 		</div>
					 		<input style="display: none" id="option">
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
	<table id="fm-table" class="col-xs-12"></table>
</body>
<script type="text/javascript">
//添加
function add(){
	$("#fm_form")[0].reset();
	$("#option").val("add");
	$("#title_b").text("年度添加");
}
//修改
function mod(value){
	$("#option").val("mod");
	$("#title_b").text("年度修改");
	$.post("<%=path%>/year_modify.action",{year_id:value},function(data){
		$("#year_id").val(""+data.year_id);
		$("#year_name").val(""+data.year_name);
		$("#year_beginDate").val(""+data.year_beginDate);
		$("#year_finishDate").val(""+data.year_finishDate);
	},'json')
}
//取消
function exit(){
	$("#myModal").modal("hide");
	$("#fm_form")[0].reset();
}
//数据操作
function sub(){
	
	if($("#option").val() == "add"){
		$.post("<%=path%>/year_insert.action",$("#fm_form").serialize(),function(data){
			$('#fm-table').bootstrapTable('refresh',{url: "<%=path%>/year_select.action"});
		},'json')
	}else{
		$.post("<%=path%>/year_update.action",$("#fm_form").serialize(),function(data){
			$('#fm-table').bootstrapTable('refresh',{url: "<%=path%>/year_select.action"});
		},'json')
	}
	$("#myModal").modal("hide");
}
$(function(){
/*-----------------------------------------------------------------------*/	
    $('#fm-table').bootstrapTable({
    	contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		url: "<%=path%>/year_select.action",
		method:"post",
		dataType: "json",
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
		height:740,
		maintainSelected:true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项。
        columns: [{
            field: 'year_name',
            title: '年度名称',
            align: 'center'
        },{
            field: 'year_beginDate',
            title: '开始时间',
            align: 'center'
        }, {
            field: 'year_finishDate',
            title: '结束时间',
            align: 'center'
        }, {
            field: 'create_name',
            title: '创建人',
            align: 'center'
        },{
            field: 'create_date',
            title: '创建时间',
            align: 'center'
        },{
            field: 'year_id',
            title: '操作',
            align: 'center',
            formatter:function(value,row,index){
               	var e = '<button  class="btn btn-info"  onclick="mod(\''+value+'\')" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span> 修改</button> ';
                var d = '<button  class="btn btn-danger"  onclick="del(\''+value+'\')"><span class="glyphicon glyphicon-trash"></span> 删除</button> ';
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
//删除
function del(value){
	$.post("<%=path%>/year_delete.action",{'year_id':value},function(data){
		$('#fm-table').bootstrapTable('refresh',{url: "<%=path%>/year_select.action"});
	},'json')
}
</script>
</html>