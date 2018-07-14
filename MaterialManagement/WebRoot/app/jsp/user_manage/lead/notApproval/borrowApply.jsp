<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>借用申请</title>
	<link rel="stylesheet" href="<%=PN%>/app/jsp/user_manage/lead/notApproval/notApproval.css">
</head>
<body>
	<div id="box"></div>
	<div id="content">
		<div id="content1">
			<a href="#" onclick="exit1()" style="color: black;font-size: 32px;">x</a>
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
	<div id="read">
		<div id="read1">
			<a href="#" onclick="exit2()" style="color: black;font-size: 32px;">x</a>
			<center><span style="position: absolute;top:3px;">批准</span></center>
		</div>
		<div class="read2">
			<div class="read2_1">申请意见：</div>
		</div>
		<div class="read3">
			<textarea rows="" cols="" class="read3_1"></textarea>
		</div>
		<div class="read4">
			<button style="width: 100px;height: 40px;">确定</button>
		</div>
	</div>
	<div id="no">
		<div id="no1">
			<a href="#" onclick="exit3()" style="color: black;font-size: 32px;">x</a>
			<center><span style="position: absolute;top:3px;">拒绝</span></center>
		</div>
		<div class="no2">
			<div class="no2_1">申请意见：</div>
		</div>
		<div class="no3">
			<textarea rows="" cols="" class="read3_1"></textarea>
		</div>
		<div class="no4">
			<button style="width: 100px;height: 40px;">确定</button>
		</div>
	</div>
	<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
</body>
<script type="text/javascript">
$(function(){
    $('#test-table').bootstrapTable({
        method: 'post',
        contentType: "application/x-www-form-urlencoded",
        sidePagination: "server",   
        url: "<%=PN%>/notExamineBorrowList.action",
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
            	 var e = '<a href="#" class="btn btn-default" onclick="know(\''+ row.id + '\')">明细</a> ';
                 var d = '<a href="#" class="btn btn-default" onclick="read(\''+ row.id + '\')">批准</a> ';
                 var f = '<a href="#" class="btn btn-default" onclick="no(\''+ row.id + '\')">不批准</a> ';
                 var g = '<a href="#" class="btn btn-default" onclick="edit(\''+ row.id + '\')">审批跟踪</a> ';
                      return e+d+f+g;
            } 
         }
        ],
        
        pagination:true
        
    });
    $('#test-tables').bootstrapTable({
        method: 'post',
        contentType: "application/x-www-form-urlencoded",
        sidePagination: "server",   
        url: "<%=PN%>/notExamineBorrowList.action",
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
	function exit1(){
		$("#box").css("display","none");
		$("#content").css("display","none");
	}
	function read(){
		$("#box").css("display","block");
		$("#read").css("display","block");
	}
	function exit2(){
		$("#box").css("display","none");
		$("#read").css("display","none");
	}
	function no(){
		$("#box").css("display","block");
		$("#no").css("display","block");
	}
	function exit3(){
		$("#box").css("display","none");
		$("#no").css("display","none");
	}
</script>
</html>