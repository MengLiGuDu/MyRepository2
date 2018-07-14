<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>连接测试</title>
<style>
	#addPost{
		margin-top:10px;
	}
</style>
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
			$("#cid").val(row.client_id);
			$("#cname").val(row.client_name);
		},
	     "click #TableDelete":function(e,value,row,index){
	    	 	var id = row.client_id;
			$.ajax({
				url :  "${path}/ClientRelation/demoDelete.action",
				type : "post",
				data :{
					'client_id':id
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
		url : '<%=PATH%>/demo.action',
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
		      {field : 'client_id',align : 'center',title : '客户id'},
		      {field : 'client_name',align : 'center',title : '公司名'},
			{field : 'address',align : 'center',title : '公司地址'}, 
			{field : 'grade',align : 'center',title : '客户等级'},
			{field : 'phone',align : 'center',title : '电话'},
			{field : 'postcode',align : 'center',title : '邮编'},
			{field : 'operate',align : 'center',title : '操作',
				 events:operateEvents,
				formatter:AddFunctionAlty 
			}
		] ]
	})
	
	$("#addButton").click(function(){
		$("#myModal").modal();
	})
		
	
	$("#button01").click(function(){
	     if ($("#formModel").data('bootstrapValidator').isValid()) {//获取验证结果，如果成功，执行下面代码  
	    	 var post = $("#formModel").serialize();
	 		$.ajax({
	 			url : "${path}/ClientRelation/demoQuery.action",
	 			type : "post",
	 			data :post,
	 			success : function(data) {
	 				alert(data.message);
	 				$("#cid").val('');
	 				$("#cname").val('');
	 				$("#myModal").modal('hide');
	 				$("#tb").bootstrapTable('refresh');
	 			}
	 		});
           } else{
        	   alert("输入错误");//验证成功后的操作，如ajax  
           } 
	})
	
	function queryParams(params) { //bootstrapTable自带参数  
		var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
			pageSize : params.pageSize, //页面大小  
			pageNumber : params.pageNumber,
			name : params.searchText
		};
		return temp;
	}
  $("#formModel").bootstrapValidator({  
        live: 'enabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证  
        excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的  
        submitButtons: '#btn-test',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面  
        message: '通用的验证失败消息',//好像从来没出现过  
        feedbackIcons: {//根据验证结果显示的各种图标  
            valid: 'glyphicon glyphicon-ok',  
            invalid: 'glyphicon glyphicon-remove',  
            validating: 'glyphicon glyphicon-refresh'  
        },  
        fields: {  
        	client_name: {  
                validators: {  
                    notEmpty: {//检测非空,radio也可用  
                        message: '文本框必须输入'  
                    },  
                    stringLength: {//检测长度  
                        min: 2,  
                        max: 6,  
                        message: '长度必须在2-6之间'  
                    },  
                }  
            }  
        }  
    });  
})

</script>
<body>
	<div id="add">
		<button id="addButton" class="btn">添加</button>
	</div>
	<table id="tb"></table>
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<form class="form-horizontal" style="width: 400px;height: 300px;padding-top: 100px;padding-left: 140px;" id="formModel" >
					<div class="form-group">
						<input type="text" id="cid" name="client_id" style="display:none;">
						<label class="col-xs-4 control-label" id="titles">公司名称:</label>
						<div class="col-xs-8">
							<input type="text" id="cname" class="form-control" name="client_name"/>
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