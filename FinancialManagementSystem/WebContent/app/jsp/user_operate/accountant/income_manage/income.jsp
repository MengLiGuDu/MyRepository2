<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<% String path = request.getContextPath();%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>收入页面</title>
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=path %>/app/css/bootstrap-table.css" />
		
		<script type="text/javascript" src="<%=path %>/app/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap.js" ></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table.js" ></script>
		<script type="text/javascript" src="<%=path %>/app/js/bootstrap-table-zh-CN.js" ></script>
		
		<script type="text/javascript" src="<%=path %>/app/js/classie.js" ></script>
		<script type="text/javascript" src="<%=path %>/app/js/modalEffects.js" ></script>
		<style type="text/css">
			*{
				margin: 0px;
				padding: 0px;
			}
			.box{
			    margin-bottom: 10px;
		        margin-left: 90px;
			}
			.box label{
			    font-size: 17px;
			    height: 25px;
			    line-height: 25px;
			    width: 150px;
			}
			.title{
				width: 1228px;
				height: 60px;
				font-size: 30px;
				color: red;
				line-height: 60px;
				padding-left: 15px;
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
		<div class="line_div"><label>收入管理</label></div>
		<div class="modal fade" id="myMod">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
					    	<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					    </button>
						<h4 class="modal-title">添加收款单:</h4>
					</div>
					<form id="fm_form" method="post">
						<div class="modal-body">
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">账单标题:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="income_name" id="income_name">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">收入项目:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="income_projects" id="income_projects">
								</div>
							</div>
							<div class="box" style="display: inline-block;">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">科目名称:</label>
								<div class="input-group">
									<select name="course_id" id="course_id" style="width: 130px;height: 30px;">
									</select>
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">付款人:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="payment_name" id="payment_name">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">付款单位:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="payment_unit" id="payment_unit">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">付款账号:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="payment_accountNum" id="payment_accountNum">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">收款账号:</label>
								<div class="input-group" id="accountNum">
									<select	id="gathering_accountNum" name="gathering_accountNum"  style="width: 130px;height: 30px;">
									</select>
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">交易方式:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="deal_type" id="deal_type">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">应缴总金额:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="receipts_money" id="receipts_money">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">缴纳总金额:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="payment_money" id="payment_money">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">备注:</label>
								<div class="input-group">
									<textarea rows="4" cols="40" name="expenditure_remark" id="expenditure_remark" style="resize: none;"></textarea>
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">收入凭证编号:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="Income_evidence" id="Income_evidence">
								</div>
							</div>
							<div class="modal-footer">
								<button class="addIncome btn btn-primary "  data-dismiss="modal">保存</button>
								<button class="btn btn-default" data-dismiss="modal">关闭</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 修改 -->
		<div class="modal fade" id="update">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
					    	<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					    </button>
						<h4 class="modal-title">修改收款单:</h4>
					</div>
					<form id="update_form" method="post">
						<div class="modal-body">
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">账单标题:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="income_name" id="update_income_name">
									<input type="text" name="income_id" id="income_id" style="display: none;">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">收入项目:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="income_projects" id="update_income_projects">
								</div>
							</div>
							<div class="box" style="display: inline-block;">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">科目名称:</label>
								<div class="input-group">
									<select name="course_id" id="update_course_id" style="width: 130px;height: 30px;">
									</select>
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">付款人:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="payment_name" id="update_payment_name">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">付款单位:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="payment_unit" id="update_payment_unit">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">付款账号:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="payment_accountNum" id="update_payment_accountNum">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">收款账号:</label>
								<div class="input-group" id="accountNum">
									<select	id="update_gathering_accountNum" name="gathering_accountNum"  style="width: 130px;height: 30px;">
									</select>
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">交易方式:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="deal_type" id="update_deal_type">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">应缴总金额:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="receipts_money" id="update_receipts_money">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">缴纳总金额:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="payment_money" id="update_payment_money">
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">备注:</label>
								<div class="input-group">
									<textarea rows="4" cols="40" name="expenditure_remark" id="update_expenditure_remark" style="resize: none;"></textarea>
								</div>
							</div>
							<div class="box">
								<label class="col-xs-2  control-label" style="height: 35px;line-height: 35px">收入凭证编号:</label>
								<div class="input-group">
									<input type="text" class="form-control" name="Income_evidence" id="update_Income_evidence">
								</div>
							</div>
							<div class="modal-footer">
								<button id="updateIncome" class="btn btn-primary "  data-dismiss="modal">保存</button>
								<button class="btn btn-default" data-dismiss="modal">关闭</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 明细 -->
		
		
	<div id="toolbar" class="btn-group">
		<div style="width:100px;float:left;">
			<button class="btn btn-default" data-toggle="modal" data-target="#myMod" onclick="addIncome()">
				<span class="glyphicon glyphicon-plus"></span>添加
			</button>
		</div>
    </div>
	<div class="panel panel-default" style="width:92%;margin:0 auto;">  
		<div class="panel-body">
			<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>
		</div>  
	</div>
	</body>
	<script type="text/javascript">
		$(function () {
			initTable();
			function initTable(){
			    $('#test-table').bootstrapTable({
			        method: 'post',
			         toolbar: '#toolbar',    //工具按钮用哪个容器 
			        url: '<%=request.getContextPath()%>/income_list.action',//这个接口需要处理bootstrap table传递的固定参数 
			        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
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
			        strictSearch: true,
			        showRefresh: true,     //是否显示刷新按钮
			        clickToSelect: true,    //是否启用点击选中行
			        searchOnEnterKey: true,
			       
			        columns: [{field: 'income_name', title: '账单标题',align: 'center'},
			                  {field: 'gathering_accountNum',title: '收款账号',align: 'center'},
			                  {field: 'course_name', title: '所属科目',align: 'center'},
			                  {field: 'payment_money',title: '总金额',align: 'center'},
			                  {field: 'payment_name',title: '付款人',align: 'center'},
			                  {field: 'expenditure_remark',title: '账单描述',align: 'center'},
			                  {field: 'create_date',title: '创建时间',align: 'center'},
			                  {title: '操作', field: 'user_id',align: 'center',
			                	  formatter:function(value,row,index){
			                		  var submit = '<button class="btn btn-default " onclick="submit(\''+ row.income_id +'\')">    <span class="glyphicon glyphicon-ok"></span>提交</button>';
			                		  var detail = '<button class="btn btn-success " onclick=""><span class="glyphicon glyphicon-search"></span>明细</button>';
			                		  var update = '<button class="btn btn-info    " onclick="update(\''+ row.income_id +'\')" data-toggle="modal" data-target="#update"><span class="glyphicon glyphicon-edit "></span>修改</button>';
			                		  var remove = '<button class="btn btn-danger  " onclick="remove(\''+ row.income_id +'\')" ><span class="glyphicon glyphicon-trash"></span>删除</button>';
			                		  return submit+detail+update+remove;
			                	  }
			              	   }],
			        		   pagination:true
		    		}); 
				}
			$(".addIncome").click(function () {
				var formData = new FormData($("#fm_form")[0]);
				$.ajax({
					type:"post",
					url:"<%=request.getContextPath()%>/income_insert.action",
					dataType:"json",
					data:formData,
					async: true,       /*异步*/
		            cache: false,       /*  电脑高速缓存储存器 */
		            contentType: false,      /*   内容类型 */
		            processData: false,
					success:function (result){
						if (result == 1) {
			        		$("#test-table").bootstrapTable('refresh');
						}
					},
					error:function (){
						alert("添加失败!");
					}
				});
			})
		})
		$("#updateIncome").click(function () {
			var formData = new FormData($("#update_form")[0]);
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/income_update.action",
				dataType:"json",
				data:formData,
				async: true,       /*异步*/
	            cache: false,       /*  电脑高速缓存储存器 */
	            contentType: false,      /*   内容类型 */
	            processData: false,
				success:function (result){
	        		$("#test-table").bootstrapTable('refresh');
				},
				error:function (){
					alert("修改失败!");
				}
			});
		})
		//点击添加按钮
		function addIncome() {
			$.ajax({    
			    url: '<%=path%>/accoun_list.action', 
			    type:'POST', 
			    async: false,       /*异步*/
			    cache: false,       /*  电脑高速缓存储存器 */
			    contentType: false,      /*   内容类型 */
			    processData: false,       /*   过程  */
			    success: function (data) {    
			        var  str='';
			        str += '<option  value=""   >选择收款账号</option>';
			          
			        for (var i = 0; i < data.length; i++) {
					    var array_element = data[i];
					    str += '<option value ="'+array_element.account+'">'+array_element.account+'</option>';
					}
			        $("#gathering_accountNum").html(str)
			    },    
			    error: function (data) {    
			        alert("添加失败")
			    }    
			});
			$.ajax({    
			    url: '<%=path%>/course_name_list.action', 
			    type:'POST', 
			    async: false,       /*异步*/
			    cache: false,       /*  电脑高速缓存储存器 */
			    contentType: false,      /*   内容类型 */
			    processData: false,       /*   过程  */
			    success: function (data) {    
			        var  str='';
			        str += '<option  value=""   >选择科目名称</option>';
			          
			        for (var i = 0; i < data.length; i++) {
					    var array_element = data[i];
					    str += '<option value ="'+array_element.course_id+'">'+array_element.course_name+'</option>';
					}
			        $("#course_id").html(str)
			    },    
			    error: function (data) {    
			        alert("添加失败")
			    }    
			})
		}
		
		//修改
		function update(income_id) {
			var course_id;//科目ID
			var gathering_accountNum;//收款账号
			$.ajax({
		    	type:"post",
				url:"<%=path%>/update_income_list.action",
				dataType:"json",
				data:{
					income_id:income_id
				},
				success:function (result){
					gathering_accountNum = result.gathering_accountNum;
					course_id = result.course_id;
					console.log("----------------------------"+result.Income_evidence);
					
					$("#income_id").val(result.income_id);
					$("#update_income_name").val(result.income_name);
					$("#update_income_projects").val(result.income_projects);
					$("#update_course_id").val(result.course_id);
					$("#update_payment_name").val(result.payment_name);
					$("#update_payment_unit").val(result.payment_unit);
					$("#update_payment_accountNum").val(result.payment_accountNum);
					$("#update_gathering_accountNum").val(result.gathering_accountNum);
					$("#update_deal_type").val(result.deal_type);
					$("#update_payment_accountNum").val(result.payment_accountNum);
					$("#update_receipts_money").val(result.receipts_money);
					$("#update_payment_money").val(result.payment_money);
					$("#update_expenditure_remark").val(result.expenditure_remark);
					$("#update_Income_evidence").val(result.income_evidence);
					common(course_id,gathering_accountNum);
				},
		    });
		}
		
		
		
		function common(course_id,gathering_accountNum) {
			//插入数据
			//收款账号
			$.ajax({    
			    url: '<%=path%>/accoun_list.action', 
			    type:'POST', 
			    async: false,       /*异步*/
			    cache: false,       /*  电脑高速缓存储存器 */
			    contentType: false,      /*   内容类型 */
			    processData: false,       /*   过程  */
			    success: function (data) {    
			        var  str='';
			        str += '<option  value=""   >付款账号</option>';
			          
			        for (var i = 0; i < data.length; i++) {
					    var array_element = data[i];
					    
					    /* if (course_id == array_element.account) {
					    	str += '<option value ="'+array_element.account+'" selected="selected">'+array_element.account+'</option>';
						} else {
						    str += '<option value ="'+array_element.account+'">'+array_element.account+'</option>';
						} */
					    str += '<option value ="'+array_element.account+'">'+array_element.account+'</option>';
					}
			        $("#update_gathering_accountNum").html(str);
			    },    
			    error: function (data) {    
			        alert("添加失败")
			    }    
			});
			//科目ID
			$.ajax({    
			    url: '<%=path%>/course_name_list.action', 
			    type:'POST', 
			    async: false,       /*异步*/
			    cache: false,       /*  电脑高速缓存储存器 */
			    contentType: false,      /*   内容类型 */
			    processData: false,       /*   过程  */
			    success: function (data) {    
			        var  str='';
			        str += '<option  value=""   >科目名称</option>';
			          
			        for (var i = 0; i < data.length; i++) {
					    var array_element = data[i];
					    str += '<option value ="'+array_element.course_id+'">'+array_element.course_name+'</option>';
					}
			        $("#update_course_id").html(str)
			    },    
			    error: function (data) {    
			        alert("添加失败")
			    }    
			});
		}
		
		
		//删除
		function remove(income_id) {
			$.post("<%=request.getContextPath()%>/income_delete.action", { income_id:income_id}, function(data){
        		$("#test-table").bootstrapTable('refresh');
			},'json');
		}
		//点击提交
		function submit(income_id) {
			$.post("<%=request.getContextPath()%>/update_income_state.action", { income_id:income_id}, function(data){
				if (date = 1) {
	        		$("#test-table").bootstrapTable('refresh');
				}
			},'json');
		}
	</script>
</html>