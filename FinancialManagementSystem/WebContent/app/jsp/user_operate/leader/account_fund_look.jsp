<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户资金查看</title>
<% 
	String name = request.getContextPath();
%>
<link rel="stylesheet" href="<%=name%>/app/css/bootstrap.css" />
<link rel="stylesheet" href="<%=name%>/app/css/bootstrap-table.css" />
<link rel="stylesheet" href="<%=name%>/app/css/bootstrap-editable.css"/>
<script type="text/javascript" src="<%=name%>/app/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=name%>/app/js/bootstrap.js" ></script>
<script type="text/javascript" src="<%=name%>/app/js/bootstrap-editable.js"></script>
<script type="text/javascript" src="<%=name%>/app/js/bootstrap-table.js" ></script>
<script type="text/javascript" src="<%=name%>/app/js/bootstrap-table-zh-CN.js" ></script>
<script type="text/javascript" src="<%=name%>/app/js/bootstrap-table-editable.js" ></script>
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
	.font{
		width: 180px;
		height: 40px;
		font-size: 30px;
		margin-top: 25px;
		margin-left: 25px;
		color: lightseagreen;
	}
	.line_div{
		font-size:20px;
		font-family: '楷体';
		color: red;
		width: 92%;
		margin: 3% auto;
		border-bottom: 1.5px solid black;
	}
</style>
</head>
<body>
	<div style="border-top:30px solid #505e7b;"></div>
	<div class="line_div"><label>账户资金查看</label></div>
	<div  style="width:92%;margin:0 auto;">  
		<table id="fm-table"></table> 
	</div>
</body>
<script type="text/javascript">

	$(function(){
	    $('#fm-table').bootstrapTable({
	    	contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			url: "<%=name%>/like_account_select.action",
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
			showRefresh:false,//是否显示刷新按钮
			sidePagination: 'server', //客户端处理分页　服务端：server
			pageNumber:1,//启用插件时默认页数
			pageSize:5,//启用插件是默认每页的数据条数
			pageList:[5, 10, 15, 20],//自定义每页的数量
			undefinedText:'--',
			uniqueId: 'account_id', //每一行的唯一标识，一般为主键列
			queryParamsType:'',
			showPaginationSwitch:false,//隐藏分页
			searchAlign:'right',//搜索栏位置
			paginationPreText:'上一页',
			paginationNextText:'下一页',
			height:600,
			maintainSelected:true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项。
	        columns: [{
	            field: 'account',
	            title: '账户号码',
	            align: 'center'
	        },{
	            field: 'account_name',
	            title: '账户名称',
	            align: 'center'
	        },{
	            field: 'banks_type',
	            title: '开户行',
	            align: 'center'
	        }, {
	            field: 'account_oldMoney',
	            title: '初始余额',
	            align: 'center'
	        },{
	            field: 'account_newMoney',
	            title: '现金额',
	            align: 'center'
	        }],
	    })
	})
</script>
</html>