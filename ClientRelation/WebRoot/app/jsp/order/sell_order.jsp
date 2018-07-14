<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售订单</title>
</head>
<script type="text/javascript">
$(function(){
	/* function AddFunctionAlty(value,row,index){
		  return[
		       '<button id="TableEditor" type="button" class="btn btn-default">修 改</button>'
		 ]
	}
	 window.operateEvents = {
		"click #TableEditor":function(e,value,row,index){
			$("#myModal").modal();
			$("#order_id").val(row.order_id);
			$("#product_id").find("option[value="+row.product_id+"]").prop("selected",true);
			$("#person_id").find("option[value="+row.person_id+"]").prop("selected",true);
			$("#client_id").find("option[value="+row.client_id+"]").prop("selected",true);
			$("#remark").val(row.remark);
			
		}
	 } */
	$("#tb").bootstrapTable({
		method : 'post',
		url : '<%=PATH%>/sellOrderSelect.action',
		dataType : "json",
		striped : true,
		pagination : true,
		pageSize : 5,
		pageNumber : 1,
		height:400,
		pageList : [ 3, 5, 10 ],
		idField : "order_id",
		showRefresh : true, 
		singleSelect: true,
		search : true,
		queryParams : queryParams, 
		clickToSelect : true,
		sidePagination : "server",
		queryParamsType : '',
		toolbar: "#toolbar", 
		locales : "zh-CN",
		silent : true,
		contentType : "application/x-www-form-urlencoded",
		columns : [  [ 
		      {field : 'order_id',align : 'center',title : '订单编号'},
		      {field : 'create_time',align : 'center',title : '创建时间'},
			{field : 'product_id',align : 'center',title : '产品名称',
		    	  	formatter:function(value,row,index){
			    		var id = row.product_id;
			    		var name ;
			    		$.ajax({
			    			url :  "${path}/ClientRelation/orderSelectProduct.action",
							type : "post",
							dataType : "json",
							async:false,
							data :{'product_id':id}, 
							success:function(data){
				    		        name = data.name;
							}
			    		})
			    		return name;
			    	  }
			},
			{field : 'person_id',align : 'center',title : '销售负责人',
				formatter:function(value,row,index){
					var id = row.person_id;
					var name;
					$.ajax({
						url :  "${path}/ClientRelation/sellChanceSelectPerson.action",
						type : "post",
						async:false,
						data :{
							'person_id':id,
						},
						success : function(data) {
							name = data.name;
						}
					})
					return name;
				}
			},
			{field : 'client_id',align : 'center',title : '客户名称',
				 formatter:function(value,row,index){
			    		var id = row.client_id;
			    		var name ;
			    		$.ajax({
			    			url :  "${path}/ClientRelation/sellChanceSelectClient.action",
							type : "post",
							dataType : "json",
							async:false,
							data :{'client_id':id}, 
							success:function(data){
				    		        name = data.client_name;
							}
			    		})
			    		return name;
			    	  }
			},
			{field : 'count',align : 'center',title : '数量'},
			{field : 'price',align : 'center',title : '总数'},
			{field : 'remark',align : 'center',title : '备注'},
			/* {field : 'operate',align : 'center',title : '操作',
			      events:operateEvents,
				formatter:AddFunctionAlty
			} */
		] ]
	})
	
	function queryParams(params) { //bootstrapTable自带参数  
		var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
			pageSize : params.pageSize, //页面大小  
			pageNumber : params.pageNumber,
			name : params.searchText
		};
		return temp;
	}
	/* $("#button").click(function(){
		$("#myModal").modal();
	})
	
	 $("#button01").click(function(){
	    	 var post = $("#formModel").serialize();
	 		$.ajax({
	 			url : "${path}/ClientRelation/orderModify.action",
	 			type : "post",
	 			data :post,
	 			success : function(data) {
	 				$("#myModal").modal('hide');
	 				$("#order_id").val('');
	 				$("#remark").val('');
	 				$("#tb").bootstrapTable('refresh');
	 			}
	 	  });
	}) */
})
</script>
<body>
<!-- 	<div class="addButton">
		<button id="button" class="btn" style="width: 75px;height: 30px;float: left;margin-top: 15px;margin-left: 15px;">增加</button>
	</div> -->
	<table id="tb"></table>
<%-- 	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 600px;">
		            <form class="form-horizontal" style="width: 500px;height: 500px;padding-top: 50px;padding-left: 50px;" id="formModel" >
		            	<div class="form-group">
						<div class="col-xs-9">
							<input type="text" name="order_id" id="order_id" style="display: none;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">产品选择:</label>
						<div class="col-xs-9">
							<select name="product_id" id="product_id">
								<c:forEach items="${productList}" var="product">
									<option value="${product.product_id}">${product.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">销售负责人:</label>
						<div class="col-xs-9">
							<select name="person_id" id="person_id">
								<c:forEach items="${personList}" var="person">
									<option value="${person.person_id}">${person.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
						<div class="form-group">
						<label class="col-xs-3 control-label">客户编号:</label>
						<div class="col-xs-9">
							<select name="client_id" id="client_id">
								<c:forEach items="${clientList}" var="client">
									<option value="${client.client_id}">${client.client_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">备注:</label>
						<div class="col-xs-9">
							<textarea rows="3" cols="40" id="remark" name="remark"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6">
							<input type="reset" value="重置" class="col-xs-12" style="background: orange;"/>     
						</div>
						<div class="col-xs-6">   
							<input type="button" id="button01" value="确认" class="col-xs-12" style="background: gold;"/>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div> --%>
</body>
</html>