<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String path = request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>审批管理</title>
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap-table.css" />
		<link href="<%=path %>/app/css/bootstrap-treeview.css" rel="stylesheet">
		<style type="text/css">
			.line_div{
				font-size:18px;
				font-family: '楷体';
				color: red;
				width: 95%;
				margin: 2% auto;
				border-bottom: 1.5px solid black;
			}
			.box{
				width:92%;
				margin: 0 auto;
				
			}
			#subscribe{
				margin-left: 15px;
			}
			#pay{
				margin-left: 15px;
			}
			#toolbar>button{
				border-radius:5px;
			}
		</style>
</head>
<body>
	<div class="line_div"><label>审批管理</label></div>
	<div id="toolbar" class="btn-group">
		<button id="reimbursement" type="button" class="btn btn-default" onclick="reimbursementApprove();">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>报销审批
        </button>
        <button id="subscribe" type="button" class="btn btn-default" onclick="subscribeApprove();">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>申购审批
        </button>
        <!-- <button id="pay" type="button" class="btn btn-default" onclick="add();">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>支出审批
        </button> -->
    </div>
    <div class="box">
   		<table id="table_server"></table>
    </div>
</body>
<script type="text/javascript" src="<%=path %>/app/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=path %>/app/js/bootstrap.js" ></script>
<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table.js" ></script>
<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table-zh-CN.js" ></script>
<script src="<%=path %>/app/js/bootstrap-treeview.js"></script>
<script type="text/javascript">

//初始化报销表
reimbursement_table();
var flog = "报销";

//报销
function reimbursementApprove(){
	flog = "报销";
	alert("flog="+flog);
	<%-- $('#table_server').bootstrapTable('refresh',{url: "<%=path%>/pendingTrial_subscribe.action"}); --%>
	reimbursement_table();
}

//申购
function subscribeApprove(){
	flog = "申购";
	alert("flog="+flog);
	<%-- $('#table_server').bootstrapTable('refresh',{url: "<%=path%>/pendingTrial_subscribe.action"}); --%>
	subscribe_table();
}

//明细
function detail(id){
	alert("flog="+flog+"   id="+id);
}

//批准
function approve(){
	
}

//不批准
function onapprove(){
	
}

//报销表格
function reimbursement_table(){
	$("#table_server").bootstrapTable('destroy');
	$('#table_server').bootstrapTable({
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        sidePagination: "server",
        url:'<%=path%>/reimbursementTable_sel.action',
        idField: "id",
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
        pagination: true,
        showRefresh: true,
        singleSelect: false,
        clickToSelect: false,
        showPaginationSwitch:true,
        queryParamsType:'',
        columns: [
            {field: 'approveRecord_id',title: '审批人ID',align: 'center'},
        	{field: 'user_id',title: '用户ID',align: 'center'},
        	{field: 'approve_id',title: '审批单ID',align: 'center'},
        	{field: 'approval_content',title: '审批内容',align: 'center'},
        	{field: 'approval_date',title: '审批时间',align: 'center'},
        	{field: 'approval_state',title: '审批状态',align: 'center'},
        	{
        		field: 'operation',title: '操作',align: 'center',
                formatter:function(value,row,index){
                    return m(row.approveRecord_id) + e(row.approveRecord_id) + d(row.approveRecord_id);
                }
       		}
       	]
	})
}

//申购表格
function subscribe_table(){
	$("#table_server").bootstrapTable('destroy');
	$('#table_server').bootstrapTable({
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        sidePagination: "server",
        url:'<%=path%>/subscribeTable_sel.action',
        idField: "id",
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
        pagination: true,
        showRefresh: true,
        singleSelect: false,
        clickToSelect: false,
        showPaginationSwitch:true,
        queryParamsType:'',
        columns: [
            {field: 'approveRecord_id',title: '审批人ID',align: 'center'},
        	{field: 'user_id',title: '用户ID',align: 'center'},
        	{field: 'approve_id',title: '审批单ID',align: 'center'},
        	{field: 'approval_content',title: '审批内容',align: 'center'},
        	{field: 'approval_date',title: '审批时间',align: 'center'},
        	{field: 'approval_state',title: '审批状态',align: 'center'},
        	{
        		field: 'operation',title: '操作',align: 'center',
                formatter:function(value,row,index){
                    return m(row.approveRecord_id) + e(row.approveRecord_id) + d(row.approveRecord_id);
                }
       		}
       	]
	})
}

function m(id){
	var string = '<button class="btn btn-default" onclick="detail(\''+id+'\')">'
						+'<span class="glyphicon glyphicon-th-list"></span>明细'
				   +'</button> ';
	return string;
}
function e(id){
	var string = '<button class="btn btn-info" onclick="approve(\''+id+'\')">'
						+'<span class="glyphicon glyphicon-ok"></span>批准'
					+'</button> ';
	return string;
} 
function d(id){
	var string = '<button class="btn btn-danger"  onclick="onapprove(\''+id+'\')">'
							+'<span class="glyphicon glyphicon-remove"></span>不批准'
						+'</button> ';
	return string;
}
</script>
</html>