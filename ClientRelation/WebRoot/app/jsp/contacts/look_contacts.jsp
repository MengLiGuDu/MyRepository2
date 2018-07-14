<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看联系人</title>
</head>
<script type="text/javascript">
$(function(){
	function AddFunctionAlty(value,row,index){
		  return[
		       '<button id="TableEditor" type="button" class="btn btn-default">查看详情</button>'
		 ]
	}
	 window.operateEvents = {
		"click #TableEditor":function(e,value,row,index){
			var id = row.client_id;
	    		var name ;
	    		$.ajax({
	    			url :  "${path}/ClientRelation/lookContactsGetName.action",
					type : "post",
					async:false,
					data :{'client_id':id},
					success:function(data){
						name = data.name;
						
					}
	    		})  
			$("#myModal").modal();
			$("#contacts_id").val(name);
			$("#name").val(row.name);
			$("#age").val(row.age);
			if(row.sex == "0"){
				$("#sex").val("男");
			}else{
				$("#sex").val("女");
			}
			$("#position").val(row.position);
			$("#phone").val(row.phone);
			$("#telephone").val(row.telephone);
		}
	 }
	$("#tb").bootstrapTable({
		method : 'post',
		url : '<%=PATH%>/lookContactsSelect.action',
		dataType : "json",
		striped : true,
		pagination : true,
		pageSize : 5,
		pageNumber : 1,
		height:400,
		pageList : [ 3, 5, 10 ],
		idField : "contacts_id",
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
			{field : 'contacts_id',align : 'center',title : '公司名称',
				formatter:function(value,row,index){
					var id = row.client_id;
			    		var name ;
			    		$.ajax({
			    			url :  "${path}/ClientRelation/lookContactsGetName.action",
							type : "post",
							async:false,
							data :{'client_id':id},
							success:function(data){
								name = data.name;
								
							}
			    		})  
			    		return name;
				}	
			},
		      {field : 'name',align : 'center',title : '联系人姓名'},
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
})
</script>
<body>
	<table id="tb"></table>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 600px;">
		            <form class="form-horizontal" style="width: 500px;height: 500px;padding-top: 50px;padding-left: 50px;" id="formModel" >
					<div class="form-group">
						<label class="col-xs-3 control-label">公司名:</label>
						<div class="col-xs-9">
							<input type="text" id="contacts_id" class="form-control" name="contacts_id" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">联系人姓名:</label>
						<div class="col-xs-9">
							<input type="text" id="name" class="form-control" name="name" />
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
							<input type="text" id="sex" class="form-control" name="sex" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">职位:</label>
						<div class="col-xs-9">
							<input type="text" id="position" class="form-control" name="position" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">手机:</label>
						<div class="col-xs-9">
							<input type="text" id="phone" class="form-control" name="phone" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">办公电话:</label>
						<div class="col-xs-9">
							<input type="text" id="telephone" class="form-control" name="telephone" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-3">   
							<input type="button"  id="button01" value="确认" class="col-xs-12" style="background: gold;margin-left: 200px;" data-dismiss="modal"/>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>