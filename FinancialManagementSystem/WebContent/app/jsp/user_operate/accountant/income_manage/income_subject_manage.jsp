<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String path = request.getContextPath();%>
<head>
 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link rel="stylesheet" type="text/css"  href="<%=path %>/app/css/bootstrap.css">  
	<link rel="stylesheet" type="text/css"  href="<%=path %>/app/css/bootstrap-table.css"  >
	
	<script type="text/javascript" src="<%=path %>/app/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%=path %>/app/js/bootstrap.js"></script>  
	<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table.js"></script>  
	<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table-zh-CN.js"></script>  	
	
	<title>收入科目管理页面</title>
	
	<style type="text/css">
	
	
		
		.add_subject{
		
			width: 400px;
			height: 400px;
			background: #C1C1C1;
			position:absolute;
			top:180px;
			left:400px;
			z-index: 12;
		
		}
		
		.title{
			width: 1228px;
			height: 60px;
			font-size: 30px;
			color: red;
			line-height: 60px;
			padding-left: 15px;
			
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
			width:370px;
			height:400px;
			margin-left:115px;
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
	<div class="line_div"><label>收入科目管理</label></div>
	<div style="width: 100px;float:left;">
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-content">
				<form id="fm_form"   method="post" class="form-group">
				<table class="tab_operate">
					<tr align="center">
						<td colspan="2" style="font-family: '华文楷体';font-size: 35px"><b id="title_b"></b></td>
					</tr>
					<tr>
						<td align="right" width="150"><label>收入父科目名称:</label></td>
						<td align="left">
							<div class="input-group" style="width:250px;opacity:0.8;">
						 		<select id="fatherCourse_id"  name="fatherCourse_id"  style="width:200px;height:30px;  "  >
									
								</select>
					 		</div>
					 		 <input style="display: none;"  id="update_course_id" name="update_course_id">
				 		</td>
					</tr>
					<tr>
						<td align="right" width="120"><label>收入科目名称:</label></td>
						<td align="left">
							<div class="input-group"   style="width:250px;opacity:0.8;">
						 		<input  id="course_name" type="text" class="form-control"  name="course_name"  style="width:250px;"   maxlength="15" id="year_beginDate" />
					 		</div>
				 		</td>
					</tr>
					<tr>
						<td align="right" width="120"><label>收入科目描述:</label></td>
						<td align="left">
							<div class="form-group"  style="width:250px;opacity:0.8;" >
  							    <textarea id="course_remark" name="course_remark" class="form-control" rows="3"></textarea>
  							</div>
					 		<input style="display: none" id="option">
				 		</td>
					</tr>
					<tr>
						<td align="center"><input id="exit" type="button" class="btn btn-default" style="width: 100px;" value="取 消" ></td>
						<td align="right"><input id="sub" type="button" class="btn btn-success" style="width: 100px;" value="提 交" /></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	
	 
	
	<div style="width:600px;"id="toolbar" >
		<div class="btn-group" style="float:left">
			<button id="switchover_add_subject"  class="btn btn-info" style="width: 80px;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span> 添加</button>
	    </div>
		<div style="float:right">
			 <span style="text-align: right;font-weight:bold;" >  请选择父科目: </span>
			<span> 
				<select id="select_one"  style="width:120px; " ></select>
		    </span>  
		</div>
    </div>
    <div class="panel panel-default"  style="width:92%;margin:0 auto;">  	   
		<div class="panel-body"> 
		    <table id="table_server"    >  </table>  
	    </div>  
	</div>   
	 
</body>


<script type="text/javascript">
	
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
 		
		 /*刷新选择的父科目列表*/	
		 refresh_select_date();
 		
 		/*刷新查询的下拉列表数据*/
 		function  refresh_select_date(){
 			$.ajax({    
			    url: '<%=path%>/select_parent_income_subject.action', 
			    type:'POST', 
			    async: true,       /*异步*/
			    cache: false,       /*  电脑高速缓存储存器 */
			    contentType: false,      /*   内容类型 */
			    processData: false,       /*   过程  */
			    success: function (data) {    
			        var  str='';
			        str += '<option  value=""   >请选择父科目</option>';
			        str += '<option  value=""   >全选</option>';
			        for (var i = 0; i < data.length; i++) {
					    var array_element = data[i];
						str += '<option value ="'+array_element.course_id+'" >'+array_element.course_name+'</option>';
					}
			        $("#select_one").html(str)
			    },    
			    error: function (data){    
			        alert("添加失败")
			    }    
			})
			
 		}
 		$("#select_one").change(function(){ 
 			$("#table_server").bootstrapTable('refresh');
		}) 
 		
 		
 		/*点击添加*/
 		$("#switchover_add_subject").click(function (){
 			$("#course_name").attr("value","");
 			$("#course_remark").text("");
 			
 	        $.ajax({    
			    url: '<%=path%>/select_parent_income_subject.action', 
			    type:'POST', 
			    async: true,       /*异步*/
			    cache: false,       /*  电脑高速缓存储存器 */
			    contentType: false,      /*   内容类型 */
			    processData: false,       /*   过程  */
			    success: function (data) {    
			        var  str='';
			        str += '<option  value=""   >请选择父科目</option>';
			        str += '<option  value=""   >父科目</option>';
			        for (var i = 0; i < data.length; i++) {
					    var array_element = data[i];
						str += '<option value ="'+array_element.course_id+'" >'+array_element.course_name+'</option>';
					}
			        $("#fatherCourse_id").html(str)
			    },    
			    error: function (data) {    
			        alert("添加失败")
			    }    
			})
 			
 			$("#fm_form")[0].reset();
 			$("#option").val("add");
 			$("#title_b").text("收入科目添加");
 			
 		})
 		
 		/*点击取消*/
 		$("#exit").click(function (){
 			$("#myModal").modal("hide");
 			$("#fm_form")[0].reset();
 		})
 		
 		/*点击提交*/
 		$("#sub").click (function (){
 			if($("#option").val() == "add"){
 				 var formData = new FormData($("#fm_form" )[0]);
			     $.ajax({    
			         url: '<%=path%>/income_subject_insert.action', 
			         type:'POST',    
			         data:formData, 
			         async: true,       /*异步*/
			         cache: false,       /*  电脑高速缓存储存器 */
			         contentType: false,      /*   内容类型 */
			         processData: false,       /*   过程  */
			         success: function (data) {
			        	 if(data == 1 ){
			        		 refresh_select_date();
			        		 $("#table_server").bootstrapTable('refresh');
			        	 }
			         },    
			         error: function (data) {    
			             alert("添加失败")
			         }    
			 	})
 			}else{
 				/*修改提交*/
 			    var formData = new FormData($("#fm_form" )[0]);
				$.ajax({    
		            url: '<%=path%>/income_subject_update.action', 
		            type:'POST',    
		            data:formData, 
		            async: true,       /*异步*/
		            cache: false,       /*  电脑高速缓存储存器 */
		            contentType: false,      /*   内容类型 */
		            processData: false,       /*   过程  */
		            success: function (data) {
			        	if(data ==1 ){
			        		refresh_select_date();
			        		$("#table_server").bootstrapTable('refresh');
			        	}
		        	},    
			        error: function (data) {    
			            alert("修改失败")
			        }    
			 	})
 			}
 			$("#myModal").modal("hide");
 		})
 		
 		/*表格数据*/
 	    $("#table_server").bootstrapTable({
 		    url: '<%=path%>/income_subject_list.action',  
	        method: 'post',  
	        contentType:"application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的数据编码类型
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
			uniqueId: "course_id", //每一行的唯一标识，一般为主键列
			queryParamsType:'',
			showPaginationSwitch:true,//隐藏分页
			searchAlign:'right',//搜索栏位置
			paginationPreText:'上一页',
			paginationNextText:'下一页',
			height:600,
			maintainSelected:true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项。
			queryParams: function (params) {//自定义参数，这里的参数是传给后台的，我这是是分页用的  
				console.log()
	        	return {					//这里的params是table提供的  
	        		pageNumber: params.pageNumber,	//从数据库第几条记录开始  
	        		pageSize: params.pageSize,	    //找多少条  
	        		searchText:params.searchText,
	        		searchText:$("#select_one").val()
	        		 
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
				{title: '父科目名',field:'fatherCourse_name',align: 'center',width:50,},
				{title: '科目名称',field:'course_name',align: 'center',width:100,},
				{title: '科目描述',field:'course_remark',align: 'center',width:100,},
				{title: '创建人',field:'create_name',align: 'center',width:100,},
				{title: '创建时间',field:'create_date',align: 'center',width:100,
					formatter: function (value, row, index) {
	            		value = formateDate(value, 'Y-M-D H:i:s');
	                    return     value ;
	                }
				},
				{
		            field: 'course_id',
		            title: '操作',
		            align: 'center',
		            width:200,
		            formatter:function(value,row,index){
		               	var e = '<button  class="update btn btn-info" id="'+value+'"   data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span> 修改</button> ';
		                var d = '<button  class="del btn btn-danger"  id="'+value+'"  ><span class="glyphicon glyphicon-trash"></span> 删除</button> ';
		                return e+d;
		            }
		        }
			],
			
			/*当远程数据成功加载时触发*/
			onLoadSuccess: function (aa,bb,cc){
				

		 		 
				
	        	 $(".del").click(function (a){
	        		 if(confirm("是否删除") == true ){//删除操作  
		     	   		var index=$(this).attr("id");
						var delete_data={"course_id":index};
		     	   		$.ajax({
		     	   		    async: false,       /*异步*/
		  			   		cache: false,       /*  电脑高速缓存储存器 */
		     	   		    type: 'POST',  
		     	        	data:delete_data,
		     	        	dataType: 'JSON',
		     	        	url:'<%=path%>/income_subject_delete_one.action',      
		     	            success:function(date){
		     	            	if(date == 1){
		     	            		refresh_select_date();
		     	            		$("#table_server").bootstrapTable('refresh');
		     	            	}else{
		     	            		//alert('删除失败');
		     	            	}
		     	            }
		     	        });
	     	   		}
	        	})
	        	/*点击修改*/
	        	$(".update").click(function (){
	        	    var course_id=$(this).attr("id");
	        		var select_data={"course_id":course_id};
	        		var incomeCourseBean;
	        		$.ajax({
	        			async: false,       /*异步*/
	  			   		cache: false,       /*  电脑高速缓存储存器 */
		     	   	    type: 'POST',  
		     	        data:select_data,
		     	        dataType: 'JSON',
		     	        url:'<%=path%>/select_one.action',      
		     	        success:function(date){
		     	        	incomeCourseBean = date[0];
		     	        }
		     	     });
	        		
	        		var  fatherCourse_name=incomeCourseBean.fatherCourse_name;
	        		
	        		/*填充修改的父选择下拉列表*/
	        		$.ajax({    
	    			    url: '<%=path%>/select_parent_income_subject.action', 
	    			    type:'POST', 
	    			    async: false,       /*异步*/
	    			    cache: false,       /*  电脑高速缓存储存器 */
	    			    contentType: false,      /*   内容类型 */
	    			    processData: false,       /*   过程  */
	    			    success: function (data) {    
	    			        var  str='';
	    			        str += '<option  value=""   >父科目</option>';
	    			          
	    			        for (var i = 0; i < data.length; i++) {
	    					    var array_element = data[i];
	    					    if( fatherCourse_name == array_element.course_name){
		    						str += '<option  selected="selected"  value ="'+array_element.course_id+'" >'+array_element.course_name+'</option>';
	    					    }else{
		    						str += '<option value ="'+array_element.course_id+'" >'+array_element.course_name+'</option>';
	    					    }
	    					}
	    			        $("#fatherCourse_id").html(str)
	    			    },    
	    			    error: function (data) {    
	    			        alert("添加失败")
	    			    }    
	    			})
	    			 
	        		$("#course_name").attr("value",incomeCourseBean.course_name);
	    			$("#course_remark").text(incomeCourseBean.course_remark);
	    			$("#update_course_id").attr("value",incomeCourseBean.course_id);
	        		
	    			$("#fm_form")[0].reset();
	     			$("#option").val("update");
	     			$("#title_b").text("收入科目修改");
	        	})
	        }
 		});  
 	})

		

 

</script>
</html>