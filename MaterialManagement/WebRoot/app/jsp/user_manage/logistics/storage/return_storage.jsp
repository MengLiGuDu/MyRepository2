<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/fengye/css/bootstrap-table.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/fengye/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/fengye/css/icon.css">



<script type="text/javascript" src="${pageContext.request.contextPath}/fengye/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/fengye/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/fengye/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/fengye/js/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<div style="width:1500px; height:400px;margin-left:80px;">
<table id="test-table" class="col-xs-10" data-toolbar="#toolbar" ></table>
</div>
</body>
<script type="text/javascript">
initTable();
function initTable(){
    $('#test-table').bootstrapTable({
        method: 'post',
        toolbar: '#toolbar',    //工具按钮用哪个容器
        url: "/MaterialManagement/paging_returnStorage.action",//这个接口需要处理bootstrap table传递的固定参数
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
        //showColumns: true,     //是否显示所有的列
        //minimumCountColumns: 2,    //最少允许的列数
        clickToSelect: true,    //是否启用点击选中行
        searchOnEnterKey: true,
        columns: [{
            field: 'operator_id',
            title: '操作人id',
            align: 'center',
        }, { 
            field: 'return_time',
            title: '归还时间', 
            align: 'center',
        } ,{
            field: 'goods_state',
            title: '状态',
            align: 'center',
            formatter:function(value,row,index){
            	var e ;
            	if(row.goods_state == '0'){
            		e = '已处理';
            	} else if(row.goods_state == '1'){
            		e = '处理中';
            	}
            	return e;
            }
        } ,{
            field: 'return_remark',
            title: '备注',
            align: 'center',
        } ,{
            title: '操作',
            field: 'user_id',
            align: 'center',
            width:300,
            formatter:function(value,row,index){  
              var e = '<a href="/" class="btn btn-default" mce_href="#" onclick="edit(\''+ row.id + '\')" data-toggle="modal" data-target="#mymode2">详情</a> ';
              return e;
            }
          }],
        pagination:true 
    });
}
function toPage(){
    var pageNum = $("#pageNum").val();
    if (pageNum) {
        $('#test-table').bootstrapTable('selectPage', parseInt(pageNum));
    }
}




</script>
</html>