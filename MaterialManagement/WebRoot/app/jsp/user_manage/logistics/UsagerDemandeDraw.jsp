<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	#box{
		width: 1714px;
		height: 876px;	
		background: gray;
		position: absolute;
		opacity:0.5;
		left: -174px;
		top:-156px;
		display: none;
	}
	#content{
		width: 1200px;
		height: 490px;	
		background: white;
		position: absolute;
		left: 40px;
		top:0px;
		display: none;
		z-index: 1;
	}
	#content1{
		width: 1200px;
		height: 40px;	
		background: blue;
		text-align: right;
		padding-right: 7px;
		font-size: 20px;
		color: black;
		font-weight: bolder;
	}
	.content2{
		width:1200px;
		height:50px;
		border: 1px solid gray;
		position: absolute;
	}
	.content2_1{
		width:80px;
		height:50px;
		border: 1px solid gray;
		position: relative;
		top:0px;
		line-height: 50px;
	}
	.content2_2{
		width:1120px;
		height:50px;
		border: 1px solid gray;
		position: relative;
		top:-50px;
		left:80px;
	}
	.content3{
		width:1200px;
		height:280px;
		border: 0px solid gray;
		position: absolute;
		top:90px;
		
	}
</style>
</head>
<body>
	<div id="box"></div>
	<div id="content">
		<div id="content1">
			<a href="#" onclick="exit()" style="color: black;font-size: 32px;">x</a>
			<center><span style="position: absolute;top:3px;">领用明细表</span></center>
		</div>
		<div class="content2">
			<div class="content2_1">申请说明：</div>
			<textarea class="content2_2">申请什么</textarea>
		</div>
		<div class="content3">
		
		<table id="test-tables" class="col-xs-12" data-toolbar="#toolbars"></table>
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
            url: "<%=PN%>/UsagerDemandeList.action",
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
                field: 'approvaal_type',
                title: '申请类别',
                align: 'center',
                width:'300px',
                editable: {
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '类型名称不能为空!';  
                        }  
                    }
                }
                
            }, {
                field: 'approvaal_money',
                title: '申请总金额/元',
                align: 'center',
                editable: {
                    type: 'text',  
                }
            }, {
                field: 'approval_remark',
                title: '申请说明',
                align: 'center',
                editable: {
                    type: 'text',  
                }
            }, {
                field: 'approval_time',
                title: '申请时间',
                align: 'center',
                editable: {
                    type: 'text',  
                }  
            },{
                title: '操作',
                field: 'lead_id',
                align: 'center',
                formatter:function(value,row,index){/* value 能够获得当前列的值 */
       	
                    var d = '<button href="#" class="btn btn-default" onclick="know()" mce_href="#" onclick="del(\''+ row.lead_id +'\')">明细</button> ';
                    var e = '<button href="#" class="btn btn-default" mce_href="#" onclick="del(\''+ row.lead_id +'\')">出库</button> ';
                    return d+e;
                    
                }
              }
            ] ,
            pagination:true
            
        })
        $('#test-tables').bootstrapTable({
            method: 'post',
            contentType: "application/x-www-form-urlencoded",
            sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
            url: "<%=PN%>/UsagerDemandeList.action",
            toolbar: '#toolbars',    //工具按钮用哪个容器
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
                field: 'approvaal_type',
                title: '物品名称',
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
                field: 'approvaal_money',
                title: '物品类型',
                align: 'center',
                editable: {
                    type: 'text',  
                }
            }, {
                field: 'approval_remark',
                title: '规格',
                align: 'center',
                editable: {
                    type: 'text',  
                }
            }, {
                field: 'approval_time',
                title: '物品单价',
                align: 'center',
                editable: {
                    type: 'text',  
                }  
            }, {
                field: 'approval_time',
                title: '数量',
                align: 'center',
                editable: {
                    type: 'text',  
                }  
            }, {
                field: 'approval_time',
                title: '备注',
                align: 'center',
                editable: {
                    type: 'text',  
                }  
            }] ,
            pagination:true
            
        })
	 })
	 function know(){
		$("#box").css("display","block");
		$("#content").css("display","block");
	}
	function exit(){
		$("#box").css("display","none");
		$("#content").css("display","none");
	}
  </script>
</html>