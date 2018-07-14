<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户管理</title>
<style type="text/css">
	#ensure{
		position:absolute;
		top:50%;
		left:50%;
		width:80px;
		height:40px;
		background:#3F7ACF;
		color:color;
	}
	#table{
		width:1300px;
		height:400px;
		position:absolute;
		top:18%;
		left:10%;
	}
	#add{
		width:80px;
		height:40px;
		position:absolute;
		top:14%;
		left:10%;
	}  
	.font{
		width: 190px;
		height: 40px;
		font-size: 30px;
		margin-top: 25px;
		margin-left: 25px;
		color: lightseagreen;
	}
</style>
</head>
<script type="text/javascript">
$(function(){
	function AddFunctionAlty(value,row,index){
		  return[
		       '<button id="TableEditor" type="button" class="btn btn-default">查看详情</button>&nbsp;&nbsp;&nbsp;&nbsp;',
		 ]
	}
	 window.operateEvents = {
		"click #TableEditor":function(e,value,row,index){
			$("#myModal").modal();
			$("#client_id").find("option[value="+row.client_id+"]").prop("selected","selected");
			$("#person_id").find("option[value="+row.person_id+"]").prop("selected","selected");
			$("#black").attr("style","display:black;");
			$("#time").val(row.time);
			$("#address").val(row.address);
			$("#remark").val(row.remark);
			$("#no").attr("style","display:none;");
			$("#yes").attr("style","display:black;");
		},
	 }
	$("#tb").bootstrapTable({
		method : 'post',
		url : '<%=PATH%>/clientManageSelect.action',
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
		      {field : 'person_id',align : 'center',title : '销售人员',
		    		 formatter:function(value,row,index){
			    		 var id = row.person_id;
			    		 var name ;
			    		 $.ajax({
			    			url :  "${path}/ClientRelation/clientManageSelectPerson.action",
							type : "post",
							async:false,
							data :{'person_id':id},
							success:function(data){
								name = data.name;
							}
			    		})  
			    		return name;
			    	}
			  }, 
		      {field : 'client_id',align : 'center',title : '客户公司名',
		    	  formatter:function(value,row,index){
		    		var id = row.client_id;
		    		var name ;
		    		$.ajax({
		    			url :  "${path}/ClientRelation/clientManageSelectClient.action",
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
			{field : 'time',align : 'center',title : '时间'},
			{field : 'address',align : 'center',title : '地点'},
			{field : 'remark',align : 'center',title : '操作',
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
		$("#formModel")[0].reset(); 
		$("#myModal").modal();
		$("#black").attr("style","display:none;");
		$("#no").attr("style","display:black;");
		$("#yes").attr("style","display:none;");
	})
	$("#present").click(function(){
   	 var post = $("#formModel").serialize();
		$.ajax({
			url : "${path}/ClientRelation/insertClientRelation.action",
			type : "post",
			data :post,
			success : function(data) {
				$("#myModal").modal('hide');
				
				$("#tb").bootstrapTable('refresh');
			}
	    });
	}) 
})
</script>
<body>
	<div class="font">客户关系管理</div>
	<hr/>
	<div class="addButton" id="add">
		<button id="button" class="glyphicon glyphicon-plus" style="width: 75px;height: 30px;float: left;margin-top: 15px;margin-left: 15px;">增加</button>
	</div>
	<div id="table">
		<table id="tb"></table>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 600px;">
		            <form class="form-horizontal" style="width: 500px;height: 500px;padding-top: 50px;padding-left: 50px;" id="formModel" >
		            	<div class="form-group">
						<div class="col-xs-9">
							<input type="text" name="order_id" id="order_id" style="display: none;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">销售人员</label>
						<div class="col-xs-9">
							<select name="person_id" id="person_id">
								<c:forEach items="${personList}" var="person">
									<option value="${person.person_id}">${person.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">客户</label>
						<div class="col-xs-9">
							<select name="client_id" id="client_id">
								<c:forEach items="${clientList}" var="client">
									<option value="${client.client_id}">${client.client_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group" style="display:none" id="black">
						<label class="col-xs-3 control-label">时间</label>
						<div class="col-xs-9">
							<input type="text" id="time" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">地点</label>
						<div class="col-xs-9">
							<input type="text" id="address" class="form-control" name="address" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">备注</label>
						<div class="col-xs-9">
							<textarea rows="5" cols="52" id="remark" name="remark" ></textarea>
						</div>
					</div>
					<div class="form-group" id="no">
						<div class="col-xs-6">
							<button type="button" class="col-sm-offset-2 btn btn-default" data-dismiss="modal">取消</button>   
						</div>
						<div class="col-xs-6">   
							<input type="submit" class="col-sm-offset-2 btn btn-primary" id="present" value="提交" >
						</div>
					</div>
					<div class="col-xs-6" id="yes" style="display:none">   
						 <button type="button" class="col-sm-offset-2 btn btn-default" data-dismiss="modal" id="ensure">确定</button> 
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>