<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String path = request.getContextPath(); %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出纳已确认收入</title>
	<link rel="stylesheet" href="<%=path%>/app/css/bootstrap.css">
	<link rel="stylesheet" href="<%=path%>/app/css/bootstrap-table.css">
	<link rel="stylesheet" href="<%=path%>/app/css/bootstrap-treeview.css"> 
	<script src="<%=path%>/app/js/jquery-3.2.1.js"></script>  
	<script src="<%=path%>/app/js/bootstrap.js"></script> 
	<script src="<%=path%>/app/js/bootstrap-table.js"></script> 
	<script src="<%=path%>/app/js/bootstrap-treeview.js"></script> 
	<script src="<%=path%>/app/js/bootstrap-table-zh-CN.js"></script>
	<style type="text/css">
		.line_div{
			font-size:25px;
			font-family: '楷体';
			color: red;
			width: 92%;
			margin: 2% auto;
			border-bottom: 1.5px solid black;
		}
		.tab_operate{
			width:350px;
			height:750px;
			margin-left:110px;
		}
		.box{
			margin-top:20px;
			margin-left:20px;
		}
		#waitTree{
			width:200px;
			float:left;
			margin-left:50px;
		}
		.table{
			width:1400px;
			float:left;
		}
	</style>
</head>
<body>
	<div style="border-top:30px solid #505e7b;"></div>
	<div class="line_div"><label>出纳已确认收入</label></div>
	<div class="box">
		<div id="waitTree" class="tree"></div>
		<div class="table">
			<div id="toolbar" class="btn-group">
		        <table style="margin-left:500px;">
		        	<tr>
		        		<td><label>账单标题:</label></td>
		        		<td><input type = "text" class="form-control" name="bill_title" id="bill_title"/></td>

		        		<td><label>付款人:</label></td>
		        		<td><input type = "text"  class="form-control" name="user_name" id="user_name"/></td>
		        		<td>
		        			<button class="btn btn-default" onclick = "refresh()">
					            <span class="glyphicon glyphicon-search"></span>搜 索
					        </button>
		        		</td>
		        	</tr>
		        </table>	        	
			</div>
			<div class="panel panel-default" style="width:94%;margin-left:20px;">  
				<div class="panel-body">
					<table id="fm-table"></table> 
				</div>  
			</div>
		</div>
	</div>
	<div class="modal" id="myLook">
		<div class="modal-dialog modal-content">
			<table class="tab_operate">
				<tr align="center">
					<td colspan="2" style="font-family: '华文楷体';font-size: 35px"><b id="title_b">查看详情</b></td>
				</tr>
				<tr>
					<td align="right"><b>收入项目：</b></td>
					<td id="income_projects" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>科目：</b></td>
					<td id="course_name" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>标题：</b></td>
					<td id="income_name" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>付款人：</b></td>
					<td id="payment_name" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>付款单位：</b></td>
					<td id="payment_unit" style="color:gray;"></td>
				</tr>
				<tr>
					<td width="100" align="right"><b>付款账号：</b></td>
					<td id="payment_accountNum" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>收款人：</b></td>
					<td id="gathering_name" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>收款账号：</b></td>
					<td id="gathering_accountNum" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>交易方式：</b></td>
					<td id="deal_type" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>应收金额：</b></td>
					<td id="receipts_money" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>实缴金额：</b></td>
					<td id="payment_money" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>描述：</b></td>
					<td id="expenditure_remark" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>收入凭证编号：</b></td>
					<td id="Income_evidence" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>创建时间：</b></td>
					<td id="create_date" style="color:gray;"></td>
				</tr>
				<tr>
					<td align="right"><b>状态：</b></td>
					<td style="color:gray;">待出纳确认</td>
				</tr>
				<tr align="center">
					<td  colspan="2"><input onclick="exit()" type="button" class="btn btn-default" style="width: 100px;" value="关  闭" ></td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
