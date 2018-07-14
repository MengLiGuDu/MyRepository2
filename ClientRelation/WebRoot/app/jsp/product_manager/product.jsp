<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品管理</title>
	<style type="text/css">
		.goPage {
		    line-height: 30px;
		     margin-top: 10px;
		}
		.batchDel{
			margin-left:30px;
			margin-top:10px;
			float: left;
		}
		.tab_operate{
			width:300px;
			height:400px;
			margin-left:115px;
		}
		hr{
			border: 2px solid silver;
			margin-top: 5px;
		}
		.font{
			width: 150px;
			height: 40px;
			font-size: 30px;
			margin-top: 25px;
			margin-left: 25px;
			color: lightseagreen;
		}
	</style>
</head>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
		     .button {  
		     	margin-top:10px;
		     	margin-left:10px;
		        width: 150px;  
		        padding:8px;
		        background-color: #3F7ACF;  
		        border-color: #357ebd;  
		        color: #fff;  
		        -moz-border-radius: 10px;  
		        -webkit-border-radius: 10px;  
		        border-radius: 10px; /* future proofing */  
		        -khtml-border-radius: 10px; /* for old Konqueror browsers */  
		        text-align: center;  
		        vertical-align: middle;  
		        border: 1px solid transparent;  
		        font-weight: 900;  
		        font-size:125%  
		      }  
   		</style>
		
	</head>
	<script type="text/javascript">
		$(function(){
			$('#test-table').bootstrapTable({
		        method: 'post',
		        toolbar: '#toolbar',    //工具按钮用哪个容器
		        url: "<%=PATH%>/selectProduct.action",//这个接口需要处理bootstrap table传递的固定参数 
		        contentType: "application/x-www-form-urlencoded",
		        striped: true,      //是否显示行间隔色
		        cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		        pagination: true,     //是否显示分页（*）
		        sortable: false,      //是否启用排序
		        sortOrder: "asc",     //排序方式
		        pageNumber:1,      //初始化加载第一页，默认第一页
		        pageSize: 5,      //每页的记录行数（*）
		        pageList: [5, 10, 50, 100],  //可供选择的每页的行数（*）
		        queryParamsType:'', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
		                            // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
		
		        //queryParams: queryParams,//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
		        sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
		        search: true,      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
		        strictSearch: true,
		        //showColumns: true,     //是否显示所有的列
		        showRefresh: true,     //是否显示刷新按钮
		        //minimumCountColumns: 2,    //最少允许的列数
		        clickToSelect: true,    //是否启用点击选中行
		        searchOnEnterKey: true,
		        
		        columns: [
		                  {field: 'name',title: '产品名称',align: 'center'},
		                  {field: 'count',title: '数量', align: 'center'},
		                  {field: 'source',title: '价格',align: 'center'},
		                  {field: 'product_desc',title: '描述',align: 'center'},
		                  {field: 'create_time',title: '创建时间',align: 'center'},
		                  { title: '操作', field: 'user_id',align: 'center',
		            	  formatter:function(value,row,index){  
		            		  var e = '<button class="btn btn-default" onclick="fillMod(\''+ row.product_id +'\')" data-toggle="modal" data-target="#Mod">修改</button> ';
		                      var d = '<button class="btn btn-default" onclick="del(\''+ row.product_id +'\')">删除</button> ';
		                      return e+d;
		            	  }
		              }
		          ],
		        pagination:true
		    }); 
		})
	</script>
<body>
	<div class="font">产品管理</div>
	<hr/>
	<a onclick="addCheck()" href="#" class="btn btn-info" style="width: 100px;margin-left:10px;margin-top:-5px;" data-toggle="modal" data-target="#myModal">
		<span class="glyphicon glyphicon-plus"></span>产品添加
	</a>
	<div style="width: 100px;float:left;">
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-content">
				<form id="fm_form" action="#" method="post" class="form-group">
				<table class="tab_operate">
					<tr align="center">
						<td colspan="2" style="font-family: '华文楷体';font-size: 35px"><b id="title_b"></b></td>
					</tr>
					<tr>
						<td align="center"><label>产品名称:</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="name" id="name"/>
					 		</div>
					 		<input style="display:none" name="product_id" id="product_id"/>
				 		</td>
					</tr>
					<tr>
						<td align="center"><label>数量:</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="count" id="count"/>
					 		</div>
					 		<input style="display:none" id="option">
				 		</td>
					</tr>
					<tr>
						<td align="center"><label>价格:</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="source" id="source"/>
					 		</div>
					 		<input style="display: none" id="option">
				 		</td>
					</tr>
					<tr>
						<td align="center"><label>描述:</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<input type="text" class="form-control" name="product_desc" id="product_desc"/>
					 		</div>
					 		<input style="display: none" id="option">
				 		</td>
					</tr>
					<tr>
						<td align="center"><input onclick="exit()" type="button" class="btn btn-default" style="width: 100px;" value="取 消" ></td>
						<td align="right"><input onclick="sub()" type="button" class="btn btn-success" style="width: 100px;" value="提 交" /></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	<table id="fm-table" ></table>
