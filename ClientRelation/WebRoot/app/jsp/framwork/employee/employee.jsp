<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/app/jsp/link.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
	#table{
		width:1300px;
		height:295px;
		position:absolute;
		top:15%;
		left:10%;
	}
	#add{
		width:80px;
		height:40px;
		position:absolute;
		top:12%;
		left:10%;
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
<title>Insert title here</title>
</head>
<body>
	<div class="font">员工管理</div>
	<hr/>
	<div data-toolbar="#toolbar" style="float: left;" id="add">	
        <a onclick="find(id)" data-toggle="modal" data-target="#myMod" href="#" class="btn btn-info" style="width: 100px;margin-left:10px;margin-top:-5px;">
			<span class="glyphicon glyphicon-plus"></span>员工添加
		</a>					
		<div class="modal fade" id="myMod" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel1">添加</h4>
		            </div>
		            <form class="form-horizontal" role="form" enctype="multipart/form-data" method="post" action="<%=PATH%>/insertPerson.action">
					    <div class="form-group" >
					        <label class="col-sm-2 control-label">姓名</label>
					        <div class="col-sm-8" >
					            <input type="text" class="form-control" name="name">
					        </div>
					    </div>
					    <div class="form-group">
					        <label class="col-sm-2 control-label">年龄</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" name="age">
					        </div>
					    </div>
					    <div class="form-group">
					        <label class="col-sm-2 control-label">性别</label>
					        <div class="col-sm-8">
					        	<input type="radio" name="sex" value="0">男
					            <input type="radio" name="sex" value="1">女
					        </div>
					    </div>
					    <div class="form-group">
					        <label class="col-sm-2 control-label">职位</label>
					        <div class="col-sm-8">
					        	<input type="radio" name="position" value="0">经理
					            <input type="radio" name="position" value="1">员工
					        </div>
					    </div>
					    <div class="form-group">
					        <label class="col-sm-2 control-label">手机号</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" name="phone">
					        </div>
					    </div>
					     <div class="form-group">
					        <label class="col-sm-2 control-label">身份证</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" name="id_card">
					        </div>
					    </div>
					     <div class="form-group">
					        <label class="col-sm-2 control-label">邮箱</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" name="mailbox">
					        </div>
					    </div>
					     <div class="form-group">
					        <label class="col-sm-2 control-label">地址</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" name="address">
					        </div>
					    </div>
					    <div class="form-group">
					        <input type="submit" class="col-sm-offset-2 btn btn-primary" value="提交" >
			                <button type="button" class="col-sm-offset-2 btn btn-default" data-dismiss="modal">取消</button>
					   </div>
					</form>
				</div>
		    </div>
		</div>
	</div>
	
	<div id="table">
		<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
	</div>
	
	<div data-toolbar="#toolbar" style="float: left;">							
		<div class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel1">修改</h4>
		            </div>
		            <form class="form-horizontal" role="form" enctype="multipart/form-data" method="post" action="<%=PATH%>/modifyEmployee.action">
					    <div class="form-group" style="display:none;">
					        <label for="board_id1" class="col-sm-2 control-label">销售人员Id</label>
					        <div class="col-sm-8" >
					            <input type="text" class="form-control" id="person_id"  name="person_id">
					        </div>
					    </div>
					    <div class="form-group" >
					        <label class="col-sm-2 control-label">姓名</label>
					        <div class="col-sm-8" >
					            <input type="text" class="form-control" id="name" name="name">
					        </div>
					    </div>
					    <div class="form-group">
					        <label class="col-sm-2 control-label">年龄</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="age" name="age">
					        </div>
					    </div>
					    <div class="form-group">
					        <label class="col-sm-2 control-label">性别</label>
					        <div class="col-sm-8">
					        	<input type="radio" id="nan" name="sex" value="0">男
					            <input type="radio" id="nv" name="sex" value="1">女
					        </div>
					    </div>
					    <div class="form-group">
					        <label class="col-sm-2 control-label">职位</label>
					        <div class="col-sm-8">
					         	<input type="radio" id="manager" name="position" value="0">经理
					            <input type="radio" id="staff" name="position" value="1">员工
					        </div>
					    </div>
					    <div class="form-group">
					        <label class="col-sm-2 control-label">手机号</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="phone" name="phone">
					        </div>
					    </div>
					     <div class="form-group">
					        <label class="col-sm-2 control-label">身份证</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="id_card" name="id_card">
					        </div>
					    </div>
					     <div class="form-group">
					        <label class="col-sm-2 control-label">邮箱</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="mailbox" name="mailbox">
					        </div>
					    </div>
					     <div class="form-group">
					        <label class="col-sm-2 control-label">地址</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="address" name="address">
					        </div>
					    </div>
					    <div class="form-group">
					        <input type="submit" class="col-sm-offset-2 btn btn-primary" value="提交" >
			                <button type="button" class="col-sm-offset-2 btn btn-default" data-dismiss="modal">取消</button>
					   </div>
					</form>
				</div>
		    </div>
		</div>
	</div>
