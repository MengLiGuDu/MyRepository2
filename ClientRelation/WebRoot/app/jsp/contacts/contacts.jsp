<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>联系人</title>
</head>
<script type="text/javascript">
$(function(){
	function AddFunctionAlty(value,row,index){
		  return[
		       '<button id="TableEditor" type="button" class="btn btn-default">修 改</button>&nbsp;&nbsp;&nbsp;&nbsp;',
		       '<button id="TableDelete" type="button" class="btn btn-default">删 除</button>'
		 ]
	}
	 window.operateEvents = {
		"click #TableEditor":function(e,value,row,index){
			$("#myModal").modal();
			$("#contacts_id").val(row.contacts_id);
			$("#client_id").find("option[value="+row.client_id+"]").prop("selected","selected");
			$("#age").val(row.age);
			$("input:radio[name=sex][value="+row.sex+"]").prop("checked",true);
			$("#position").val(row.position);
			$("#telephone").val(row.telephone);
		},
	     "click #TableDelete":function(e,value,row,index){
	    	 	var id = row.contacts_id;
			$.ajax({
				url :  "${path}/ClientRelation/contactsDelete.action",
				type : "post",
				data :{
					'contacts_id':id
				},
				success : function(data) {
					$("#tb").bootstrapTable('refresh');
				}
			})
		}
	 }
	$("#tb").bootstrapTable({
		method : 'post',
		url : '<%=PATH%>/contactsSelect.action',
		dataType : "json",
		striped : true,
		pagination : true,
		pageSize : 5,
		pageNumber : 1,
		height:400,
		pageList : [ 3, 5, 10 ],
		idField : "chance_id",
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
			{field : 'contacts_id',align : 'center',title : '编号'},
		      {field : 'name',align : 'center',title : '姓名'},
		      {field : 'age',align : 'center',title : '年龄'},
			{field : 'sex',align : 'center',title : '性别',
		    		formatter:function(value,row,index){
		    			if(row.sex == "0"){
		    				return "男";
		    			}else{
		    				return "女";
		    			}
		    		}  
			}, 
			{field : 'position',align : 'center',title : '职位'},
			{field : 'phone',align : 'center',title : '手机号'},
			{field : 'telephone',align : 'center',title : '办公电话'},
			{field : 'operate',align : 'center',title : '操作',
			      events:operateEvents,
				formatter:AddFunctionAlty
			}
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
	
	$("#button").click(function(){
		$("#myModal").modal();
	})
	
	 $("#button01").click(function(){
	    	 var post = $("#formModel").serialize();
	 		$.ajax({
	 			url : "${path}/ClientRelation/contactsModify.action",
	 			type : "post",
	 			data :post,
	 			success : function(data) {
	 				$("#myModal").modal('hide');
	 				$("#contacts_id").val('');
	 				$("#age").val('');
	 				$("#position").val('');
	 				$("#telephone").val('');
	 				$("#tb").bootstrapTable('refresh');
	 				
	 			}
	 	  });
	})
})

</script>
<body>
	<div class="addButton">
		<button id="button" class="btn" style="width: 75px;height: 30px;float: left;margin-top: 15px;margin-left: 15px;">增加</button>
	</div>
	<table id="tb"></table>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 600px;">
		            <form class="form-horizontal" style="width: 500px;height: 500px;padding-top: 50px;padding-left: 50px;" id="formModel" >
		            	<div class="form-group">
						<div class="col-xs-9">
							<input type="text" name="contacts_id" id="contacts_id" style="display: none;">
							<label class="col-xs-3 control-label">姓名:</label>
							<div class="col-xs-9">
								<select name="client_id">
									<c:forEach items="${clientList}" var="client"> 
										<option value="${client.client_id}">${client.client_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">年龄:</label>
						<div class="col-xs-9">
							<input type="text" id="age" class="form-control" name="age" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">性别:</label>
						<div class="col-xs-9">
							<input type="radio" name="sex" value="0" checked="checked"/>男
							<input type="radio" name="sex" value="1" />女
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">职位:</label>
						<div class="col-xs-9">
							<input type="text" id="position" class="form-control" name="position" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">办公号码:</label>
						<div class="col-xs-9">
							<input type="text" id="telephone" class="form-control" name="telephone" />
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
	</div>
</body>
</html>