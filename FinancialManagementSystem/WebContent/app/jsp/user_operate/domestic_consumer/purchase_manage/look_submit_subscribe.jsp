<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String path = request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看已提交的申购</title>
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
				height:60%;
				margin: 0 auto;
				float: left;
				margin-left: 50px;
			}
			.tree_div{
				width: 12%;
				float: left;
				display: inline-block;
			}
			.tab_div{
				width: 86%;
				float: left;	
				display: inline-block;
				margin-left: 2%;
			}
		</style>
</head>
<body>
	<div class="line_div"><label>待审申购单</label></div>
	<div class="box">
    	<div id="tree" class="tree_div"></div>
    	<div class="panel panel-default tab_div">  
			<div class="panel-body">  
				<table id="table_server"></table> 
			</div>  
		</div>
    </div>
    <div style="width: 100px;float:left;">
		<div class="modal" id="myModal_detail">
			<div class="modal-dialog modal-content">
				<div class="modal-header">
					<a class="close" data-dismiss="modal">x</a>
					<h3 class="modal-title">申购单明细</h3>
				</div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="purchaseId"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="userId"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="userName"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="purchaseTitle"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="courseId"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="courseName"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="purchaseMoney"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="collectionAccount"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="purchaseDate"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="purchaseMatter"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="dealType"></div></div>
				<div class="modal-body" id="purchaseId"><div class="from-group" id="cashierState"></div></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path %>/app/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=path %>/app/js/bootstrap.js" ></script>
<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table.js" ></script>
<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table-zh-CN.js" ></script>
<script src="<%=path %>/app/js/bootstrap-treeview.js"></script>
<script type="text/javascript">

//刷新
function refresh(){
	$('#table_server').bootstrapTable('refresh',{url: "<%=path%>/pendingTrial_subscribe.action"});
}

//明细
function detail(purchase_id){
	$.post("<%=path%>/subscribeDraft_det.action?purchase_id="+purchase_id,{"operation":"detail"},function(res){
		$("#purchaseId").html("<label>申购单ID：</label>"+res.purchase_id);
		$("#userId").html("<label>用户ID：</label>"+res.user_id);
		$("#userName").html("<label>用户名称：</label>"+res.user_name);
		$("#purchaseTitle").html("<label>申购主题：</label>"+res.purchase_title);
		$("#courseId").html("<label>支出科目ID：</label>"+res.course_id);
		$("#courseName").html("<label>支出科目名称：</label>"+res.course_name);
		$("#purchaseMoney").html("<label>申购金额：</label>"+res.purchase_money);
		$("#collectionAccount").html("<label>收款账号：</label>"+res.collection_account);
		$("#purchaseDate").html("<label>创建时间：</label>"+res.purchase_date);
		$("#purchaseMatter").html("<label>申购事由：</label>"+res.purchase_matter);
		$("#dealType").html("<label>结算方式：</label>"+res.deal_type);
		$("#cashierState").html("<label>申购状态：</label>"+res.cashier_state);
		$("#myModal_detail").modal("show");
	},"json")
}

//撤销
function revocation(purchase_id){
	alert("撤销"+purchase_id);
	$.post("<%=path%>/pendingTrialSubscribe_revocation.action",{purchase_id:purchase_id},function(res){
		alert("撤销成功！");
		refresh();
	},"json")
}

$(function(){
	$('#table_server').bootstrapTable({
      contentType:"application/x-www-form-urlencoded; charset=UTF-8",
      sidePagination: "server",
      url:'<%=path%>/pendingTrial_subscribe.action',
      idField: "purchase_id",
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
      queryParams: function (params) {
      	return {
      		pageNumber: params.pageNumber,	
      		pageSize: params.pageSize,  
      		searchText: params.searchText,
          };
      }, 
      columns: [{
	      		field: 'purchase_title',
	      		title: '申购主题',
	      		align: 'center'
	      	},{
	      		field: 'user_name',
	      		title: '用户',
	      		align: 'center'
	      	},{
	      		field: 'course_name',
	      		title: '科目名',
	      		align: 'center'
	      	},{
	      		field: 'purchase_money',
	      		title: '申购金额',
	      		align: 'center'
	      	},{
	      		field: 'collection_account',
	      		title: '收款账号',
	      		align: 'center'
	      	},{
	      		field: 'purchase_date',
	      		title: '时间',
	      		align: 'center'
	      	},{
	      		field: 'purchase_matter',
	      		title: '申购事由',
	      		align: 'center'
	      	},{
	      		field: 'deal_type',
	      		title: '结算方式',
	      		align: 'center'
	      	},{
	      		field: 'cashier_state',
	      		title: '状态',
	      		align: 'center',
	      		formatter:function(value,row,index){
	      			return "待审批"
	      		}
	      	},{
	      		field: 'operation',
	            title: '操作',
	            align: 'center',
	            formatter:function(value,row,index){
	            	var m = '<button class="btn btn-default" onclick="detail(\''+row.purchase_id+'\')">'
		       					+'<span class="glyphicon glyphicon-th-list"></span>明细'
		          			+'</button> ';
	              	var r = '<button class="btn btn-default" onclick="revocation(\''+row.purchase_id+'\')">'
			       				+'<span class="glyphicon glyphicon-remove"></span>撤销'
		          			+'</button> ';
	                return m + r;
	            }
	      	}
	    ]
	})
})

$('#tree').treeview({
	data: getTree(),
	icon: "glyphicon glyphicon-stop",
	selectedIcon: "glyphicon glyphicon-stop",
	color: "#000000",
	backColor: "#FFFFFF",
	url: "<%=path%>/subscribeDraft_tree.action",							
	selectable: true,
	state: {
	    	checked: true,
	    	disabled: true,
	    	expanded: true,
	    	selected: true
	},
    onNodeSelected: function (event, data) {	//点击事件
    	if(data.parent_id != undefined){
    		$('#table_server').bootstrapTable('refresh',{url: "<%=path%>/pendingTrial_subscribe.action?searchText2="+data.node_id});
    	}else{
    		$('#table_server').bootstrapTable('refresh',{url: "<%=path%>/pendingTrial_subscribe.action?searchText2="});
    	}
    }
});

//获取树数据
function getTree() {
	var tree;
	$.ajax({
		type:'post',
		data:{"operation":"allPaySubject"},
		url:'<%=path%>/subscribeDraft_tree.action',
		success:function(res){
			tree = res;
			for(var i = 0; i < res.length; i++){
				var nodes = res[i].nodes;
				for(var j = 0; j < nodes.length; j++){
					$("#Subject").append("<option value=\""+nodes[j].node_id+"\">"+nodes[j].text+"</option>");
				}
			}
		},
		error:function(res){
			alert("树加载失败！");
		},
		async:false
	})
 	return tree;
}
</script>
</html>