<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 物资管理</title>
	<style>
		.fl{
			float: left;
		}
		.fr{
			float:right;
		}
		th{
			text-align: center;
		}
		
	</style>
</head>
<body>
	<div  class="col-xs-12" data-toolbar="#toolbar" style="float: left;">
		<br>
		<div style="float: left">
			<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#enterStoreroom" onclick="enterPage()">入库</button>
			<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#takeCheck" onclick="takePage()">盘点</button>
		</div>
		<div  style="float: right;">
			<span>物品类型<select id="mType" ></select></span>
			<span>物品名称<input type="text" id = "mName"></span>
			<button class="btn btn-primary" onclick ="queryList()">查询</button>
		</div>
		<br>
		<div class="modal fade" id="enterStoreroom" >
			<div class="modal-dialog" style="width:80%">
				<div class="modal-content">				
					<div style="padding: 50px 50px 10px;">
						
							<div class="modal-header">
								<a class="close" data-dismiss = "modal">x</a>
								<h1 class="label-primary text-center">入库</h1>
							</div>
							<div class="modal-body">
								<table class="table table-bordered table-hover" id="enterTable" >
									<thead>
										<tr>
											<th><input type="checkbox"  id="enterCheck" >全选</th>
											<th>物品名称</th>
											<th>类型</th>
											<th>规格</th>
											<th>物品单价</th>
											<th>数量</th>
											<th>备注</th>
										</tr>
									</thead>
									<tbody id="enterTableTbody">
										
									</tbody>
								</table>
								<div class="text-center">
									<a href="#" class="btn btn-default" style="margin-right: 150px;" onclick="tableAdd()">新增一行</a><a href="#" class="btn btn-default" onclick="tableDel()">删除选中行</a>
								</div>
							</div>
							<div class="modal-footer">
								<div class="text-center">
									<button  class="btn btn-primary" style="margin-right: 150px;" onclick="tableSumbit(1)" data-dismiss="modal">提交</button><button  class="btn btn-primary" onclick="tableSumbit(2)" data-dismiss="modal">保存到草稿</button>
								</div>
							</div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="takeCheck" >
			<div class="modal-dialog" style="width:80%">
				<div class="modal-content">				
					<div style="padding: 50px 50px 10px;">
						<div class="modal-header">
							<a class="close" data-dismiss = "modal">x</a>
							<h1 class="label-primary text-center">盘点</h1>
						</div>
						<div class="modal-body">
							<table class="table table-bordered table-hover" id="enterTable" >
								<thead>
									<tr height="100px"style="text-align: center;" >
										<td style="line-height: 100px;">申请说明:</td>
										<td colspan="8"><input  type="text" class="form-control" placeholder="输入盘点申请说明"style="border:none;margin-top: 30px"></td>
									</tr>
									<tr> 
										<th>物品类型</th>
										<th>类型名称</th>
										<th>库存数量</th>
										<th>可用数量</th>
										<th>待维修数量</th>
										<th>报废数量</th>
										<th>盘点后可用数量</th>
										<th>盘点后待维修数量</th>
										<th>盘点后报废数量</th>
									</tr>
								</thead>
								<tbody id="tableTbody">
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<div class="text-center">
								<button  class="btn btn-primary" style="margin-right: 150px;" onclick="takeSubmit()" data-dismiss="modal" data-dismiss="modal">提交审批</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid"><!-- -fluid -->
		<div class="row">
			<div class="col-sm-12" style="height: 400px">
				<table id="test-table" class="col-xs-12" data-toolbar="#toolbar" data-query-params=""></table>
		    </div>
		 </div>
	</div>
	
