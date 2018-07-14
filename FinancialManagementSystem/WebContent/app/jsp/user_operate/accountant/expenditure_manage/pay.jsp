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
		margin-left:50px;
		float:left;
	}
	.table{
		width:1300px;
		float:left;
	}
	.line_div{
		font-size:20px;
		font-family: '楷体';
		color: red;
		width: 95%;
		margin: 2% auto;
		border-bottom: 1.5px solid black;
	}
</style>
<body>
<div style="border-top:30px solid #505e7b;"></div>
	<div class="box">
		<div class="line_div"><label>支出管理 >> 账单</label></div>
		<div>
			<div class="treeBox" >
				<div id="subjectTree" class="tree"></div>
			</div>
			<div class="table">
				<div id="toolbar" class="btn-group">
					<button id="btn_add" type="button" class="btn btn-default" onclick = "add()">
			            <span class="glyphicon glyphicon-plus"></span>添加
			        </button>
			        <table style="margin-left:500px;">
			        	<tr>
			        		<td><label>支出名称:</label></td>
			        		<td><input type = "text" class="form-control" name="spending_name" id="spending_name_search"/></td>
	
			        		<td><label>付款人:</label></td>
			        		<td><input type = "text"  class="form-control" name="payment_name" id="payment_name_search"/></td>
			        		<td>
			        			<button class="btn btn-default" onclick = "Refresh()">
						            <span class="glyphicon glyphicon-search"></span>搜 索
						        </button>
			        		</td>
			        	</tr>
			        </table>	        	
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
					<a class="close" onclick="Close()">x</a>
					<h3 class="modal-title" id="modal-title"></h3>
				</div>
				<div class="modal-body">
					<form method="POST" role="form" id="addForm">
						<div class="form-group" style="display:none;">
							<input type="text" class="form-control" name="spending_id" id="spending_id"/>
						</div>
						<div class="form-group">  
					        <label>支出名称:</label>  
					        <input type="text" class="form-control" name="spending_name" id="spending_name"/>  
					    </div> 
						<div class="form-group">  
					        <label>科目名称:</label>  
					        <select name="course_id" class="form-control" id="course_id">
					        </select>
					    </div>  
					    <div class="form-group">  
					        <label>付款账号:</label>  
					        <select name="payment_accountNum" class="form-control" id="payment_accountNum">
					        </select>
					    </div>
					    <div class="form-group">  
					        <label>收款账号:</label>  
					        <input type="text" class="form-control" name="gathering_number" id="gathering_number"/>  
					    </div>  
					    <div class="form-group">  
					        <label>收款人:</label>  
					        <input type="text" class="form-control" name="gathering_name" id="gathering_name"/>  
					    </div> 
					    <div class="form-group">  
					        <label>备注:</label>  
					        <input type="text" class="form-control" name="spending_remark" id="spending_remark"/>
					    </div>
					    <div class="modal-footer">
							<a class="btn btn-success" type="submit" id="submit" onclick="Submit()">确认</a>
							<button class="btn btn-danger" onclick="Close()">取消</button>
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
					<h3 class="modal-title">支出明细</h3>
				</div>
				<div class="modal-body">
					<form method="POST" role="form" id="addForm">
						<div class="form-group" id="spending_id_list">
						</div>
						<div class="form-group" id="operation_id_list">
						</div>
						<div class="form-group" id="course_id_list">
						</div>
						<div class="form-group" id="apply_id_list">
						</div>
						<div class="form-group" id="spending_name_list">
						</div>
						<div class="form-group" id="spending_remark_list">
						</div>
						<div class="form-group" id="spending_money_list">
						</div>
						<div class="form-group" id="payment_name_list">
						</div>
						<div class="form-group" id="gathering_name_list">
						</div>
						<div class="form-group" id="payment_accountNum_list">
						</div>
						<div class="form-group" id="gathering_number_list">
						</div>
						<div class="form-group" id="deal_type_list">
						</div>
						<div class="form-group" id="create_date_list">
						</div>
						<div class="form-group" id="payment_date_list">
						</div>
						<div class="form-group" id="spending_state_list">
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
	$.post("<%=name%>/getTree.action","",function(list){
		$("#subjectTree").treeview({data:list,
			collapseIcon: "glyphicon glyphicon-triangle-bottom",
			expandIcon: "glyphicon glyphicon-triangle-right",
			levels:0,
			onNodeSelected:function(event, data){ 
				if(data.parent_id != undefined){
					$("#course_id").val(data.node_id)
					getTable(data.node_id);
				}
			}
			});
	},"json")
	getTable(null);
	$.post("<%=name%>/getSelect.action","",function(data){
		var course = "";
		var payment = "";
		var courseList = data.courseList;
		var accountList = data.accountList;
		for (var i = 0; i < courseList.length; i++) {   //科目
			course += "<option value='"+courseList[i].course_id+"'>"+courseList[i].course_name+"</option>";
		}
		for (var i = 0; i < accountList.length; i++) {	//账户
			payment += "<option value='"+accountList[i].account+"'>"+accountList[i].account+"</option>";
		}
		$("#course_id").html(course);
		$("#payment_accountNum").html(payment);
	},"json")
})
function getTable(course_id){
	$("#table").bootstrapTable('destroy'); //销毁上一次加载的表格
	$('#table').bootstrapTable({
		 url:"<%=name%>/selectPayTable.action?searchText2="+course_id,   
		 method: 'post', 
		 striped: true,
		 cache: false,
		 sortable: true,
		 sortOrder: "asc",
		 toolbar: '#toolbar', 
		 showColumns: true, 
		 showRefresh: true,
		 clickToSelect: false,
		 uniqueId: "spending_id",
		 cardView: false,
		 columns:[
		      {field:'spending_id',title:'支出ID'},
	          {field:'spending_name',title:'支出名称'},
	          {field:'course_id',title:'所属科目'},
	          {field:'spending_money',title:'总金额'},
	          {field:'payment_name',title:'付款人'},
	          {field:'gathering_name',title:'收款人'},
	          {field:'spending_remark',title:'账单描述'},
	          {field:'create_date',title:'创建时间'},
	          {field:"spending_id",title:"操作",
	        	align:'center',valign:'middle',
	        	formatter:function(value, row, index){
	        		var id = row.spending_id;
	                var result = "";
	                result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"SubmitById('" +id+ "')\" title='提交'>提交</a>";
	                result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"ListById('" +id+ "')\" title='明细' data-toggle='modal' data-target='#listModal'>明细</a>";
	                result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"UpdateById('" +id+ "')\" title='修改'><span class='glyphicon glyphicon-edit'></span></a>";
	                result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"DeleteById('" +id+ "')\" title='删除'><span class='glyphicon glyphicon-folder-close'></span></a>";
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
              searchText:$("#spending_name_search").val() ,/* 设置搜索框要搜索的属性名称 */ 
              searchText1:$("#payment_name_search").val()
          }; 
          return param;
         },
         locale:'zh-CN',
         pagination: true,
         sidePagination: "server",
         contentType: "application/x-www-form-urlencoded",
	});
}
//按钮点击事件
function Submit(){
	if($("#modal-title").text() == "支出账单添加"){
		$.post("<%=name%>/payAdd.action",$("#addForm").serialize(),function(data){
			alert("添加成功!")
			Refresh();
		},"json")
	}else if($("#modal-title").text() == "支出账单修改"){
		$.post("<%=name%>/payUpdate.action",$("#addForm").serialize(),function(data){
			alert("修改成功!")
			Refresh();
		},"json")
	}
	Close();//关闭模态框
}
//提交
function SubmitById(id){
	$.post("<%=name%>/paySubmit.action",{"spending_id":id},function(data){
		alert("提交成功!")
		Refresh();
	},"json")
}
//明细
function ListById(id){
	$.post("<%=name%>/getSpending.action",{"spending_id":id},function(data){
		$("#spending_id_list").html("<label>支出ID:</label>"+data.spending_id);
		$("#operation_id_list").html("<label>会计ID:</label>"+data.operation_id);
		$("#course_id_list").html("<label>科目ID:</label>"+data.course_id);
		$("#apply_id_list").html("<label>申请单ID:</label>"+data.apply_id);
		$("#spending_name_list").html("<label>支出名称:</label>"+data.spending_name);
		$("#spending_remark_list").html("<label>备注:</label>"+data.spending_remark);
		$("#spending_money_list").html("<label>金额:</label>"+data.spending_money);
		$("#payment_name_list").html("<label>付款人:</label>"+data.payment_name);
		$("#gathering_name_list").html("<label>收款人:</label>"+data.gathering_name);
		$("#payment_accountNum_list").html("<label>付款账号:</label>"+data.payment_accountNum);
		$("#gathering_number_list").html("<label>收款账号:</label>"+data.gathering_number);
		$("#deal_type_list").html("<label>结算方式:</label>"+data.deal_type);
		$("#create_date_list").html("<label>创建时间:</label>"+data.create_date);
		$("#payment_date_list").html("<label>付款时间:</label>"+data.payment_date);
		$("#spending_state_list").html("<label>状态:</label>草稿");
	},"json")
}
//修改
function UpdateById(id){
	$(".modal-title").text("支出账单修改");
	$.post("<%=name%>/getSpending.action",{"spending_id":id},function(data){
		$("#spending_id").val(data.spending_id);
		$("#spending_name").val(data.spending_name);
		$("#course_id").val(data.course_id);
		$("#payment_accountNum").val(data.payment_accountNum);
		$("#gathering_number").val(data.gathering_number);
		$("#gathering_name").val(data.gathering_name);
		$("#spending_remark").val(data.spending_remark);
	},"json");
	Show();
}
//删除
function DeleteById(id){
	$.post("<%=name%>/payDelete.action",{"spending_id":id},function(data){
		alert("删除成功!")
	},"json")
	Refresh();
}
//添加
function add(){
	$("#modal-title").text("支出账单添加");
	Show();
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
	$("#addForm")[0].reset();//清除form表单中的数据
}
</script>
</html>