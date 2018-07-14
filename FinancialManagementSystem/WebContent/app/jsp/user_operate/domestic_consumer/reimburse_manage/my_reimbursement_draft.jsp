<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String path = request.getContextPath();%>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link rel="stylesheet" type="text/css"  href="<%=path %>/app/css/bootstrap.css">  
	<link rel="stylesheet" type="text/css"  href="<%=path %>/app/css/bootstrap-table.css"  >
	<link href="<%=path %>/app/css/bootstrap-treeview.css" rel="stylesheet">
	
	<script type="text/javascript" src="<%=path %>/app/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%=path %>/app/js/bootstrap.js"></script>  
	<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table.js"></script>  
	<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript" src="<%=path %>/app/js/bootstrap-treeview.js"></script>  	

	 
	<title>我的报销草稿</title>
	<style type="text/css">
	
		
		.add_button{
			width: 80px;
			height: 40px;
			background: #5BC0DE;
			color:white;
			left:20px;
			top:70px;
			z-index: 10;
			font-size: 20px;
			text-align: center;
			line-height: 40px;
			border-radius:10px ;
		}
		.add_subject{
		
			width: 400px;
			height: 400px;
			background: #C1C1C1;
			position:absolute;
			top:180px;
			left:400px;
			z-index: 12;
		
		}
		
		 
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
			width:350px;
			height:150px;
			margin-left:115px;
		}
		.tab_operate_two{
				
			width:370px;
			height:400px;
			margin-left:115px;
			
		}
		.line_div{
				font-size:18px;
				font-family: '楷体';
				color: red;
				width: 95%;
				margin: 2% auto;
				border-bottom: 1.5px solid black;
		}
		 
	</style>
	
</head>
<body>
	<div style="border-top:30px solid #505e7b;"></div>
	<div class="line_div"><label>我的报销草稿</label></div>

	<div id="tree"  style="width:200px;float: left;margin-left: 40px;"></div>
	<div  style="float: left;width:75%;margin-left: 20px;">  
		
		<div style="width: 100px;float:left;">
		<div  class="add_button"   id="switchover_add_subject"  class="btn btn-info" style="width:160px;margin-left:10px;margin-top:10px;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span> 添加报销草稿</div>
			
		</div>
		 
	    <div class="panel panel-default"   >  
			<div class="panel-body"> 
			    <table id="table_server"    >  </table>  
		    </div>  
		</div>   
		<div class="modal" id="submit_my_draft_judge">
			<div class="modal-dialog modal-content"  style="width:200ox;height:150px;margin-top:200px; ">
				<table class="tab_operate">
					<tr>
						<td align="center"id="alert_font" colspan="2"style="font-family:'华文行楷';font-size:20px;">是否要提交草稿</td>
					</tr>
					<tr>
						<td align="center"><input   id="submit_my_draft_action"  type="button" class="btn btn-primary" style="width: 100px;" value="提交" /></td>
						<td align="center"><input   data-toggle="modal" data-target="#submit_my_draft_judge"    type="button" class="btn btn-info" style="width: 100px;" value="取消" ></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="modal" id="delete_my_draft_judge">
			<div class="modal-dialog modal-content"  style="width:200ox;height:150px;margin-top:200px; ">
				<table class="tab_operate">
					<tr>
						<td align="center"id="alert_font" colspan="2"style="font-family:'华文行楷';font-size:20px;">是否要删除草稿</td>
					</tr>
					<tr>
						<td align="center"><input   id="delete_my_draft_action"  type="button" class="btn btn-danger" style="width: 100px;" value="删除" /></td>
						<td align="center"><input   data-toggle="modal" data-target="#delete_my_draft_judge"    type="button" class="btn btn-info" style="width: 100px;" value="取消" ></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="modal" id="update_my_draft_judge">
			<div class="modal-dialog modal-content"  style="width:200ox;height:150px;margin-top:200px; ">
				<table class="tab_operate">
					<tr>
						<td align="center"id="alert_font" colspan="2"style="font-family:'华文行楷';font-size:20px;">确认修改</td>
					</tr>
					<tr>
						<td align="center"><input   id="update_my_draft_action"    data-toggle="modal" data-target="#update_my_draft_judge" type="button" class="btn btn-danger" style="width: 100px;" value="确认" /></td>
						<td align="center"><input   data-toggle="modal" data-target="#update_my_draft_judge"    type="button" class="btn btn-info" style="width: 100px;" value="取消" ></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-content">
			<form id="for_form"   method="post" class="form-group">
			<table class="tab_operate_two">
				<tr align="center">
					<td colspan="2" style="font-family: '华文楷体';font-size: 35px"><b id="title_b"></b></td>
				</tr>
				<tr>
					<td align="right" width="150"><label>父科:</label></td>
					<td align="left">
						<div class="input-group" style="width:250px;opacity:0.8;">
					 		<select id="course_id"  name="course_id"  style="width:200px;height:30px;  "  >
				 				
							</select>
				 		</div>
			 		</td>
				</tr>
				<tr>
					<td align="right" width="120"><label>主题:</label></td>
					<td align="left">
						<div class="input-group"   style="width:250px;opacity:0.8;">
					 		<input  id="reimburse_title" type="text" class="reimburse_title"  name="reimburse_title"  style="width:250px;"   maxlength="15" id="year_beginDate" />
				 		</div>
			 		</td>
				</tr>
				<tr>
					<td align="right" width="120"><label>内容:</label></td>
					<td align="left">
						<div class="form-group"  style="width:250px;opacity:0.8;" >
 					    	<input  id="reimburse_matter" type="text" class="reimburse_matter"  name="reimburse_matter"  style="width:250px;"   maxlength="15" id="year_beginDate" />
 						</div>
			 		</td>
				</tr>
				<tr>
					<td align="right" width="120"><label>金额:</label></td>
					<td align="left">
						<div class="form-group"  style="width:250px;opacity:0.8;" >
 					        <input  id="reimburse_money" type="text" class="form-control"  name="reimburse_money"   onkeyup="num(this)" style="width:250px;"   maxlength="15" id="year_beginDate" />
 						</div>
				 		<input style="display: none" id="option">
			 		</td>
				</tr>
				<tr>
					<td align="center"><input   type="button"  data-toggle="modal" data-target="#myModal"   class="btn btn-default" style="width: 100px;" value="取 消" ></td>
					<td align="right"><input id="sub" type="button"   class="btn btn-info" style="width: 100px;" value="提 交" /></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>


