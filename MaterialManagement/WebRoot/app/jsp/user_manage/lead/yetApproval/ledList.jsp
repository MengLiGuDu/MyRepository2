<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>领申列表</title>
	<style type="text/css">
	#box{
		width: 1714px;
		height: 876px;	
		background: gray;
		position: absolute;
		opacity:0.5;
		left: -10px;
		top:0px;
		display: none;
	}
	#content{
		width: 1200px;
		height: 490px;	
		background: white;
		position: absolute;
		left: 180px;
		top:120px;
		display: none;
		z-index: 1;
	}
	#content1{
		width: 1200px;
		height: 40px;	
		background: blue;
		text-align: right;
		padding-right: 7px;
		font-size: 20px;
		color: black;
		font-weight: bolder;
	}
	.content2{
		width:1200px;
		height:50px;
		border: 1px solid gray;
		position: absolute;
	}
	.content2_1{
		width:80px;
		height:50px;
		border: 1px solid gray;
		position: relative;
		top:0px;
		line-height: 50px;
	}
	.content2_2{
		width:1120px;
		height:50px;
		border: 1px solid gray;
		position: relative;
		top:-50px;
		left:80px;
	}
	.content3{
		width:1200px;
		height:280px;
		border: 0px solid gray;
		position: absolute;
		top:90px;
		
	}
</style>
</head>
<body>
	<div id="box"></div>
	<div id="content">
		<div id="content1">
			<a href="#" onclick="exit()" style="color: black;font-size: 32px;">x</a>
			<center><span style="position: absolute;top:3px;">借用明细表</span></center>
		</div>
		<div class="content2">
			<div class="content2_1">申请说明：</div>
			<textarea class="content2_2">申请什么</textarea>
		</div>
		<div class="content3">
		
		<table id="test-tables" class="col-xs-12" data-toolbar="#toolbars"></table>
		</div>
	</div>
	<div  style="float: right;">
		领用物品:<input type="text" style="width: 100px;"> <span style="margin-left: 20px;">领用状态:</span>
		<select style="width: 100px;">
			<option>全部</option>
			<option>以批准</option>
			<option>未批准</option>
		</select>
		<button class="btn btn-primary "  style="left: 20px;height: 30px;" id="select">查询</button>
	</div>
	<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
</body>
<script type="text/javascript">
$(function(){
    $('#test-table').bootstrapTable({
        method: 'post',
        contentType: "application/x-www-form-urlencoded",
        sidePagination: "server",   
        url: "<%=PN%>/examineReceiveList.action",
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
        	field: 'user_id',
            title: '申购人',
            align: 'center',
            
        },{
        	field: 'money_count',
            title: '申请总金额/元',
            align: 'center',
            
        },{
        	field: 'apply_time',
            title: '申购时间',
            align: 'center',
            
        },{
        	field: 'apply_explain',
            title: '备注',
            align: 'center',
            
        },{
        	field: 'apply_state',
            title: '审批状态',
            align: 'center', 
           
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
                var e = '<a href="#" class="btn btn-default" mce_href="#" onclick="know(\''+ row.id + '\')">明细</a> ';
                var d = '<a href="#" class="btn btn-default" mce_href="#" onclick="edit(\''+ row.id + '\')">审批跟踪</a> ';
                     return e+d;
            } 
         }
        ],
        
        pagination:true
        
    });
    $('#test-tables').bootstrapTable({
        method: 'post',
        contentType: "application/x-www-form-urlencoded",
        sidePagination: "server",   
        url: "<%=PN%>/examineReceiveList.action",
        queryParamsType:'', 
        toolbar: '#toolbars',    
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
        	field: 'user_id',
            title: '申购人',
            align: 'center',
            
        },{
        	field: 'money_count',
            title: '申请总金额/元',
            align: 'center',
            
        },{
        	field: 'apply_time',
            title: '申购时间',
            align: 'center',
            
        },{
        	field: 'apply_explain',
            title: '备注',
            align: 'center',
            
        },{
        	field: 'apply_state',
            title: '审批状态',
            align: 'center', 
           
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
        }
        ],
        
        pagination:true
        
    });
})
	function know(){
		$("#box").css("display","block");
		$("#content").css("display","block");
	}
	function exit(){
		$("#box").css("display","none");
		$("#content").css("display","none");
	}
</script>
</html>