</body>
<script type="text/javascript">
    $('#test-table').bootstrapTable({
        method: 'post',
        toolbar: '#toolbar',    //工具按钮用哪个容器
        url: "/ClientRelation/employee.action",//这个接口需要处理bootstrap table传递的固定参数 
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
        /* searchOnEnterKey: true, */
        queryParams: function (params) {//自定义参数，这里的参数是传给后台的，我这是是分页用的  
        	return {					 		//这里的params是table提供的  
        		pageNumber: params.pageNumber,	//从数据库第几条记录开始  
        		pageSize: params.pageSize,	    //找多少条  
        		name: params.searchText     	//搜索框值
            };
        }, 
        columns: [{field:'name',title:'姓名',align:'center'}, 
                  {field: 'age',title: '年龄',align: 'center'},
                  {field: 'sex',title: '性别', align: 'center',formatter:function(value,row,index){
                  	  var c;
                	  if(row.sex == '0'){
                		  c = '男';
                	  } else {
                		  c = '女';
                	  }
                      return c;
              	  }},
                  {field: 'position',title: '职位',align: 'center',formatter:function(value,row,index){
                  	  var a;
                	  if(row.position == '0'){
                		  a = '经理';
                	  } else {
                		  a = '员工';
                	  }
                      return a;
              	  } },
                  {field: 'phone',title: '手机号',align: 'center'},
                  {field: 'id_card',title: '身份证',align: 'center'},
                  {field: 'mailbox',title: '邮箱',align: 'center'},
                  {field: 'address',title: '地址',align: 'center'},
                  {field: 'create_time',title: '创建时间',align: 'center'},
                  {field: 'update_time',title: '修改时间',align: 'center'},
                  {field: 'status',title: '状态',align: 'center',formatter:function(value,row,index){
                    	var b;
                    	if(row.status == '0'){
                    		b = '离职';
                    	} else {
                    		b = '在职';
                    	}
                        return b;
                  }},
                  { title: '操作', field: 'article_id',align: 'center',
            	  formatter:function(value,row,index){  
            			var e = '<button  class="btn btn-info"  onclick="modCheck(\''+value+'\')" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span>修改</button> ';
            		  var e = '<button class="btn btn-info" onclick="fillMod(\''+ row.person_id +'\')" data-toggle="modal" data-target="#modify"<span class="glyphicon glyphicon-edit"></span>修改</button> ';
                      var d = '<button class="btn btn-danger" onclick="del(\''+ row.person_id +'\')"><span class="glyphicon glyphicon-trash"></span>删除</button> ';
                      var f;
                      if(row.status == '0'){
                      	f = '<button class="btn btn-default" onclick="resume(\''+ row.person_id +'\')">复值</button> ';
                  	  } else {
                  		f = '<button class="btn btn-default" onclick="expel(\''+ row.person_id +'\')">开除</button> ';
                  	  }
                      return e+d+f;
            	  }
              }
          ],
        pagination:true
    }); 
	    
	function del(id){
		$.post("/ClientRelation/deleteEmployee.action", {person_id:id}, function(data){
			common();
		},'json');
	}
	
	function fillMod(id){			
		$.post("/ClientRelation/updateEmployee.action", {person_id:id}, function(data){
			$("#person_id").val(data[0].person_id);
			$("#name").val(data[0].name);
			$("#age").val(data[0].age);
			if(data[0].sex == "0"){
				$( "#nan" )[0].checked = true;
			}else{
				$( "#nv" )[0].checked = true;
			} 
			if(data[0].position == "0"){
				$( "#manager" )[0].checked = true;
			}else{
				$( "#staff" )[0].checked = true;
			} 
			$("#position").val(data[0].position);
			$("#phone").val(data[0].phone);
			$("#id_card").val(data[0].id_card);
			$("#mailbox").val(data[0].mailbox);
			$("#address").val(data[0].address);
		},'json');
	} 
	
	function common(){
		$('#test-table').bootstrapTable('refresh', {
			query: {
				url: '/ClientRelation/employee.action'
	        }
        });
	}
	
	function resume(id){//复职
		$.post("/ClientRelation/resume.action", {person_id:id}, function(data){
			common();
		},'json');
	}
	
	function expel(id){//开除
		$.post("/ClientRelation/expel.action", {person_id:id}, function(data){
			common();
		},'json');
	}
</script>
</html>