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
<head>
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
<body>
	<button data-toggle="modal" data-target="#myMod" class="button">添加客户</button>
	<div data-toolbar="#toolbar" style="float: left;">							
		<div class="modal fade" id="myMod" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		        
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel1" >添加客户</h4>
		            </div>
		            <form class="form-horizontal" role="form" enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/inputClient.action">
					    <div class="form-group" >
					        <label for="client_name" class="col-sm-2 control-label">客户名称</label>
					        <div class="col-sm-8" >
					            <input type="text" class="form-control" id="client_name"  name="client_name">
					        </div>
					    </div>
					     <div class="form-group" >
					        <label for="name" class="col-sm-2 control-label">公司名称</label>
					        <div class="col-sm-8" >
					            <input type="text" class="form-control" id="name"  name="name">
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="address" class="col-sm-2 control-label">公司住址</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="address"  name="address">
					        </div>
					    </div>
					     <div class="form-group">
					        <label for="grade" class="col-sm-2 control-label">客户等级</label>
					        <div class="col-sm-8">
					            <select class="form-control" id="grade" name="grade">
					            <option value="0">潜在用户</option>
					            <option value="1">普通用户</option>
					            <option value="2">会员</option>
					            </select>
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="phone" class="col-sm-2 control-label">电话</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="phone"  name="phone">
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="postcode" class="col-sm-2 control-label">邮编</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="postcode"  name="postcode">
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
	
	<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
	<div data-toolbar="#toolbar" style="float: left;">							
		<div class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel1">客户修改</h4>
		            </div>
		            <form class="form-horizontal" role="form" enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/modifyClient.action">
					    <div class="form-group" style="display:none;">
					        <label for="client_id" class="col-sm-2 control-label"></label>
					        <div class="col-sm-8" >
					            <input type="text" class="form-control" id="client_id"  name="client_id">
					        </div>
					    </div>
					    <div class="form-group" >
					        <label for="client_name1" class="col-sm-2 control-label">客户名称</label>
					        <div class="col-sm-8" >
					            <input type="text" class="form-control" id="client_name1"  name="client_name">
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="name1" class="col-sm-2 control-label">公司名称</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="name1"  name="name">
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="address1" class="col-sm-2 control-label">公司住址</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="address1"  name="address">
					        </div>
					     </div>
					     
					     <div class="form-group">
					        <label for="grade1" class="col-sm-2 control-label">客户等级</label>
					        <div class="col-sm-8">
					            <select class="form-control" id="grade1" name="grade">
					              <option value="1">潜在用户</option>
					              <option value="2">普通用户</option>
					              <option value="3">会员</option>
					            </select>
					        </div>
					    </div>
					  
					    <div class="form-group">
					        <label for="phone1" class="col-sm-2 control-label">电话</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="phone1"  name="phone">
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="postcode1" class="col-sm-2 control-label">邮编</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="postcode1"  name="postcode">
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
	
   <table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
	<div data-toolbar="#toolbar" style="float: left;">							
		<div class="modal fade" id="modify1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel2">客户查询</h4>
		            </div>
		            <form class="form-horizontal" role="form" enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/modifyClient.action">
					    <div class="form-group" style="display:none;">
					        <label for="client_id" class="col-sm-2 control-label"></label>
					        <div class="col-sm-8" >
					            <input type="text" class="form-control" id="client_id"  name="client_id">
					        </div>
					    </div>
					    <div class="form-group" >
					        <label for="client_name1" class="col-sm-2 control-label">客户名称</label>
					        <div class="col-sm-8" >
					            <input type="text" class="form-control" id="client_name2"  name="client_name">
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="name1" class="col-sm-2 control-label">公司名称</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="name2"  name="name">
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="address1" class="col-sm-2 control-label">公司住址</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="address2"  name="address">
					        </div>
					     </div>
					     
					     <div class="form-group">
					        <label for="grade1" class="col-sm-2 control-label">客户等级</label>
					        <div class="col-sm-8">
					            <select class="form-control" id="grade2" name="grade">
					              <option value="1">潜在用户</option>
					              <option value="2">普通用户</option>
					              <option value="3">会员</option>
					            </select>
					        </div>
					    </div>
					  
					    <div class="form-group">
					        <label for="phone1" class="col-sm-2 control-label">电话</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="phone2"  name="phone">
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="postcode1" class="col-sm-2 control-label">邮编</label>
					        <div class="col-sm-8">
					            <input type="text" class="form-control" id="postcode2"  name="postcode">
					        </div>
					    </div>
					    <div class="form-group">
			                <button type="button" class="col-sm-offset-2 btn btn-default" data-dismiss="modal" style="background-color:blue">确定</button>
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
        url: "/ClientRelation/plate.action",//这个接口需要处理bootstrap table传递的固定参数 
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
                  { title: '操作', field: 'client_id',align: 'center',
            	  formatter:function(value,row,index){  
            		  var e = '<button class="btn btn-default" onclick="fillMod(\''+ row.client_id +'\')" data-toggle="modal" data-target="#modify">修改</button> ';
                      var d = '<button class="btn btn-default" onclick="del(\''+ row.client_id +'\')">删除</button> ';
            		  var r= '<button class="btn btn-default" onclick="fillMod1(\''+ row.client_id +'\')" data-toggle="modal" data-target="#modify1">详细信息</button> ';
                      return e+d+r;
            	  }
              }
          ],
        pagination:true
    }); 
	function toPage() {
	    var pageNum = $("#pageNum").val();
	    if (pageNum) {
	        $('#test-table').bootstrapTable('selectPage', parseInt(pageNum));
	    }
	}
	
	function addBoard(){			
		$.post("/ClientRelation/addBoard.action", function(data){
			for(var i = 0; i<data.length; i++){
				board += "<option value="+data[i].client_id+">"+data[i].client_name+"</option>";
				$("#client_id").html(board);
			}
		},'json');
	}	
	function fillMod(id){			
		$.post("/ClientRelation/updateClient.action", {client_id:id}, function(data){
			$("#client_id").val(data[0].client_id);
			$("#client_name1").val(data[0].client_name);
			$("#name1").val(data[0].name);
			$("#address1").val(data[0].address);
			$("#grade1").val(data[0].grade);
			$("#phone1").val(data[0].phone);
			$("#postcode1").val(data[0].postcode);
		},'json');
	} 
	function fillMod1(id){			
		$.post("/ClientRelation/updateClient.action", {client_id:id}, function(data){
			$("#client_id1").val(data[0].client_id);
			$("#client_name2").val(data[0].client_name);
			$("#name2").val(data[0].name);
			$("#address2").val(data[0].address);
			$("#grade2").val(data[0].grade);
			$("#phone2").val(data[0].phone);
			$("#postcode2").val(data[0].postcode);
		},'json');
	} 
	function common(){
		$('#test-table').bootstrapTable('refresh', {
			query: {
				url: '/ClientRelation/plate.action'
	        }
        });
	}
	
	function del(id){
		$.post("/ClientRelation/deleteClient.action", {client_id:id}, function(data){
			common();
		},'json');
	}
	
</script>
</div>
</html>