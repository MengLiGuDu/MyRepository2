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
	<div class="" style="border-bottom: 0px solid black;width: 90%;margin-left: 5%;margin-top: 100px;">
			
			<button class="btn btn-primary"  style="width: 150px;background: gray;" id="examine" type="submit">审批中</button>
			<button class="btn btn-primary"  style="width: 150px;" id="untreated" type="submit">未处理记录</button>
			<button class="btn btn-primary"  style="width: 150px;" id="notAlready" type="submit">未通过记录</button>
			<button class="btn btn-primary"  style="width: 150px;" id="already" type="submit">以通过记录</button>
			<button class="btn btn-primary"  style="width: 150px;" id="draft" type="submit" >申购草稿</button>
	</div>
		<div style="margin-top: 100px;width: 90%;margin-left: 5%;height: 500px;border:0px solid green;" >
			<input type="submit" value="添加申购" class="btn btn-info"  style="width: 100px;"/>
			
			<div id="ressources" >
				<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
			</div>
		</div>
</body>
<script type="text/javascript">
$(function(){
    $('#test-table').bootstrapTable({
        method: 'post',
        contentType: "application/x-www-form-urlencoded",
        sidePagination: "server",   
        url: "<%=PN%>/subscribeList.action",
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
<script type="text/javascript">
	$("#examine").click(function(){
		css()
		$("#examine").css('background','gray')
		
		$("#ressources").load("/MaterialManagement/app/jsp/user_manage/logistics/subscribe/examine_center.jsp")
	})
	$("#untreated").click(function(){
		css()
		$("#untreated").css('background','gray')
		
		$("#ressources").load("/MaterialManagement/app/jsp/user_manage/logistics/subscribe/untreated.jsp")
	})
	$("#notAlready").click(function(){
		css()
		$("#notAlready").css('background','gray')
		
		$("#ressources").load("/MaterialManagement/app/jsp/user_manage/logistics/subscribe/not_already.jsp")
	})
	$("#already").click(function(){
		css()
		$("#already").css('background','gray')
		
		$("#ressources").load("/MaterialManagement/app/jsp/user_manage/logistics/subscribe/already.jsp")
	})
	$("#draft").click(function(){
		css()
		$("#draft").css('background','gray')
		
		$("#ressources").load("/MaterialManagement/app/jsp/user_manage/logistics/subscribe/draft.jsp")
	})
	function css() {
		
		 $("#examine").css('background','#337AB7')
		$("#untreated").css('background','#337AB7')
		$("#notAlready").css('background','#337AB7')
		$("#already").css('background','#337AB7')
		$("#draft").css('background','#337AB7')
    }
</script>
</html>