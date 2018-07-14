<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>物资类型管理</title>
	</head>
	<body>
		<div data-toolbar="#toolbar" style="float: left">
			
			<button class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">添加</button>
			
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="myModalLabel">类型增加</h4>
			            </div>
			            <div class="modal-body">
			            	<form id="postForm" class="form-horizontal" role="form" enctype="multipart/form-data" method="post">
	            
							    <div class="form-group">
							        <label for="type_name" class="col-sm-2 control-label">类型名</label>
							        <div class="col-sm-8">
							            <input type="text" class="form-control" id="type_name"  name="type_name">
							        </div>
							    </div>
							    <div class="form-group">
							        <label for="type_describe" class="col-sm-2 control-label">类型描述</label>
							        <div class="col-sm-8">
							            <input type="text" class="form-control" id="type_describe"  name="type_describe">
							        </div>
							    </div>
							    
							</form>
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="col-sm-offset-3 btn btn-primary"  id="submit" data-dismiss="modal">提交</button>
				            <button type="button" class="col-sm-offset-3 btn btn-default" data-dismiss="modal">取消</button>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal -->
			</div>
			
		</div>
		<div class="container-fluid"><!-- -fluid -->
		  <div class="row">
		    <div class="col-sm-12" style="height: 400px">
		      <table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
		    </div>
		  </div>
		</div>
		
	</body>
	<script type="text/javascript">
	
	$(function(){
        $('#test-table').bootstrapTable({
            method: 'post',
            contentType: "application/x-www-form-urlencoded",
            sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
            url: "<%=PN%>/resourceTypeList.action",
            toolbar: '#toolbar',    //工具按钮用哪个容器
            striped: true,      //是否显示行间隔色
            cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            sortable: false,      //是否启用排序
            pagination: true,     //是否显示分页（*）
            sortOrder: "asc",     //排序方式
            pageNumber:1,      //初始化加载第一页，默认第一页
            pageSize: 5,      //每页的记录行数（*）
            pageList: [5, 10],  //可供选择的每页的行数（*）
            strictSearch: true,
            showColumns: true,     //是否显示所有的列
            showRefresh: true,     //是否显示刷新按钮showRefresh
            paginationLoop: false,  //设置为 true 启用分页条无限循环的功能。
            queryParamsType:'', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
            idField:'type_id',  //指定主键列。
            paginationPreText:'上一页',	//	指定分页条中上一页按钮的图标或文字。
            paginationNextText:'下一页',	//	指定分页条中下一页按钮的图标或文字。
            checkboxHeader: true,	//设置 false 将在列头隐藏全选复选框。
            selectItemName:'btSelectItem',
            showHeader:true,		//是否显示列头。
            showPaginationSwitch: true, 		//是否显示切换分页按钮。
           
           showExport: true,                    
   		   exportDataType: 'all',
           onEditableHidden: function(field, row, $el, reason) { // 当编辑状态被隐藏时触发
                if(reason === 'save') {
                 var $td = $el.closest('tr').children();
                 $td.eq(-1).html((row.price*row.number).toFixed(2));
                
                } else if(reason === 'nochange') {
                 $el.closest('tr').next().find('.editable').editable('show');
                }
            },
            columns: [
             {
                field: 'type_name',
                title: '类型名称',
                align: 'center',
                editable: {
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '类型名称不能为空!';  
                        }  
                    }
                }
                
            }, {
                field: 'type_describe',
                title: '类型描述',
                align: 'center',
                editable: {
                    type: 'text',  
                }
                
            },{
                title: '操作',
                field: 'type_id',
                align: 'center',
                formatter:function(value,row,index){/* value 能够获得当前列的值 */
       	
                    var d = '<button href="#" class="btn btn-default" mce_href="#" onclick="del(\''+ row.type_id +'\')">删除</button> ';
                    return d;
                    
                }
              }
            ] ,
            onEditableSave: function (field, row, oldValue, $el) {
                $.ajax({
                    type: "post",
                    url: "<%=PN%>/modMaterialsType.action",
                    data: row,
                    dataType: 'JSON',
                    success: function (data, status) {
                        if (status == "success") {
                            alert('提交数据成功');
                        }
                    },
                    error: function () {
                        alert('编辑失败');
                    },

                });
            },
            pagination:true
            
        });
       
		$('#test-table').on( 'click', 'td:has(.editable)', function (e) {
			 e.stopPropagation(); // 阻止事件的冒泡行为
			 $(this).find('.editable').editable('show'); // 打开被点击单元格的编辑状态
		} );        
		})
	
		function toPage() {
	         var pageNum = $("#pageNum").val();
	         if (pageNum) {
	             $('#test-table').bootstrapTable('selectPage', parseInt(pageNum));
	         }
	    }
		
		function del(id){
			var truthBeTold = window.confirm("您确定要删除吗？单击[确定]继续。单击[取消]停止");
			if(truthBeTold){
				$.post("<%=PN%>/delMaterialsType.action", {type_id:id}, function(data){
					common();
				},'json');
			}
		}
	
		function common(){
			$('#test-table').bootstrapTable('refresh', {
	            url: '<%=PN%>/resourceTypeList.action'
	        });
		}
		
		function saveAdmin(){
	    
		    //开启验证
		     $('#postForm').data('bootstrapValidator').validate();  
		      if(!$('#postForm').data('bootstrapValidator').isValid()){  
		      	return ;  
		      } 
		      
	    }
	    
		$(document).ready(function() {
		    formValidator();
		});
		
		
	    
		function formValidator(){
		     $('#postForm').bootstrapValidator({
		         message: 'This value is not valid',
		         feedbackIcons: {
			         valid: 'glyphicon glyphicon-ok',
			         invalid: 'glyphicon glyphicon-remove',
			         validating: 'glyphicon glyphicon-refresh'
		         },
		         fields: {
		             //用户名
		             type_name: {
		                 message: '类型名验证失败',
		                 validators: {
		                     notEmpty: {
		                         message: '类型名不能为空'
		                     }, 
		                     threshold :  1 , 
		                     remote: {
		                         url: '<%=PN%>/checkType.action',
		                         message: '类型已存在',//提示消息
		                         delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
		                         type: 'POST'//请求方式
		                     }
		                 }
		             }
		         }
		     });
		 }
		
		$("#submit").click(function(){
			$.ajax({
			    url: '<%=PN%>/addMaterialsType.action',
			    type: 'POST',
			    cache: false,
			    data: new FormData($('#postForm')[0]),
			    processData: false,
			    contentType: false
			}).done(function(res) {
				alert("增加成功");
				common();
			}).fail(function(res) {
				alert("增加失败");
			}); 
		})
	
	
	</script>
</html>