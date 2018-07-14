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
<div style="width:1500px; height:400px;margin-left:80px;border: 1px solid gray;">
	<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
</div>
</body>
<script type="text/javascript">
initTable();
function initTable(){
    $('#test-table').bootstrapTable({
        method: 'post',
        toolbar: '#toolbar',    //工具按钮用哪个容器
        url: "/MaterialManagement/paging_check.action",//这个接口需要处理bootstrap table传递的固定参数
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
            field: 'check_id',
            title: '盘点id',
            align: 'center'
        }, {
            field: 'goods_id',
            title: '物资id',
            align: 'center'
        }, {
            field: 'operator_id',
            title: '操作人id',
            align: 'center'
        } ,{
            field: 'check_time',
            title: '盘点时间',
            align: 'center',
        }, {
            field: 'goods_count',
            title: '盘点物资数量',
            align: 'center'
        } ,{
            field: 'data_compare',
            title: '数据对比',
            align: 'center'
        }, {
            field: 'hgoods_count',
            title: '盘点后物资数量',
            align: 'center',
        }, {
            field: 'userable_count',
            title: '盘点后可用数',
            align: 'center',
        }, {
            field: 'repaired_count',
            title: '盘点后待维修数',
            align: 'center'
        }, {
            field: 'scrap_count',
            title: '盘点后报废数',
            align: 'center'
        }, {
            field: 'goods_state',
            title: '盘点物资类型',
            align: 'center'
        }, {
            field: 'return_remark',
            title: '备注',
            align: 'center'
        } ,{
            title: '操作',
            field: 'user_id',
            align: 'center',
            width:300,
            formatter:function(value,row,index){  
              var e = '<a href="/" class="btn btn-default" mce_href="#" onclick="edit(\''+ row.id + '\')" data-toggle="modal" data-target="#mymode2">1</a> ';
              var d = '<a href="/" class="btn btn-default" mce_href="#" onclick="edit(\''+ row.id + '\')" data-toggle="modal" data-target="#mymode2">1</a> ';
              var f = '<a href="/" class="btn btn-default" mce_href="#" onclick="edit(\''+ row.id + '\')" data-toggle="modal" data-target="#mymode2">1</a> ';
              return e+d+f;
            }
          }],
        pagination:true 
    }); 
}
function toPage() {
    var pageNum = $("#pageNum").val();
    if (pageNum) {
        $('#test-table').bootstrapTable('selectPage', parseInt(pageNum));
    }
}




</script>
</html>