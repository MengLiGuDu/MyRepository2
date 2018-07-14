<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String name = request.getContextPath();
%>
<link rel="stylesheet" href="<%=name%>/app/css/bootstrap.css">
<link rel="stylesheet" href="<%=name%>/app/css/bootstrap-table.css">
<link rel="stylesheet" href="<%=name%>/app/css/bootstrap-treeview.css"> 
<script src="<%=name%>/app/js/jquery-3.2.1.js"></script>  
<script src="<%=name%>/app/js/bootstrap.js"></script> 
<script src="<%=name%>/app/js/bootstrap-table.js"></script> 
<script src="<%=name%>/app/js/bootstrap-treeview.js"></script> 
<script src="<%=name%>/app/js/bootstrap-table-zh-CN.js"></script>
</head>
<style>
	.title{
		margin-top:20px;
		margin-bottom: 20px;
	}
	.box{
		margin-top:20px;
		margin-left:20px;
	}
	.treeBox{
		width:200px;
		margin-right: 20px;
		float:left;
	}
	.table{
		width:1300px;
		float:left;
	}
	.search{
		width:70px;
		height:35px;
		background:white;
		border:1px solid #ededed;
	}
</style>
<body>
	<div class="box">
		<div class="title">
			查看未通过申购
			</div>
			<div>
			<div class="treeBox" >
				<div id="subjectTree" class="tree"></div>
			</div>
			<div class="table">
				<div id="toolbar" class="btn-group">
			        <label>申购主题:</label>
	            	<input type = "text" name="purchase_title" id="purchase_title_search"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	            	<button type="button" class="search" onclick = "Refresh()">
			            <span class="glyphicon glyphicon-search"></span>搜索
			        </button>
				</div>
				<div>
					<table id="table"></table>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<a class="close" data-dismiss="modal">x</a>
					<h3 class="modal-title" id="modal-title"></h3>
				</div>
				<div class="modal-body">
					<form method="POST" role="form" id="addForm">
						<div class="form-group" style="display:none;">
							<input type="text" class="form-control" name="purchase_id" id="purchase_id"/>
						</div>
						<div class="form-group">  
					        <label>科目名称:</label>  
					        <select name="course_id" class="form-control" id="course_id">
					        </select>
					    </div>
					    <div class="form-group">  
					        <label>申购主题:</label>  
					        <input type="text" class="form-control" name="purchase_title" id="purchase_title"/>  
					    </div>   
					    <div class="form-group">  
					        <label>申购金额:</label>  
					        <input type="text" class="form-control" name="purchase_money" id="purchase_money"/>  
					    </div>  
					    <div class="form-group">  
					        <label>申购事由:</label>  
					        <input type="text" class="form-control" name="purchase_matter" id="purchase_matter"/>  
					    </div> 
					    <div class="modal-footer">
							<a class="btn btn-success" type="submit" id="submit" onclick="Submit()">确认</a>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="listModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<a class="close" data-dismiss="modal">x</a>
					<h3 class="modal-title">未通过申购明细</h3>
				</div>
				<div class="modal-body">
					<form method="POST" role="form" id="addForm">
						<div class="form-group" id="spending_id_list">
						</div>
						<div class="form-group" id="user_id_list">
						</div>
						<div class="form-group" id="user_name_list">
						</div>
						<div class="form-group" id="purchase_title_list">
						</div>
						<div class="form-group" id="course_id_list">
						</div>
						<div class="form-group" id="course_name_list">
						</div>
						<div class="form-group" id="purchase_money_list">
						</div>
						<div class="form-group" id="collection_account_list">
						</div>
						<div class="form-group" id="purchase_date_list">
						</div>
						<div class="form-group" id="purchase_matter_list">
						</div>
						<div class="form-group" id="deal_type_list">
						</div>
						<div class="form-group" id="cashier_state_list">
						</div>
					    <div class="modal-footer">
							<a class="btn btn-success" type="submit" data-dismiss="modal">确认</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$.post("<%=name%>/subscribeDraft_tree.action","",function(list){
		$("#subjectTree").treeview({data:list,
			collapseIcon: "glyphicon glyphicon-triangle-bottom",
			expandIcon: "glyphicon glyphicon-triangle-right",
			levels:0,
			onNodeSelected:function(event, data){ 
				if(data.parent_id != undefined){
					getTable(data.node_id);
				}
			}
			});
	},"json")
	getTable(null);
	$.post("<%=name%>/getSelect.action","",function(data){
		var course = "";
		var courseList = data.courseList;
		for (var i = 0; i < courseList.length; i++) {   //科目
			course += "<option value='"+courseList[i].course_id+"'>"+courseList[i].course_name+"</option>";
		}
		$("#course_id").html(course);
	},"json")
})
function getTable(course_id){
	$("#table").bootstrapTable('destroy'); //销毁上一次加载的表格
	$('#table').bootstrapTable({
		 url:"<%=name%>/getNotPassSubscribeTable.action?searchText1="+course_id,   
		 method: 'post', 
		 striped: true,
		 cache: false,
		 sortable: true,
		 sortOrder: "asc",
		 toolbar: '#toolbar', 
		 showColumns: true, 
		 showRefresh: true,
		 clickToSelect: false,
		 uniqueId: "purchase_id",
		 cardView: false,
		 columns:[
		      {field:'purchase_id',title:'申购单ID'},
	          {field:'user_name',title:'用户名称'},
	          {field:'course_name',title:'所属科目'},
	          {field:'purchase_money',title:'申购金额'},
	          {field:'purchase_date',title:'申购时间'},
	          {field:'cashier_state',title:'申购状态',formatter:function(index,row,value){
	        	  return "未通过"
	          	}},
	          {field:"purchase_id",title:"操作",
	        	align:'center',valign:'middle',
	        	formatter:function(value, row, index){
	        		var id = row.purchase_id;
	                var result = "";
	                result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"ListById('" +id+ "')\" title='明细' data-toggle='modal' data-target='#listModal'>明细</a>";
	                result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"UpdateById('" +id+ "')\" title='修改' data-toggle='modal' data-target='#myModal'><span class='glyphicon glyphicon-edit'></span></a>";
	                result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"DeleteById('" +id+ "')\" title='删除'><span class='glyphicon glyphicon-folder-close'></span></a>";
	                result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"AgainSubmit('" +id+ "')\" title='重新提交'>重新提交</a>";
	        		return result;
	        	},
	        	},
		 ],
		 pageSize:5,
		 searchOnEnterKey: false,
		 queryParamsType:'', 
         queryParams: function queryParams(params) {  
          var param = {  
              pageNumber: params.pageNumber,    
              pageSize: params.pageSize,
              searchText:$("#purchase_title_search").val() ,/* 设置搜索框要搜索的属性名称 */ 
          }; 
          return param;
         },
         locale:'zh-CN',
         pagination: true,
         sidePagination: "server",
         contentType: "application/x-www-form-urlencoded",
	});
}
//修改提交
function Submit(){
	$.post("<%=name%>/notPassSubscribeUpdate.action",$("#addForm").serialize(),function(data){
		Close()
		Refresh();
		alert("修改成功!")
	},"json")
}
//重新提交
function AgainSubmit(id){
	$.post("<%=name%>/notPassSubscribeAgainSubmit.action",{"purchase_id":id},function(data){
		Refresh();
		alert("重新提交成功!")
	},"json")
}
//明细
function ListById(id){
	$.post("<%=name%>/selectANotPassSubscribe.action",{"purchase_id":id},function(data){
		$("#purchase_id_list").html("<label>申购单ID:</label>"+data.purchase_id);
		$("#user_id_list").html("<label>用户ID:</label>"+data.user_id);
		$("#user_name_list").html("<label>用户名:</label>"+data.user_name);
		$("#purchase_title_list").html("<label>申购主题:</label>"+data.purchase_title);
		$("#course_id_list").html("<label>支出科目ID:</label>"+data.course_id);
		$("#course_name_list").html("<label>支出科目名:</label>"+data.course_name);
		$("#purchase_money_list").html("<label>申购金额:</label>"+data.purchase_money);
		$("#collection_account_list").html("<label>收款账号:</label>"+data.collection_account);
		$("#purchase_date_list").html("<label>申购时间:</label>"+data.purchase_date);
		$("#purchase_matter_list").html("<label>申购事由:</label>"+data.purchase_matter);
		$("#deal_type_list").html("<label>结算方式:</label>"+data.deal_type);
		$("#cashier_state_list").html("<label>状态:</label>未通过");
	},"json")
}
//修改
function UpdateById(id){
	$.post("<%=name%>/selectANotPassSubscribe.action",{"purchase_id":id},function(data){
		$("#purchase_id").val(data.purchase_id);
		$("#course_id").val(data.course_id);
		$("#purchase_title").val(data.purchase_title);
		$("#purchase_money").val(data.purchase_money);
		$("#purchase_matter").val(data.purchase_matter);
	},"json")
}
//删除
function DeleteById(id){
	$.post("<%=name%>/notPassSubscribeDelete.action",{"purchase_id":id},function(data){
		Refresh();
		alert("删除成功!")
	},"json")
}
//刷新
function Refresh(){
	$("#table").bootstrapTable('refresh');
}
//显示模态框
function Show(){
	$("#myModal").modal('show') 
}
//关闭模态框
function Close(){
	$("#myModal").modal('toggle')
}
</script>
</html>