<script type="text/javascript">


	 
	/*全局二级科目id*/
	var  global_two_subject_parameter_node_id;

	/*当前的行*/
	var curRow;
 

	/*input只能输入数字和两位小数*/
	function num(obj){
		obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
		obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字
		obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个, 清除多余的
		obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
		obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数
	}



	renewal_tree();
	/*刷新树*/
	function renewal_tree(){
		$.ajax({    
		    url: '<%=path%>/subscribeDraft_tree.action', 
		    type:'POST', 
		    async: false,       /*异步*/
		    cache: false,       /*  电脑高速缓存储存器 */
		    contentType: false,      /*   内容类型 */
		    processData: false,       /*   过程  */
		    success: function (data){
		    	 $('#tree').treeview({
		             data:data,           // 数据源
		             collapseIcon:"glyphicon glyphicon-triangle-bottom",
		    		 expandIcon: "glyphicon glyphicon-triangle-right",
		    		 levels:0,
		             onNodeSelected: function (event, data) {
		                /*点击树赋值给全局变量*/ 
		             	if(  data.parent_id == undefined ){
		             		global_two_subject_parameter_node_id=null;
		             	}else{
		             		global_two_subject_parameter_node_id=data.node_id;
		             	}
		             	$("#table_server").bootstrapTable('refresh');
		             }
		         });
		    }  
		})
	}
	


	
	/*  时间转换*/
	function formateDate(strTime, format, needMap) {
	    strTime = Number(strTime);
	    format = format || 'Y-M-D H:I:S';
	    var date = new Date(strTime);
	    var dateMap = {
	        y: (date.getFullYear()+'').slice(2),
	        Y: date.getFullYear(),
	        M: date.getMonth() + 1,
	        D: date.getDate(),
	        h: date.getHours()%12,
	        H: date.getHours(),
	        i: date.getMinutes(),
	        s: date.getSeconds(),
	        I: date.getMinutes() > 9 ? date.getMinutes() : ('0' + date.getMinutes()),
	        S: date.getSeconds() > 9 ? date.getSeconds() : ('0' + date.getSeconds()),
	        A: date.getHours() >= 12 ? 'pm' : 'am',
	        w: date.getDay(),
	        W: ['日','一','二','三','四','五','六'][date.getDay()]
	    };
	    for (var k in dateMap) {
	        format = format.replace(new RegExp(k, 'g'), dateMap[k]);
	    }
	    if (needMap) {
	        return dateMap;
	    }
	    return format;
	}
	
 		
 	$(function (){
 	    
 		/*点击添加*/
 		$("#switchover_add_subject").click(function (){
 		   var   list_say;
 		   $.ajax({    
			    url: '<%=path%>/all_two_say_subject.action', 
			    type:'POST', 
			    async: false,       /*异步*/
			    cache: false,       /*  电脑高速缓存储存器 */
			    contentType: false,      /*   内容类型 */
			    processData: false,       /*   过程  */
			    success: function (data) {
			    	list_say=data;
			    },    
			    error: function (data) {    
			        alert("添加失败")
			    }    
			})
			var  str='';
	        for (var i = 0; i < list_say.length; i++) {
			    var array_element = list_say[i];
				str += '<option value ="'+array_element.course_id+'" >'+array_element.course_name+'</option>';
			}
	        $("#course_id").html(str)
 			$("#for_form")[0].reset();
 			$("#title_b").text("添加报销");
 			$("#option").val("add");
 			
 		})
 		
 		
 		/*表格数据*/
 	    $("#table_server").bootstrapTable({
 		    url: '<%=path%>/my_reimbursement_draft_paging.action',  
	        method: 'post',  
	        contentType:"application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的数据编码类型
			dataType: "json",
			striped:true,//隔行变色
			clickToSelect:true,//是否选中
			cache:false,  //是否使用缓存
			showColumns:false,// 列
			pagination: true, //分页
			sortable: false, //是否启用排序
			singleSelect: false,
			search:true, //显示搜索框
			buttonsAlign: "right", //按钮对齐方式
			showRefresh:true,//是否显示刷新按钮
			sidePagination: "server", //客户端处理分页　服务端：server
			pageNumber:1,//启用插件时默认页数
			pageSize:5,//启用插件是默认每页的数据条数
			pageList:[5, 10, 15, 20],//自定义每页的数量
			undefinedText:'--',
			uniqueId: "course_id", //每一行的唯一标识，一般为主键列
			queryParamsType:'',
			showPaginationSwitch:true,//隐藏分页
			searchAlign:'right',//搜索栏位置
			paginationPreText:'上一页',
			paginationNextText:'下一页',
			height:580,
			maintainSelected:true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项。
			queryParams: function (params) {//自定义参数，这里的参数是传给后台的，我这是是分页用的  
	        	return {					//这里的params是table提供的  
	        		pageNumber: params.pageNumber,	//从数据库第几条记录开始  
	        		pageSize: params.pageSize,	    //找多少条  
	        		searchText:params.searchText,
	        		searchText1:global_two_subject_parameter_node_id
	            };
	          
	        }, 
	        columns: [  
		        {  
				    title: '序号',//标题  可不加  
				    align: 'center',
				    formatter: function (value, row, index) {  
				        return index+1;  
				    }  ,
				    width:30
				},      
				{title: '报销主题',field:'reimburse_title',align: 'center',width:50,},
				{title: '科目名称',field:'course_name',align: 'center',width:100,},
				{title: '报销人',field:'user_name',align: 'center',width:100,},
				{title: '报销金额',field:'reimburse_money',align: 'center',width:50,},
				{title: '报销时间',field:'reimburse_date',align: 'center',width:100,
					formatter: function (value, row, index) {
	            		value = formateDate(value, 'Y-M-D H:i:s');
	                    return     value ;
	                }
				},
				{
		            field: 'budget_id',
		            title: '操作',
		            align: 'center',
		            width:250,
		            formatter:function(value,row,index){
		               	var a = '<button  class="btn btn-primary"    id="'+value+'"    ><span class="glyphicon glyphicon-search"></span>明细</button> ';
		               	var b = '<button  class="btn btn-success"    id="'+value+'"   data-toggle="modal" data-target="#submit_my_draft_judge" ><span class="glyphicon glyphicon-ok"></span> 提交</button> ';
		               	var c = '<button  class="btn btn-info" "    id="'+value+'"   data-toggle="modal" data-target="#update_my_draft_judge"  ><span class="glyphicon glyphicon-edit"></span> 修改</button> ';
		                var d = '<button  class="btn btn-danger"     id="'+value+'"   data-toggle="modal" data-target="#delete_my_draft_judge" ><span class="glyphicon glyphicon-trash"></span> 删除</button> ';
		                return a+b+c+d;
		            }
		        }
			],
			/*点击行触发的事件*/
		    onClickRow:function (row, $element){
	            curRow = row;
	          //  console.log(curRow)
	        },
 		}); 	 
 	})
 	
 	
 	
 	
 	
 	function edit(a){
 		
 		//var index=$(a).attr("id");
 		
 		console.log(a)
 	}
 	
 	
 	
 	
 	$('#update_my_draft_action').click(function  (){
 		
 		
 		
 		var   list_say;
		    $.ajax({    
		     url: '<%=path%>/all_two_say_subject.action', 
		     type:'POST', 
		     async: false,       /*异步*/
		     cache: false,       /*  电脑高速缓存储存器 */
		     contentType: false,      /*   内容类型 */
		     processData: false,       /*   过程  */
		     success: function (data) {
		         list_say=data;
		     },    
		     error: function (data) {    
		         alert("添加失败")
		     }    
		})
		var  str='';
        for (var i = 0; i < list_say.length; i++) {
		    var array_element = list_say[i];
		    if( curRow.course_name == array_element.course_name){
				str += '<option  selected="selected"  value ="'+array_element.course_id+'" >'+array_element.course_name+'</option>';
		    }else{
		    	str += '<option value ="'+array_element.course_id+'" >'+array_element.course_name+'</option>';
		    }
		}
        $("#course_id").html(str)
			$("#title_b").text("修改报销");
			$("#option").val("update");
			$("#reimburse_title").val(curRow.reimburse_title);
			$("#reimburse_matter").val(curRow.reimburse_matter);
			$("#reimburse_money").val(curRow.reimburse_money);
		
			$("#myModal").modal("show");
		
 		
 		
 	})
 	
 	
 	
 	 	   	/*提交草稿*/
	$("#submit_my_draft_action").click(function (){
 		$("#submit_my_draft_judge").modal("hide");
 	   	var budget_id={"budget_id":curRow.budget_id};
 	   	$.ajax({    
			url: '<%=path%>/my_reimbursement_draft_submit.action', 
			type:'POST', 
			dataType: 'JSON',
			data:budget_id,
			async: true,       /*异步*/
			cache: false,       /*  电脑高速缓存储存器 */
			success: function (data) {
			    $("#table_server").bootstrapTable('refresh');
			},    
			error: function (data) {    
			    alert("提交失败")
			}    
 	    })
	})
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	/*删除动作*/
    $("#delete_my_draft_action").click(function (a){
   	    $("#delete_my_draft_judge").modal("hide"); 
   	 	var budget_id={"budget_id":curRow.budget_id};
   	    $.ajax({    
		    url: '<%=path%>/reimbursement_delate_one.action', 
			type:'POST', 
			dataType: 'JSON',
			data:budget_id,
			async: true,       /*异步*/
			cache: false,       /*  电脑高速缓存储存器 */
			success: function (data) {
			    $("#table_server").bootstrapTable('refresh');
			},    
			error: function (data) {    
			    alert("删除失败")
			}    
	    }) 
   	})
 	
 	
 
	$("#sub").click (function (){
		/*提交我的报销草稿*/
		if($("#option").val() == "add"){
			var formData = new FormData($("#for_form" )[0]);
		    $.ajax({    
			    url: '<%=path%>/my_reimbursement_draft_insert.action', 
			    type:'POST', 
			    data:formData,
			    async: true,       /*异步*/
			    cache: false,       /*  电脑高速缓存储存器 */
			    contentType: false,      /*   内容类型 */
			    processData: false,       /*   过程  */
			    success: function (data) {
			    	$("#table_server").bootstrapTable('refresh');
			    },    
			    error: function (data) {    
			        alert("添加失败")
			    }    
			})				 
			$("#myModal").modal("hide");
		}else{
			/*修改我的报销草稿*/
			var formData = new FormData($("#for_form" )[0]);
			formData.append("budget_id", curRow.budget_id);
			$.ajax({    
			    url: '<%=path%>/my_reimbursement_draft_update.action', 
			    type:'POST', 
			    data:formData,
			    async: true,       /*异步*/
			    cache: false,       /*  电脑高速缓存储存器 */
			    contentType: false,      /*   内容类型 */
			    processData: false,       /*   过程  */
			    success: function (data) {
			    	$("#table_server").bootstrapTable('refresh');
			    },    
			    error: function (data) {    
			        alert("添加失败")
			    }    
			})			
			$("#myModal").modal("hide");
		}
	})
 	

		

 

</script>
</html>