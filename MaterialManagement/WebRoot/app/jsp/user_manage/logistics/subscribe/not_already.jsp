<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申购管理</title>

</head>
<body>
	<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
</body>
<script type="text/javascript">
$(function(){
	
		document.getElementById("test-table").length=0;
		 $('#test-table').bootstrapTable({
		        method: 'post',
		        contentType: "application/x-www-form-urlencoded",
		        sidePagination: "server",   
		        url: "<%=PN%>/notNotAlready.action",
		        queryParamsType:'', 
		        toolbar: '#toolbar',    
		        striped: true,      
		        cache: false,     
		        sortable: false,      
		        pagination: true,    
		        sortOrder: "asc",     
		        pageNumber:1,      
		        pageSize: 5,      
		        pageList: [5, 10, 50, 100],  
		        strictSearch: true,     
		        clickToSelect: true,    
		        searchOnEnterKey: true,
		        paginationLoop: false,  
		        trimOnSearch:true,   	
		        idField:'apply_id',  
		        paginationPreText:'上一页',	
		        paginationNextText:'下一页',	
		        selectItemName:'btSelectItem',
		       
		       showExport: true,                    
				   exportDataType: 'all',
		        columns: [
		        {
		            field: 'apply_type',
		            title: '申请类型',
		            align: 'center',
		            	 formatter:function(value,row,index){
		                 	var e ;
		                 	if(row.apply_type == '0'){
		                 		e = '申购';
		                 	} else if(row.apply_type == '1'){
		                 		e = '申领';
		                 	} else  if(row.apply_type == '2'){
		                 		e = '申借';
		                 	} else {
		                 		e = '盘点';
		                 	}
		                 	return e;
		                 }
		        },{
		        	field: 'money_count',
		            title: '申请总金额/元',
		            align: 'center',
		            
		        },{
		            field: 'apply_explain',
		            title: '申请说明',
		            align: 'center',
		            
		         },{
		        	field: 'apply_time',
		            title: '申请时间',
		            align: 'center',
		            
		         },{
		        	field: 'apply_state',
		            title: '审批状态',
		            align: 'center', 
		            color:'red',
		            formatter:function(value,row,index){
		             	var e ;
		             	if(row.apply_state == '0'){
		             		e = '未审批';
		             	} else if(row.apply_state == '1'){
		             		e = '以通过';
		             	} else  if(row.apply_state == '2'){
		             		e = '未通过';
		             	} else if(row.apply_state == '3'){
		             		e = '未处理';
		             	}else{
		             		e = '审批中';
		             	}
		             	return e;
		             }
		         },{
		        	field: 'apply_id',
		            title: '操作',
		            align: 'center',
		            formatter:function(value,row,index){  
		                var e = '<a href="/" class="btn btn-default" mce_href="#" onclick="edit(\''+ row.id + '\')" data-toggle="modal" data-target="#mymode2">明细</a> ';
		                var d = '<a href="/" class="btn btn-default" mce_href="#" onclick="edit(\''+ row.id + '\')" data-toggle="modal" data-target="#mymode2">审批跟踪</a> ';
		                var f = '<a href="/" class="btn btn-default" mce_href="#" onclick="edit(\''+ row.id + '\')" data-toggle="modal" data-target="#mymode2">撤回</a> ';
		                     return e+d+f;
		            } 
		         }
		        ],
		        
		        pagination:true
		        
		    });
		
   
   
	
})
</script>
</html>