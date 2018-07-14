<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已审批记录</title>
</head>
<body>
	<div style="position: relative;top:40px;">
		<button class="btn btn-primary btn-lg" onclick="subscribeList()" style="position: relative;left: 30px;background: gray;" id="subscribeList">申购列表</button>
		<button class="btn btn-primary btn-lg" onclick="ledList()" style="position: relative;left: 45px;" id="receiveList">领用列表</button>
		<button class="btn btn-primary btn-lg" onclick="borrowList()" style="position: relative;left: 60px;" id="borrowList">借用列表</button>
		<button class="btn btn-primary btn-lg" onclick="checkList()" style="position: relative;left: 75px;" id="checkList">盘点列表</button>
	</div><br>
	<hr style="background-color: gray; height: 1px; border: none;">
	<div id="contentView" style="width: 90%;height: 500px;margin-left: 5%;">
		<div  style="float: right;">
			申购物品:<input type="text" style="width: 100px;"> <span style="margin-left: 20px;">申购状态:</span>
			<select style="width: 100px;">
				<option>全部</option>
				<option>以批准</option>
				<option>未批准</option>
			</select>
			<button class="btn btn-primary "  style="left: 20px;height: 30px;" id="select">查询</button>
		</div>
		<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
	</div>
</body>
<script type="text/javascript">
	function subscribeList(){
		 css()
		 $("#subscribeList").css('background','gray')
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/lead/yetApproval/subscribeList.jsp");
	}
	function ledList(){
		css()
		$("#receiveList").css('background','gray')
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/lead/yetApproval/ledList.jsp");
	}
	function borrowList(){
		css()
		$("#borrowList").css('background','gray')
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/lead/yetApproval/borrowList.jsp");
	}
	function checkList(){
		css()
		$("#checkList").css('background','gray')
		$("#contentView").load("/MaterialManagement/app/jsp/user_manage/lead/yetApproval/checkList.jsp");
	}
	function css() {
		
		 $("#subscribeList").css('background','#337AB7')
		$("#receiveList").css('background','#337AB7')
		$("#borrowList").css('background','#337AB7')
		$("#checkList").css('background','#337AB7')
   }
</script>
<script type="text/javascript">
$(function(){
    $('#test-table').bootstrapTable({
        method: 'post',
        contentType: "application/x-www-form-urlencoded",
        sidePagination: "server",   
        url: "<%=PN%>/examineSubscribeList.action",
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
                var e = '<a href="/" class="btn btn-default" mce_href="#" onclick="edit(\''+ row.id + '\')" data-toggle="modal" data-target="#mymode2">明细</a> ';
                var d = '<a href="/" class="btn btn-default" mce_href="#" onclick="edit(\''+ row.id + '\')" data-toggle="modal" data-target="#mymode2">审批跟踪</a> ';
                     return e+d;
            } 
         }
        ],
        
        pagination:true
        
    });
   
	
})
</script>
</body>
</html>