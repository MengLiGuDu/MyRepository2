<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>测试连接</title>
	</head>
	<body>
	<div data-toolbar="#toolbar" style="float: left">
			
			<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="add">添加</button>
			
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="myModalLabel">用户增加</h4>
			            </div>
			            <form id="postForm" class="form-horizontal" role="form" enctype="multipart/form-data" method="post">
			            
						    <div class="form-group" style="display:none; ">
						        <label for="user_id1" class="col-sm-2 control-label">领导ID</label>
						        <div class="col-sm-8">
						        	<input type="text" id="operate" name="operate">
						            <input type="text" class="form-control" id="lead_id"  name="lead_id">
						        </div>
						    </div>
						    <div class="form-group">
						        <label for="login_id" class="col-sm-2 control-label">审批类型</label>
						        <div class="col-sm-8">
						            <select id="approval_type" name="approval_type">
						            	<option value="0">申购</option>
						            	<option value="1">申领</option>
						            	<option value="2">申借</option>
						            	<option value="3">盘点</option>
						            </select>
						        </div>
						    </div>
						</form>
						
						<div class="modal-footer">
							<div class="form-group">
						        <button type="button" class="col-sm-offset-3 btn btn-primary"  id="submit" data-dismiss="modal">提交</button>
				                <button type="button" class="col-sm-offset-3 btn btn-default" data-dismiss="modal">取消</button>
						    </div>
						</div>
						
			        </div>
			    </div>
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
            url: "<%=PN%>/list.action",
            queryParamsType:'', 
            search:true, 
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
            showColumns: true,     
            showRefresh: true,     
            clickToSelect: true,    
            searchOnEnterKey: true,
            paginationLoop: false,  
            trimOnSearch:true,   
            showToggle: true,		
            idField:'lead_id',  
            paginationPreText:'上一页',	
            paginationNextText:'下一页',	
            selectItemName:'btSelectItem',
           
           showExport: true,                    
   		   exportDataType: 'all',
            columns: [
            {
                field: 'lead_id',
                title: 'id',
                align: 'center'
            },{
            	field: 'approval_type',
                title: '审批类型',
                align: 'center',
                formatter:function(value,row,index){
                	var e ;
                	if(row.approval_type == '0'){
                		e = '申购';
                	} else if(row.approval_type == '1'){
                		e = '申领';
                	} else  if(row.approval_type == '2'){
                		e = '申借';
                	} else {
                		e = '盘点';
                	}
                	return e;
                }
            	
            },{
                title: '操作',
                field: 'lead_id',
                align: 'center',
                formatter:function(value,row,index){
       	
                    var e = '<button class="btn btn-default" onclick="fillMod(\''+ row.lead_id +'\')" data-toggle="modal" data-target="#myModal">修改</button> ';
                    var d = '<button class="btn btn-default" onclick="del(\''+ row.lead_id +'\')">删除</button> ';
                    return e+d;
                    
                }
              }
            ],
            
            pagination:true
            
        });
       
		
	})

	function toPage() {
         var pageNum = $("#pageNum").val();
         if (pageNum) {
             $('#test-table').bootstrapTable('selectPage', parseInt(pageNum));
         }
    }

	$("#add").click(function (){
		$("#operate").val("add");
		$("#myModalLabel").text("添加");
		$("#lead_id").val("");
	})

	$("#submit").click(function(){
			
			$.ajax({
			    url: '/MaterialManagement/operateApp.action',
			    type: 'POST',
			    cache: false,
			    data: new FormData($('#postForm')[0]),
			    processData: false,
			    contentType: false
			}).done(function(res) {
				alert("操作成功");
				common();
			}).fail(function(res) {
				alert("操作失败");
			}); 
			
	})
	
	
	function fillMod(id){
			
			$.post("/MaterialManagement/fillModApp.action", {lead_id:id}, function(data){
				$("#operate").val("mod")
				$("#myModalLabel").text("修改")
				$("#lead_id").val(data[0].lead_id);
			},'json');
		}
	
	function del(id){
		var truthBeTold = window.confirm("您确定要删除吗？单击[确定]继续。单击[取消]停止");
		if(truthBeTold){
			$.post("/MaterialManagement/delApprovallim.action", {lead_id:id}, function(data){
				common();
			},'json');
		}
		
	}
	
	
	function common(){
		$('#test-table').bootstrapTable('refresh', {
            url: '/MaterialManagement/list.action'
        });
	}
	</script>
</html>