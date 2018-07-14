<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>借用申请记录</title>
</head>
<body>
<div class="container-fluid"><!-- -fluid -->
		  <div class="row">
		    <div style="float: right;">
		    <label>审批状态：</label>
		      <select id="approval_state" name="approval_state">
		      	<option value="0">全部</option>
		      	<option value="1">未处理</option>
		      	<option value="2">处理中</option>
		      </select>
		      <button class="btn btn-primary btn-lg" id="query">查询</button>
		    </div>
		    <table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
		  </div>
	</div>
	
	
	
		<div class="modal fade col-sm-12" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">明细</h4>
		            </div>
		            
		            <div class="modal-body">
		            	 <form id="postForm1" class="form-horizontal" role="form" enctype="multipart/form-data" method="post">
						    <div class="form-group">
						        <label for="apply_explain" class="col-sm-2 control-label">申请说明</label>
						        <div class="col-sm-8">
                        			 <textarea id="apply_explain1" class="col-sm-8" disabled="disabled"></textarea>
						        </div>
						    </div>
						    <div class="form-group">
						        <label for="goods_name" class="col-sm-2 control-label">物品名称</label>
						        <div class="col-sm-8">
						           <input type="text" id="goods_name1" disabled="disabled">
						        </div>
						    </div>
						    <div class="form-group">
						        <label for="type_id" class="col-sm-2 control-label">物品类型</label>
						        <div class="col-sm-8">
						            <input type="text" id="type_id1" disabled="disabled">
						        </div>
						    </div>
						    
						    <div class="form-group">
						        <label for="goods_spec" class="col-sm-2 control-label">规格</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="goods_spec2"  disabled="disabled">
						        </div>
						    </div>
						    
						    <div class="form-group">
						        <label for="goods_price" class="col-sm-2 control-label">单价</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="goods_price2" disabled="disabled">
						        </div>
						    </div>
						    
						    <div class="form-group">
						        <label for="count" class="col-sm-2 control-label">数量</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="count1" disabled="disabled">
						        </div>
						    </div>
						    <div class="form-group">
						        <label for="money_count" class="col-sm-2 control-label">总金额</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="money_count1" disabled="disabled">
						        </div>
						    </div>
						    <div class="form-group">
						        <label for="borrow_remark" class="col-sm-2 control-label">备注</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="borrow_remark1" disabled="disabled">
						        </div>
						    </div>
						  
						</form>
		            
		            </div>
		        </div>
		    </div>
		</div>
	
	
	
	
</body>
	<script type="text/javascript">
	$(function(){
        $('#test-table').bootstrapTable({
            method: 'post',
            contentType: "application/x-www-form-urlencoded",
            sidePagination: "server",   
            url: "<%=PN%>/borrowRecordList.action",
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
                field: 'user_name',
                title: '借用人',
                align: 'center'
            },{
                field: 'money_count',
                title: '借用金额/元',
                align: 'center'
            },{
                field: 'apply_time',
                title: '借用时间',
                align: 'center'
            },{
                field: 'apply_explain',
                title: '借用说明',
                align: 'center'
            },{
            	field: 'apply_state',
                title: '状态',
                align: 'center',
                formatter:function(value,row,index){
                	var e ;
                	if(row.apply_state == '0'){
                		e = '<span  style="color: red;">未批准</span>';
                	} else if(row.apply_state == '1'){
                		e = '<span  style="color: green;">已批准</span>';
                	}
                	return e;
                }
            	
            },{
                title: '操作',
                field: 'apply_id',
                align: 'center',
                formatter:function(value,row,index){
       	
                    var e = '<button class="btn btn-default" onclick="detail(\''+ row.apply_id +'\')" data-toggle="modal" data-target="#myModal">明细</button> ';
                    var d = '<button class="btn btn-default" onclick="approveParticulars(\''+ row.apply_id +'\')">审批详情</button> ';
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
	
	
	function detail(id){
		$.post("<%=PN%>/detailBorrow.action",{apply_id:id}, function(data){
			
			console.log(data)
			
			$("#apply_explain1").text(data[0].apply_explain)
			$("#goods_name1").val(data[0].goods_name)
			$("#type_id1").val(data[0].type_name)
			$("#goods_spec2").val(data[0].goods_spec)
			$("#goods_price2").val(data[0].goods_price)
			$("#count1").val(data[0].count)
			$("#borrow_remark1").val(data[0].goods_remark)
			$("#money_count1").val(data[0].money_count)
			
		},'json');
	}
	
	function approveParticulars(id){
		
	}
	
		
	function common(){
		$('#test-table').bootstrapTable('refresh', {
            url: '<%=PN%>/borrowRecordList.action'
        });
	}
	</script>
</html>
</html>