</body>
<script type="text/javascript">
//添加
function addCheck(){
	$("#fm_form")[0].reset();
	$("#option").val("addCheck");
	$("#title_b").text("产品添加");
}

//取消
function exit(){
	$("#myModal").modal("hide");
	$("#fm_form")[0].reset();
}
//数据操作
function sub(){
	if($("#option").val() == "addCheck"){
		$.post("<%=PATH%>/insertProduct.action",$("#fm_form").serialize(),function(data){
			$('#fm-table').bootstrapTable('refresh',{url: "<%=PATH%>/selectProduct.action"});
		},'json')
	}else{
		$.post("<%=PATH%>/updateProduct.action",$("#fm_form").serialize(),function(data){
			$('#fm-table').bootstrapTable('refresh',{url: "<%=PATH%>/selectProduct.action"});
		},'json')
	}
	$("#myModal").modal("hide");
}
$(function(){
/*-----------------------------------------------------------------------*/	
    $('#fm-table').bootstrapTable({
    	contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		url: "<%=PATH%>/selectProduct.action",
		method:"post",
		dataType: "json",
		striped:true,//隔行变色
		clickToSelect:true,//是否选中
		cache:false,  //是否使用缓存
		showColumns:false,// 列
		pagination: true, //分页
		sortable: false, //是否启用排序
		singleSelect: false,
		search:true, //显示搜索框
		buttonsAlign: 'right', //按钮对齐方式
		showRefresh:true,//是否显示刷新按钮
		sidePagination: 'server', //客户端处理分页　服务端：server
		pageNumber:1,//启用插件时默认页数
		pageSize:5,//启用插件是默认每页的数据条数
		pageList:[5, 10, 15, 20],//自定义每页的数量
		undefinedText:'--',
		uniqueId: 'product_id', //每一行的唯一标识，一般为主键列
		queryParamsType:'',
		showPaginationSwitch:true,//隐藏分页
		searchAlign:'right',//搜索栏位置
		paginationPreText:'上一页',
		paginationNextText:'下一页',
		height:740,
		maintainSelected:true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项。
        columns: [{
            field: 'name',
            title: '产品名称',
            align: 'center'
        },{
            field: 'count',
            title: '数量',
            align: 'center'
        },{
            field: 'source',
            title: '价格',
            align: 'center'
        },{
            field: 'product_desc',
            title: '描述',
            align: 'center',
            
        },{
            field: 'create_time',
            title: '创建时间',
            align: 'center',
        },{
            field: 'product_id',
            title: '操作',
            align: 'center',
            formatter:function(value,row,index){
               	var e = '<button  class="btn btn-info"  onclick="modCheck(\''+value+'\')" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span>修改</button> ';
                var d = '<button  class="btn btn-danger"  onclick="delCheck(\''+value+'\')"><span class="glyphicon glyphicon-trash"></span>删除</button> ';
                return e+d;
            }
        }],
    })
})
//跳转
function toPage() {
    var pageNum = $("#pageNum").val();
    if (pageNum) {
        $('#fm-table').bootstrapTable('selectPage', parseInt(pageNum));
    }
}
//修改
function modCheck(value){
	$("#option").val("mod");
	$("#title_b").text("产品修改");
	$.post("<%=PATH%>/modalUpdateSelect.action",{product_id:value},function(data){
		$("#product_id").val(""+data.product_id);
		$("#name").val(""+data.name);
		$("#count").val(""+data.count);
		$("#source").val(""+data.source);
		$("#product_desc").val(""+data.product_desc);
	},'json')
}
//删除
function delCheck(value){
	$.post("<%=PATH%>/delProduct.action",{'product_id':value},function(data){
		$('#fm-table').bootstrapTable('refresh',{url: "<%=PATH%>/selectProduct.action"});
	},'json')
}
</script>
</html>