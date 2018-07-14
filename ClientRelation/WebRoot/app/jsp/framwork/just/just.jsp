<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售权限控制</title>
</head>
<script type="text/javascript">
	$(function(){
		function AddFunctionAlty(value,row,index){
			  return[
			       '<button id="TableEditor" type="button" class="btn btn-default">设置职位</button>&nbsp;&nbsp;&nbsp;&nbsp;',
			       '<button id="TableDelete" type="button" class="btn btn-default">重置密码</button>'
			 ]
		}
		 window.operateEvents = {
			"click #TableEditor":function(e,value,row,index){
				$("#myModal").modal();
				$("#name").val(row.name);
				if(row.position=='0'){
					 $("#select").find("option[value=0]").prop("selected",true);
				}else{
					 $("#select").find("option[value=1]").prop("selected",true);
				}
			},
		     "click #TableDelete":function(e,value,row,index){
		    	 	var name = row.name;
				$.ajax({
					url :  "${path}/ClientRelation/justResetPassword.action",
					type : "post",
					data :{
						'name':name
					},
					success : function(data) {
						//重新加载记录  
						//重新加载数据  
						$("#tb").bootstrapTable('refresh');
					}
				})
			}
		 }
		$("#tb").bootstrapTable({
			method : 'post',
			url : '<%=PATH%>/justSelect.action',
			dataType : "json",
			striped : true,
			pagination : true,
			pageSize : 5,
			pageNumber : 1,
			height:400,
			pageList : [ 3, 5, 10 ],
			idField : "client_id",
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
			      {field : 'name',align : 'center',title : '姓名'},
			      {field : 'age',align : 'center',title : '年龄'},
				{field : 'sex',align : 'center',title : '性别',
			    	  formatter: function(value,row,index){
					  var sesx = '';
					  if(row.sex == "0"){
						  sesx="男";
					  }else{
						  sesx="女";	
					  }
			    		  return sesx;
					}
			    	}, 
				{field : 'position',align : 'center',title : '职位',
			    		formatter: function(value,row,index){
						  var posi = '';
						  if(row.position == "0"){
							  posi="经理";
						  }else{
							  posi="员工";	
						  }
			    		 	 return posi;
					}
				},
				{field : 'phone',align : 'center',title : '联系电话'},
				{field : 'id_card',align : 'center',title : '身份证号'},
				{field : 'mailbox',align : 'center',title : '邮箱'},
				{field : 'address',align : 'center',title : '地址'},
				{field : 'create_time',align : 'center',title : '创建时间'},
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
		 
		 $("#button01").click(function(){
		    	 var post = $("#formModel").serialize();
		 		$.ajax({
		 			url : "${path}/ClientRelation/justModify.action",
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
	<table id="tb"></table>		
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 350px;">
				<div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel1">设置职位</h4>
		            </div>
		            <form class="form-horizontal" style="width: 300px;height: 200px;padding-top: 50px;padding-left: 50px;" id="formModel" >
					<div class="form-group">
						<input type="text" id="name" name="name" style="display:none;">
						<label class="col-xs-4 control-label" id="titles">职位:</label>
						<div class="col-xs-8">
							<select name="position" id="select">
								<option value="0">经理</option>
								<option value="1">员工</option>
							</select>
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