//关闭
function exit(){
	$("#myLook").modal("hide");
}
$(function(){
	$.post("<%=path%>/income_subject_tree.action","",function(list){
		$("#waitTree").treeview({data:list,
			collapseIcon: "glyphicon glyphicon-triangle-bottom",
			expandIcon: "glyphicon glyphicon-triangle-right",
			levels:0,
			onNodeSelected:function(event, data){
				if(data.parent_id != undefined){
					wiatTable(data.node_id);
				}
			}
		});
	},"json")
	wiatTable(null);
})
function refresh(){
	$('#fm-table').bootstrapTable('refresh');
}
function wiatTable(value){
	$("#fm-table").bootstrapTable('destroy');
	$('#fm-table').bootstrapTable({
    	contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		url: "<%=path%>/income_teller_affirm_select.action?searchText2="+value+"",
		method:"post",
		dataType: "json",
		toolbar:'#toolbar',
		striped:true,//隔行变色
		clickToSelect:true,//是否选中
		cache:false,  //是否使用缓存
		showColumns:false,// 列
		pagination: true, //分页
		sortable: false, //是否启用排序
		singleSelect: false,
		search:false, //显示搜索框
		buttonsAlign: "right", //按钮对齐方式
		showRefresh:true,//是否显示刷新按钮
		sidePagination: "server", //客户端处理分页　服务端：server
		pageNumber:1,//启用插件时默认页数
		pageSize:5,//启用插件是默认每页的数据条数
		pageList:[5, 10, 15, 20],//自定义每页的数量
		undefinedText:'--',
		uniqueId: "year_id", //每一行的唯一标识，一般为主键列
		queryParamsType:'',
		showPaginationSwitch:true,//隐藏分页
		searchAlign:'right',//搜索栏位置
		paginationPreText:'上一页',
		paginationNextText:'下一页',
		height:590,
		maintainSelected:true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项。
        columns: [{
            field: 'income_name',
            title: '账单标题',
            align: 'center',
            formatter:function(value,row,index){
               	var e = '<a href="#"  onclick="look(\''+row.income_id+'\')">'+value+'</a>';
                return e;
            }
        },{
            field: 'gathering_name',
            title: '收款人',
            align: 'center'
        }, {
            field: 'payment_name',
            title: '付款人',
            align: 'center'
        }, {
            field: 'expenditure_remark',
            title: '描述',
            align: 'center'
        },{
            field: 'create_date',
            title: '创建时间',
            align: 'center'
        },{
            field: 'income_state',
            title: '状态',
            align: 'center',
            formatter:function(value,row,index){
               	var e = '已确认出纳';
                return e;
            }
        }],
        queryParams: function queryParams(params) {  
            var param = {
                pageNumber: params.pageNumber,    
                pageSize: params.pageSize,
                searchText:$("#bill_title").val() ,/* 设置搜索框要搜索的属性名称 */ 
                searchText1:$("#user_name").val()
            }; 
            return param;
        }
    })
}
//跳转
function toPage() {
    var pageNum = $("#pageNum").val();
    if (pageNum) {
        $('#fm-table').bootstrapTable('selectPage', parseInt(pageNum));
    }
}
//查看详细
function look(value){
	$("#myLook").modal("show");
	$.post("<%=path%>/update_income_list.action",{income_id:value},function(data){
		$("#income_name").text(data.income_name);
		$("#income_projects").text(data.income_projects);
		$("#course_name").text(data.course_name);
		$("#payment_name").text(data.payment_name);
		$("#payment_unit").text(data.payment_unit);
		$("#payment_accountNum").text(data.payment_accountNum);
		$("#gathering_accountNum").text(data.gathering_accountNum);
		$("#deal_type").text(data.deal_type);
		$("#payment_accountNum").text(data.payment_accountNum);
		$("#receipts_money").text(data.receipts_money);
		$("#payment_money").text(data.payment_money);
		$("#expenditure_remark").text(data.expenditure_remark);
		$("#Income_evidence").text(data.income_evidence);
		$("#create_date").text(data.create_date);
		$("#gathering_name").text(data.gathering_name);
	},'json')
}
</script>
</html>