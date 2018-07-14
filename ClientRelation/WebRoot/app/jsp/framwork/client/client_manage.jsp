<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
	<div data-toolbar="#toolbar" style="float: left;">							
		<div class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		</div>
	</div>
 </body>
<script type="text/javascript">
    $('#test-table').bootstrapTable({
        method: 'post',
          //工具按钮用哪个容器
        url: "/ClientRelation/plates.action",//这个接口需要处理bootstrap table传递的固定参数 
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
        //show1: true,     //是否显示所有的列
        showRefresh: true,     //是否显示刷新按钮
        //minimumCount1: 2,    //最少允许的列数
        clickToSelect: true,    //是否启用点击选中行
        searchOnEnterKey: true,
        
        columns: [{field:'client_name',title:'客户名称',align:'center'},
                  {field:'name',title:'公司名称',align:'center'},
                  {field: 'address',title: '公司地址', align: 'center'},
                  {field: 'grade',title: '客户等级',align: 'center',formatter:function(value,row,index){
                  	var d;
                	if(row.grade == '0'){
                		d = '潜在用户';
                	} else if(row.grade=='1'){
                		d = '普通用户';
                	}else{
                		d='会员';
                	}
                    return d;
              }},
                  {field: 'phone',title: '电话',align: 'center'},
                  {field: 'postcode',title: '邮编',align: 'center'},
          ],
        pagination:true
    }); 
	
	function common(){
		$('#test-table').bootstrapTable('refresh', {
			query: {
				url: '/ClientRelation/plates.action'
	        }
        });
	}
</script>
</html>