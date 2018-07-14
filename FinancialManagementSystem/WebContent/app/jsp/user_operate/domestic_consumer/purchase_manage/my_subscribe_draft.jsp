<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String path = request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的申购草稿</title>
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap-table.css" />
		<link href="<%=path %>/app/css/bootstrap-treeview.css" rel="stylesheet">
		<style type="text/css">
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
			.tab_operate{
				width:300px;
				height:500px;
				margin-left:115px;
			}
		</style>
</head>
<body>
	<div class="line_div"><label>我的申购草稿</label></div>
	<div id="toolbar" class="btn-group">
		<button type="button" class="btn btn-default" onclick="add();">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加收购单
        </button>
    </div>
    <div class="box">
    	<div id="tree" class="tree_div"></div>
    	<div class="panel panel-default tab_div">  
			<div class="panel-body">  
				<table id="table_server"></table> 
			</div>  
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
						<td align="center" width="120"><label>科目：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
								<select name="course_id" id="Subject" class="form-control"></select>
					 		</div>
					 		<input style="display: none" id="purchase_id" name="purchase_id">
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label>主题：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="purchase_title" maxlength="15" id="title"/>
					 		</div>
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label>内容：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="purchase_matter" maxlength="15" id="content"/>
					 		</div>
				 		</td>
					</tr>
					<tr>
						<td align="center" width="120"><label>金额：</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="purchase_money" maxlength="15" id="money"/>
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

//取消
function exit(){
	$("#myModal").modal("hide");
	$("#form")[0].reset();
}

//刷新
function refresh(){
	$('#table_server').bootstrapTable('refresh',{url: "<%=path%>/subscribeDraft_sel.action"});
}

//提交
function sub(){
	if($("#title_b").text() == "添加收购单"){
		$.ajax({
			type:'post',
			data:$("#form").serialize(),
			url:'<%=path%>/subscribeDraft_add.action',
			success:function(res){
				if(res == true){
					alert("添加成功!");
					refresh();
				}
			},
			error:function(res){
				alert("操作失败！");
			},
			async:true
		})
	}else if($("#title_b").text() == "修改收购单"){
		$.ajax({
			type:'post',
			data:$("#form").serialize(),
			url:'<%=path%>/subscribeDraft_upd.action',
			success:function(res){
				if(res == true){
					alert("修改成功!");
					refresh();
				}
			},
			error:function(res){
				alert("操作失败！");
			},
			async:true
		})
	}
	$("#myModal").modal("hide");
}

//添加
function add(){
	$("#title_b").text("添加收购单");
	$("#myModal").modal("show");
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

//修改
function edit(arr){
	var array = arr.split(',');
	var purchase_id = array[0];
	var course_name = array[1];
	var purchase_title = array[2];
	var purchase_matter = array[3];
	var purchase_money = array[4];
	$("#purchase_id").val(purchase_id);
	$("#Subject").find("option:contains('"+course_name+"')").attr("selected",true);
	$("#title").val(purchase_title);
	$("#content").val(purchase_matter);
	$("#money").val(purchase_money);
	$("#title_b").text("修改收购单");
	$("#myModal").modal("show");
}

//删除
function del(purchase_id){
	$.ajax({
		type:'post',
		data:{purchase_id:purchase_id},
		url:'<%=path%>/subscribeDraft_del.action',
		success:function(res){
			if(res == true){
				alert("删除成功!");
				refresh();
			}
		},
		error:function(res){
			alert("操作失败！");
		},
		async:true
	})
}

//申购提交（申购状态改为 2（待审批））
function submit(purchase_id){
	$.ajax({
		type:'post',
		data:{purchase_id:purchase_id},
		url:'<%=path%>/subscribeDraft_sub.action',
		success:function(res){
			if(res == true){
				alert("提交成功!");
				refresh();
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
      url:'<%=path%>/subscribeDraft_sel.action',
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
	      			return "草稿"
	      		}
	      	},{
	      		field: 'operation',
	            title: '操作',
	            align: 'center',
	            formatter:function(value,row,index){
	            	var m = '<button class="btn btn-default" onclick="detail(\''+row.purchase_id+'\')">'
		       					+'<span class="glyphicon glyphicon-th-list"></span>明细'
		          			+'</button> ';
	               	var e = '<button class="btn btn-info" onclick="edit(\''+row.purchase_id+","
	               				+row.course_name+","+row.purchase_title+","+row.purchase_matter
	               					+","+row.purchase_money+'\')">'
	               				+'<span class="glyphicon glyphicon-pencil"></span>修改'
	              			+'</button> ';
	                var d = '<button class="btn btn-danger"  onclick="del(\''+row.purchase_id+'\')">'
	                			+'<span class="glyphicon glyphicon-remove"></span>删除'
	              			+'</button> ';
	              	var t = '<button class="btn btn-default" onclick="submit(\''+row.purchase_id+'\')">'
			       				+'<span class="glyphicon glyphicon-ok"></span>提交'
		          			+'</button> ';
	                return m + e + d + t;
	            }
	      	}
	    ]
	})
})

$('#tree').treeview({
	data: getTree(),							//数据
	icon: "glyphicon glyphicon-stop",			//默认图标样式
	selectedIcon: "glyphicon glyphicon-stop",	//被选中节点图标样式
	color: "#000000",							//设置列表树所有节点的前景色	
	backColor: "#FFFFFF",						//设置所有列表树节点的背景颜色
	url: "<%=path%>/subscribeDraft_tree.action",							
	selectable: true,							//指定列表树的节点是否可选择，false将使节点展开，并且不能被选择
	state: {
	    	checked: true,
	    	disabled: true,
	    	expanded: true,
	    	selected: true
	},
    onNodeSelected: function (event, data) {	//点击事件
    	if(data.parent_id != undefined){
    		$('#table_server').bootstrapTable('refresh',{url: "<%=path%>/subscribeDraft_sel.action?searchText2="+data.node_id});
    		$("#Subject").find("option:contains('"+data.text+"')").attr("selected",true);
    	}else{
    		$('#table_server').bootstrapTable('refresh',{url: "<%=path%>/subscribeDraft_sel.action?searchText2="});
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
				/* console.log("id="+res[i].node_id+"  name="+res[i].text+"  NodeBean="+res[i].nodes); */
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