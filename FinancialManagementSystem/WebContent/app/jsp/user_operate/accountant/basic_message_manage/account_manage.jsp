<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String path = request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户管理</title>
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
	<div class="line_div"><label>账号管理</label></div>
	<div style="width: 100px;float:left;">
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-content">
				<form id="fm_form" action="#" method="post" class="form-group">
				<table class="tab_operate">
					<tr align="center">
						<td colspan="2" style="font-family: '华文楷体';font-size: 35px"><b id="title_b"></b></td>
					</tr>
					<tr>
						<td align="center"><label>账户人名称:</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="account_name" id="account_name"/>
					 		</div>
					 		<input style="display: none;" id="account_id" name="account_id">
				 		</td>
					</tr>
					<tr>
						<td align="center"><label>账户号码:</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="account" maxlength="15" id="account"/>
					 		</div>
					 		<input style="display: none" id="option">
				 		</td>
					</tr>
					<tr>
						<td align="center"><label>开户行:</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
								<select name="banks_type" id="banks_type" class="form-control">
									<option>工商银行</option>
									<option>建设银行</option>
									<option>农业银行</option>
									<option>邮政储蓄银行</option>
									<option>招商银行</option>
								</select>
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
	<div id="toolbar" class="btn-group">
		<a onclick="addAccount()" href="#" class="btn btn-info" style="width: 100px;" data-toggle="modal" data-target="#myModal">
			<span class="glyphicon glyphicon-plus"></span>账号添加
		</a>
    </div>
	<div class="panel panel-default" style="width:92%;margin:0 auto;">  
		<div class="panel-body">
			<table id="fm-table"></table> 
		</div>  
	</div>
</body>
<script type="text/javascript">
//添加
function addAccount(){
	$("#account").attr("readonly",false);
	$("#fm_form")[0].reset();
	$("#option").val("addAccount");
	$("#title_b").text("账户添加");
}
//修改
function modAccount(value){
	$("#account").attr("readonly",true);
	$("#option").val("mod");
	$("#title_b").text("账户修改");
	$.post("<%=path%>/account_modify.action",{account_id:value},function(data){
		$("#account_id").val(""+data.account_id);
		$("#account_name").val(""+data.account_name);
		$("#account").val(""+data.account);
		$("#create_name").val(""+data.create_name);
		$("#banks_type").val(""+data.banks_type);
		$("#account_oldMoney").val(""+data.account_oldMoney);
	},'json')
}
//取消
function exit(){
	$("#myModal").modal("hide");
	$("#fm_form")[0].reset();
}
//数据操作
function sub(){
	
	if($("#option").val() == "addAccount"){
		$.post("<%=path%>/account_insert.action",$("#fm_form").serialize(),function(data){
			$('#fm-table').bootstrapTable('refresh',{url: "<%=path%>/account_select.action"});
		},'json')
	}else{
		$.post("<%=path%>/account_update.action",$("#fm_form").serialize(),function(data){
			$('#fm-table').bootstrapTable('refresh',{url: "<%=path%>/account_select.action"});
		},'json')
	}
	$("#myModal").modal("hide");
}
$(function(){
/*-----------------------------------------------------------------------*/	
    $('#fm-table').bootstrapTable({
    	contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		url: "<%=path%>/account_select.action",
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
		buttonsAlign: 'right', //按钮对齐方式
		showRefresh:true,//是否显示刷新按钮
		sidePagination: 'server', //客户端处理分页　服务端：server
		pageNumber:1,//启用插件时默认页数
		pageSize:5,//启用插件是默认每页的数据条数
		pageList:[5, 10, 15, 20],//自定义每页的数量
		undefinedText:'--',
		uniqueId: 'account_id', //每一行的唯一标识，一般为主键列
		queryParamsType:'',
		showPaginationSwitch:true,//隐藏分页
		searchAlign:'right',//搜索栏位置
		paginationPreText:'上一页',
		paginationNextText:'下一页',
		height:600,
		maintainSelected:true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项。
        columns: [{
            field: 'account',
            title: '账号',
            align: 'center'
        },{
            field: 'account_name',
            title: '持卡人',
            align: 'center'
        }, {
            field: 'create_name',
            title: '审批人',
            align: 'center'
        },{
            field: 'banks_type',
            title: '开户行',
            align: 'center'
        }, {
            field: 'account_oldMoney',
            title: '原金额',
            align: 'center'
        },{
            field: 'account_newMoney',
            title: '现金额',
            align: 'center'
        },{
            field: 'account_id',
            title: '操作',
            align: 'center',
            formatter:function(value,row,index){
               	var e = '<button  class="btn btn-info"  onclick="modAccount(\''+value+'\')" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span>修改</button> ';
                var d = '<button  class="btn btn-danger"  onclick="delAccount(\''+value+'\')"><span class="glyphicon glyphicon-trash"></span>删除</button> ';
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
function delAccount(value){
	$.post("<%=path%>/account_delete.action",{'account_id':value},function(data){
		$('#fm-table').bootstrapTable('refresh',{url: "<%=path%>/account_select.action"});
	},'json')
}
</script>
</html>