</body>
<script type="text/javascript">
var $table;
var overAllIds = new Array();
	$(function(){
		$table = $('#test-table').bootstrapTable({//table分页
	        method: 'post',
	        contentType: "application/x-www-form-urlencoded",
	        sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
	        url: "<%=PN%>/materialsList.action",
	        toolbar: '#toolbar',    //工具按钮用哪个容器
	        striped: true,      //是否显示行间隔色
	        cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	        sortable: false,      //是否启用排序
	        pagination: true,     //是否显示分页（*）
	        sortOrder: "asc",     //排序方式
	        pageNumber:1,      //初始化加载第一页，默认第一页
	        pageSize: 5,      //每页的记录行数（*）
	        pageList: [5, 10],  //可供选择的每页的行数（*）
	        clickToSelect:true, //是否选中 
	        strictSearch: true,
	        //responseHandler:responseHandler, //在渲染页面数据之前执行的方法，此配置很重要!!!!!!!  
	        showColumns: true,     //是否显示所有的列
	        showRefresh: true,     //是否显示刷新按钮showRefresh
	        paginationLoop: false,  //设置为 true 启用分页条无限循环的功能。
	        queryParamsType:'', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
	        queryParams:function queryParams (params) {
	            var temp = {  //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	                    pageSize: params.pageSize,  //页面大小
	                    pageNumber: params.pageNumber, //页码
	                  	//后台请求传的查询参数
	                    type_id: $("#mType").val(),
	                    goods_name:$("#mName").val(),
	                 	}
	                return temp;
	        },//传递参数（*）
	        idField:'goods_id',  //指定主键列。
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
	            align: 'center',
	            checkbox:true,
	            formatter:function(value,row,index){ // 每次加载 checkbox 时判断当前 row 的 id 是否已经存在全局 Set() 里
	            	 if($.inArray(row.goods_id,overAllIds)!=-1){// 因为 判断数组里有没有这个 id 
	                      return {
	            		 	checked:true
	            	 	}
	                 }
	            }
	           /*  editable: {
	                type: 'text',  
	                validate: function (value) {  
	                    if ($.trim(value) == '') {  
	                        return '类型名称不能为空!';  
	                    }  
	                }
	            } */
	            
	        },{
	            field: 'goods_name',
	            title: '物资名称',
	            align: 'center',   
	        },{
	            field: 'goods_price',
	            title: '物资单价',
	            align: 'center',
	        },{
	            field: 'goods_spec',
	            title: '规格',
	            align: 'center',
	        },{
	            field: 'goods_count',
	            title: '数量',
	            align: 'center',
	        },{
	            field: 'userable_count',
	            title: '可用数量',
	            align: 'center',
	        },{
	            field: 'repaired_count',
	            title: '待维修数',
	            align: 'center',
	        },{
	            field: 'scrap_count',
	            title: '报废数',
	            align: 'center',
	        },{
	            field: 'goods_remark',
	            title: '备注',
	            align: 'center',
	        },{
	            field: 'goods_state',
	            title: '状态',
	            align: 'center',
	            formatter:function(value,row,index){
	            	var b ;
	            	if(value == 2){
	            		b="草稿";
	            	}else{
	            		b="正常";
	            	}
	            	return b; 
	            }
	        } <%--,{
	            title: '操作',
	            field: 'type_id',
	            align: 'center',
	            formatter:function(value,row,index){/* value 能够获得当前列的值 */
	                var d = '<button href="#" class="btn btn-default" mce_href="#" onclick="del(\''+ row.type_id +'\')">删除</button> ';
	                return d;
	                
	            } 
	          }--%>
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
		
		$('#test-table').on('uncheck.bs.table check.bs.table check-all.bs.table uncheck-all.bs.table',function(e,rows){
	        var datas = $.isArray(rows) ? rows : [rows];        // 点击时获取选中的行或取消选中的行
	        examine(e.type,datas);                              // 保存到全局 Array() 里
	   });
		
		
		
		/*  //选中事件操作数组  
	    var union = function(array,ids){  
	        $.each(ids, function (i, id) {  
	            if($.inArray(id,array)==-1){  
	                array[array.length] = id;  
	            }  
	             });  
	            return array;  
	    };  
	    //取消选中事件操作数组  
	    var difference = function(array,ids){  
	            $.each(ids, function (i, id) {  
	                 var index = $.inArray(id,array);  
	                 if(index!=-1){  
	                     array.splice(index, 1);  
	                 }  
	             });  
	            return array;  
	    };  
	    var _ = {"union":union,"difference":difference};  
	    //绑定选中事件、取消事件、全部选中、全部取消  
	    $table.on('check.bs.table check-all.bs.table uncheck.bs.table uncheck-all.bs.table', function (e, rows) {  
	            var ids = $.map(!$.isArray(rows) ? [rows] : rows, function (row) {  
	                     return row.id;  
	            });  
	             func = $.inArray(e.type, ['check', 'check-all']) > -1 ? 'union' : 'difference';  
	             selectionIds = _[func](selectionIds, ids);   
	     });  */
	});  
		function examine(type,datas){            
		    if(type.indexOf('uncheck')==-1){    
		        $.each(datas,function(i,v){
		        	overAllIds.indexOf(v.goods_id) == -1 ? overAllIds.push(v.goods_id) : -1;
		           // 添加时，判断一行或多行的 id 是否已经在数组里 不存则添加　
		           });
		    }else{
		        $.each(datas,function(i,v){
		            overAllIds.splice(overAllIds.indexOf(v.goods_id),1);    //删除取消选中行
		        });
		    }
		    
		       //console.log(overAllIds);
		}
	    //表格分页之前处理多选框数据  
	    function responseHandler(res) {  
	          $.each(res.rows, function (i, row) {  
	              row.goods_id = ($.inArray(row.goods_id, selectionIds) != -1);  //判断当前行的数据id是否存在与选中的数组，存在则将多选框状态变为true  
	          });  
	          return res;  
	    }   
	    
	   
	$('#enterCheck').click(function(){//入库全选
    	var list = document.getElementsByName("enterPro");
    	if($("#enterCheck").prop("checked")){
    		for(var  i = 0; i<list.length; i++){
				if(list[i].checked){
				}else{
					list[i].checked=true;	 
				}
			}
    	}else{
    		for(var  i = 0; i<list.length; i++){
				if(list[i].checked){
					list[i].checked=false;	
				}
			}
    	}
	 })
	 function takePage(){
		if(overAllIds.length == 0){
			alert("请选择你要盘点的选项！");
		}else{
			alert(overAllIds.length);
		}
	}
	 function materialsTypeList(select){//填充下拉框
    	 $.post("<%=PN%>/materialsTypeSelect.action",function(data){
    		var temp = "<option value='' >全部选项</option>"
    		 for(var i = 0; i<data.length;i++){
    			 temp+="<option value="+data[i].type_id+" >"+data[i].type_name+"</option>"
    		 }
    		 $(select).html(temp);
    	 }); 
    }
	 materialsTypeList("#mType");//刷新页面填充下拉框
	 
	 function selectList(){ //添加行信息
		 var enterTr;
		 $.ajaxSettings.async = false;
		 $.post("<%=PN%>/materialsTypeSelect.action",function(data){
			 enterTr='<tr>'+
				'<td><input type="checkbox" name="enterPro" class="form-control"></td>'+
					'<td><input type="text" class="form-control"></td>'+
					'<td><select name="enterSelect" class="form-control" >';
	    		 for(var i = 0; i<data.length;i++){
	    			 enterTr+="<option value="+data[i].type_id+" >"+data[i].type_name+"</option>"
	    		 }
	    		 enterTr+='</select></td>'+
					'<td><input type="text" class="form-control"></td>'+
					'<td><input type="text" class="form-control"></td>'+
					'<td><input type="text" class="form-control"></td>'+
					'<td><input type= "text" class="form-control"></td>'+
				'</tr>';
	    	 }); 
		 $.ajaxSettings.async = true; 
		 return enterTr;
	 }
		function enterPage(){//入库信息初始化
			var a = selectList();
			$("#enterTableTbody").html(a+a+a+a);
		}
		
		function tableAdd(){//添加批量行
			$("#enterTable").append(selectList());
		}
		function tableDel(){//删除批量行
			var del =  $("input[name='enterPro']:checked");
			if(del.length == 0){
				alert("请选择你要删除的选项");
			}else{
				del.each(function() { // 遍历选中的checkbox
		            n = $(this).parents("tr").index()+1;  // 获取checkbox所在行的顺序
		            $("table#enterTable").find("tr:eq("+n+")").remove();
		        });
			}
		}
		
		function materialObject(goods_name,type_id,
				goods_spec,goods_price,goods_count,goods_remark,goods_state){//物资对象
			var o = new Object();
			o.type_id = type_id;
			o.goods_name = goods_name;
			o.goods_price = goods_price	;
			o.goods_spec = goods_spec; 
			o.goods_count = goods_count;
			o.goods_remark = goods_remark;
			o.goods_state = goods_state;
			return o;
		}
		function tableSumbit(data){// 批量添加
			var a=0;
			var p= new Array();
			var temp = "";
          	 var trList =  $("input[name='enterPro']:checked").closest("tr").find("td");	 
			    for(var i = 0;i<trList.length;i++){
				    var child = trList[i].childNodes;
				    for(var j = 0;j<child.length;j++){
						if(child[j].value == "on"||child[j].value == undefined){
						}else if(child[j].value!=''){ 
						    a++;
						    temp+=child[j].value+",";
						   if(a==6){
							   var l = temp.split(","); 
							   p.push(materialObject(l[0],l[1],l[2],l[3],l[4],l[5],l[6]),data);
							   a=0;
							   temp="";
						   } 
						}else{
							p = [];
							i=trList.length;
							break;
						}
				    }			    
			    }
			    if(p.length >0){
			    	for(var i = 0;i<p.length;i++){
			    		$.post("<%=PN%>/materialsAdd.action",p[i],function(data){
			    			
			    		});
			    	}
			    	alert("批量添加成功");
			    	common();
			    	
			    }else{
			    	alert("所有选项必填！");
			    }
		}
		  
		
</script>
</html>