<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申购转报销</title>
<% 
	String path = request.getContextPath();
%>
<link rel="stylesheet" href="<%=path%>/app/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path%>/app/css/bootstrap-table.css" />
<link rel="stylesheet" href="<%=path%>/app/css/bootstrap-treeview.css" />
<script type="text/javascript" src="<%=path%>/app/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=path%>/app/js/bootstrap.js" ></script>
<script type="text/javascript" src="<%=path%>/app/js/bootstrap-table.js" ></script>
<script type="text/javascript" src="<%=path%>/app/js/bootstrap-table-zh-CN.js" ></script>
<script type="text/javascript" src="<%=path%>/app/js/bootstrap-treeview.js" ></script>
<style type="text/css">
	.maxbox{
		margin-left: 30px;
		margin-top: 20px;
	}	
	hr{
		border: 1px solid silver;
		margin-top: 5px;
	}
	.font{
		width: 180px;
		height: 40px;
		font-size: 30px;
		margin-top: 10px;
		margin-left: 20px;
		color: lightseagreen;
	}
	.treeBox{
		width:200px;
		margin-right: 20px;
		float:left;
	}
	.tab{
		width:1300px;
		float:left;
		margin-top: 30px;
	}
	.seek_parameter{
		width: 250px;
		height: 60px;
		position:absolute;
		right:350px;
	}
	.seek_parameter>span{
		display: inline-block;
		width: 120px;
		margin-top:5px;
	}
</style>
</head>
<body>
	<div class="maxbox">
		<div style="border-top:30px solid #505e7b;"></div>
		<div class="font">申购转报销</div>
		<hr/>
		<div class="treeBox">
			<div id="subProjectTree" class="tree"></div>
		</div>
		<div class="seek_parameter" >
			<span style="text-align: right;font-weight:bold;" > 请选择父科名: </span>
			<span> 
				<select   id="queyr_select" style="width:135px; " >
				</select>
		    </span>  
		</div>
		<div class="tab">
			<table id="fm-table" class="col-xs-12" data-toolbar="#toolbar"></table>
		</div>
		<!-- 模态框 数据 -->	
		<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog" style="width: 80%;">
		        <div class="modal-content">
		          <table border="1" class="table text-center">
						<thead>
							<tr class="btn-success">
								<td>物品名称</td>
								<td>单价</td>
								<td>数量</td>
								<td>总金额</td>
								<td>创建时间</td>
							</tr>
						</thead>
						<tbody>
							<tr class=""> 
								<td>
									<input type="text" name="purchase_id" id="purchase_id"/>
								</td>
								<td>
									<input type="text" name="user_id" id=""/>
								</td>								
							</tr>		
						</tbody>
					</table>
		        </div>
		    </div>
		</div> -->
	</div>

</body>
<script type="text/javascript">
	$(function(){
		$.post("<%=path%>/reimbursemement.action","",function(list){
			$("#subProjectTree").treeview({data:list,
				collapseIcon: "glyphicon glyphicon-triangle-bottom",
				expandIcon: "glyphicon glyphicon-triangle-right",
				levels:0,
				onNodeSelected:function(event, data){
					console.log(data.node_id)
					if(data.parent_id != undefined){
						$("#course_id").val(data.node_id)
						getTable(data.node_id);
					}
				}
			});
		},'json')
		getTable(null);
	})

	$(function(){
	    $('#fm-table').bootstrapTable({
	    	contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			url: "<%=path%>/purchase_select.action",
			method:"post",
			dataType: "json",
			striped:true,//隔行变色
			clickToSelect:true,//是否选中
			cache:false,  //是否使用缓存
			showColumns:false,// 列
			pagination: true, //分页
			sortable: false, //是否启用排序
			singleSelect: false,
			search:false, //显示搜索框
			buttonsAlign: 'right', //按钮对齐方式
			showRefresh:false,//是否显示刷新按钮
			sidePagination: 'server', //客户端处理分页　服务端：server
			pageNumber:1,//启用插件时默认页数
			pageSize:5,//启用插件是默认每页的数据条数
			pageList:[5, 10, 15, 20],//自定义每页的数量
			undefinedText:'--',
			uniqueId: 'purchase_id', //每一行的唯一标识，一般为主键列
			queryParamsType:'',
			showPaginationSwitch:false,//隐藏分页
			searchAlign:'right',//搜索栏位置
			paginationPreText:'<',
			paginationNextText:'>',
			height:600,
			maintainSelected:true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项。
	        columns: [{
	            field: 'purchase_title',
	            title: '申购主题',
	            align: 'center'
	        },{
	            field: 'course_name',
	            title: '科目',
	            align: 'center'
	        },{
	            field: 'user_id',
	            title: '申购人',
	            align: 'center'
	        },{
	            field: 'purchase_money',
	            title: '申购金额',
	            align: 'center'
	        },{
	            field: 'purchase_date',
	            title: '申请申购时间',
	            align: 'center'
	        },{
	            field: 'cashier_state',
	            title: '申购状态 ',
	            align: 'center'
	        },{
	        	field:'purchase_id',
	        	title:'操作',
	        	align:'center',
	        	formatter:function(value,row,index){
        			var detail = '<button  class="btn btn-info"  onclick="modPurchase(\''+value+'\')" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span>明细</button> ';
                    var generate = '<button  class="btn btn-danger"  onclick="delPurchase(\''+value+'\')"><span class="glyphicon glyphicon-ok-circle"></span>生成报销单</button> ';
        		    return detail+generate;
	        	}
	        }],
	    })
	})
</script>
</html>














