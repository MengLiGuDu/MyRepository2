<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>领用申请</title>
</head>
<body>
	<div class="container-fluid"><!-- -fluid -->
		  <div class="row">
		    <div style="float: left">
		      <button class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal" id="add">添加领用</button>
		    </div>
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
		                <h4 class="modal-title" id="myModalLabel">领用</h4>
		            </div>
		            
		            <div class="modal-body">
		            	 <form id="postForm" class="form-horizontal" role="form" enctype="multipart/form-data" method="post">
						    <div class="form-group">
						        <label for="apply_explain" class="col-sm-2 control-label">申请说明</label>
						        <div class="col-sm-8">
                        			 <textarea placeholder="这里面说明申请这批物资的原因" id="apply_explain" name="apply_explain" class="col-sm-8" ></textarea>
						        </div>
						    </div>
						    <div class="form-group">
						        <label for="goods_name" class="col-sm-2 control-label">物品名称</label>
						        <div class="col-sm-8">
						           <select id="goods_name" name="goods_name"></select>
						        </div>
						    </div>
						    <div class="form-group">
						        <label for="type_id" class="col-sm-2 control-label">物品类型</label>
						        <div class="col-sm-8">
						            <select id="type_id" name="type_id"></select>
						        </div>
						    </div>
						    
						    <div class="form-group">
						        <label for="goods_spec" class="col-sm-2 control-label">规格</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="goods_spec"  disabled="disabled">
						            <input type="text" class="form-control" id="goods_spec1" name="goods_spec" style="display: none;">
						        </div>
						    </div>
						    
						    <div class="form-group">
						        <label for="goods_price" class="col-sm-2 control-label">单价</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="goods_price" disabled="disabled">
						            <input type="text" class="form-control" id="goods_price1" name="goods_price" style="display: none;">
						        </div>
						    </div>
						    
						    <div class="form-group">
						        <label for="count" class="col-sm-2 control-label">数量</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="count" name="count">
						        </div>
						    </div>
						    <div class="form-group" style="display: none;">
						        <label for="type" class="col-sm-2 control-label">类型id</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="type" name="type">
						        </div>
						    </div>
						    <div class="form-group" style="display: none;">
						        <label for="goods_id" class="col-sm-2 control-label">物品id</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="goods_id" name="goods_id">
						        </div>
						    </div>
						    <div class="form-group">
						        <label for="borrow_remark" class="col-sm-2 control-label">备注</label>
						        <div class="col-sm-8">
						            <input type="text" class="form-control" id="borrow_remark" name="receive_remark">
						        </div>
						    </div>
						  
						</form>
		            
		            </div>
		            
					<div class="modal-footer">
						<div class="form-group">
					        <button type="button" class="col-sm-offset-3 btn btn-primary"  id="submit" data-dismiss="modal">提交</button>
			                <button type="button" class="col-sm-offset-3 btn btn-success" id="draft" data-dismiss="modal">草稿</button>
					    </div>
					</div>
		        </div>
		    </div>
		</div>
		
		
		<div class="modal fade col-sm-12" id="myMod" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
		var approval_state = $("#approval_state").val();
        $('#test-table').bootstrapTable({
            method: 'post',
            contentType: "application/x-www-form-urlencoded",
            sidePagination: "server",   
            url: "<%=PN%>/receiveList.action",
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
		   queryParams:function queryParams(params){
				var param = {
						pageNumber: params.pageNumber,
						pageSize: params.pageSize,
						searchText:approval_state
				};
				return param;
			}, 
            columns: [
            {
                field: 'user_name',
                title: '领用人',
                align: 'center'
            },{
                field: 'apply_time',
                title: '申请时间',
                align: 'center'
            },{
                field: 'apply_explain',
                title: '备注',
                align: 'center'
            },{
                field: 'money_count',
                title: '借用金额/元',
                align: 'center'
            },{
            	field: 'apply_state',
                title: '状态',
                align: 'center',
                formatter:function(value,row,index){
                	var e ;
                	if(row.apply_state == '0'){
                		e = '未审批';
                	} else if(row.apply_state == '1'){
                		e = '同意';
                	} else if(row.apply_state == '2'){
                		e = '否决';
                	}else{
                		e = '已处理';
                	}
                	return e;
                }
            	
            },{
                title: '操作',
                field: 'apply_id',
                align: 'center',
                formatter:function(value,row,index){
       	
                    var e = '<button class="btn btn-default" onclick="detail(\''+ row.apply_id +'\')" data-toggle="modal" data-target="#myMod">明细</button> ';
                    var d = '<button class="btn btn-default" onclick="approveTrace(\''+ row.apply_id +'\')">审批追踪</button> ';
                    var g = '<button class="btn btn-default" onclick="withdraw(\''+ row.apply_id +'\')">撤回</button> ';
                    return e+d+g;
                    
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
	
	function approveTrace(id){
		
	}
	
	function withdraw(id){
		var truthBeTold = window.confirm("您确定要撤回吗？单击[确定]继续。单击[取消]停止");
		if(truthBeTold){
			$.post("<%=PN%>/withdrawApply.action", {apply_id:id}, function(data){
				common();
			},'json');
		}
	}
	
	
	function common(){
		$('#test-table').bootstrapTable('refresh', {
            url: '<%=PN%>/receiveList.action'
        });
	}
	
	$("#add").click(function(){
		$.post("<%=PN%>/typeList.action", function(data){
			var temp = '';
			$("#goods_name").html("");
			for (var i = 0; i < data.length; i++) {
				if(i == 0){
					temp += '<option value='+data[i].goods_id+' selected>'+data[i].goods_name+'</option>';
					$("#type").val(data[0].type_id)
				} else {
					temp += '<option value='+data[i].goods_id+'>'+data[i].goods_name+'</option>';
				}
			}
			$("#goods_name").append(temp);
			$("#goods_price").val(data[0].goods_price)
			$("#goods_price1").val(data[0].goods_price)
			$("#goods_spec").val(data[0].goods_spec)
			$("#goods_spec1").val(data[0].goods_spec)
			$("#goods_id").val(data[0].goods_id)
			
		},'json');
		
		filltype();
	})
	
	$('#goods_name').blur(function(){
		var goods_id = $('#goods_name').val();
		$.post("<%=PN%>/fillStorage.action",{goods_id:goods_id}, function(data){
			$("#type").val(data[0].type_id)
			$("#goods_price").val(data[0].goods_price)
			$("#goods_price1").val(data[0].goods_price)
			$("#goods_spec").val(data[0].goods_spec)
			$("#goods_spec1").val(data[0].goods_spec)
			$("#goods_id").val(data[0].goods_id)
		},'json');
		filltype();
	})
	
	function filltype(){
		$.post("<%=PN%>/typeCheck.action", function(data){
			var temp = '';
			$("#type_id").html("");
			var ty = $("#type").val();
			for (var i = 0; i < data.length; i++) {
				if(ty == data[i].type_id){
					temp += '<option value='+data[i].type_id+' selected>'+data[i].type_name+'</option>';
				} else {
					temp += '<option value='+data[i].type_id+'>'+data[i].type_name+'</option>';
				}
			}
			$("#type_id").append(temp);
		},'json');
	}
	
	$("#submit").click(function(){
		
		$.ajax({
		    url: '<%=PN%>/addApply1.action',
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
	
	$("#draft").click(function(){
		
		$.ajax({
		    url: '<%=PN%>/addDraftApply1.action',
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
	
	<%-- $("#query").click(function(){
		$.post("<%=PN%>/borrowList.action",{searchText:approval_state}, function(data){
			
		},'json');
	}) --%>
	
	function loginAdmin(){
		    
	    //开启验证
	     $('#postForm').data('bootstrapValidator').validate();  
	      if(!$('#postForm').data('bootstrapValidator').isValid()){  
	      	return ;  
	      } 
		      
		}
		$(document).ready(function() {
			loginValidator();
		});
	
	function loginValidator(){
		    
			$('#postForm').bootstrapValidator({
		         message: 'This value is not valid',
		         feedbackIcons: {
			         valid: 'glyphicon glyphicon-ok',
			         invalid: 'glyphicon glyphicon-remove',
			         validating: 'glyphicon glyphicon-refresh'
		         },
		         fields: {
		             storage_count: {
		                 message: '数量验证失败',
		                 validators: {
		                     notEmpty: {
		                         message: '数量不能为空'
		                     }, 
	                        regexp: {
	                            regexp: /^[0-9]+$/,
	                            message: '只能是数字'
	                        },
		                     stringLength: {
		                         min: 1,
		                         max: 5,
		                         message: '长度在1到5之间'
		                     }
		                 }
		             },
		             apply_explain: {
		                 message: '说明验证失败',
		                 validators: {
		                     notEmpty: {
		                         message: '说明不能为空'
		                     }
		                 }
		             },
		             return_time: {
		                 message: '归还时间验证失败',
		                 validators: {
		                     notEmpty: {
		                         message: '归还时间不能为空'
		                     }
		                 }
		             }
		         }
		     });
		 }
		
	
	</script>
</html>