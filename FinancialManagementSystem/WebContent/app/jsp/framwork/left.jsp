<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<%
	String name = request.getContextPath();
%>
<link rel="stylesheet" href="<%=name%>/app/css/bootstrap.css">
<link rel="stylesheet" href="<%=name%>/app/css/bootstrap-treeview.css">
<script src="<%=name%>/app/js/jquery-3.2.1.js"></script>  
<script src="<%=name%>/app/js/bootstrap.js"></script>
<script src="<%=name%>/app/js/bootstrap-treeview.js"></script>
	<style type="text/css">
		*{
			margin:0;
			padding: 0;
		}
		ul,li,ol {list-style: none;}
		body{
			color:white;
			background:#5d6981; 
		}
		.box{
			width:210px;
			margin-left:15px;
		}
		.list-group{
			margin-bottom: 0px;
		}
	</style>
</head>
<body>
	<div style="border-top:30px solid #505e7b;"></div>
	<div class="box">
		<div id="accountTree" class="tree"></div>
		<div id="leaderTree" class="tree"></div>
		<div id="userTree" class="tree"></div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$("#accountTree").treeview({data:getAccountTree(),
		levels:0,
		backColor: "#5d6981" ,
		showBorder: false,
		onhoverColor:"#428bca",
		collapseIcon: "glyphicon glyphicon-triangle-bottom",
		expandIcon: "glyphicon glyphicon-triangle-right",
		onNodeSelected:function(event, data){ 
			skip(data.text,data.name);
		}
		});
	$("#leaderTree").treeview({data:getLeaderTree(),
		levels:0,
		backColor: "#5d6981" ,
		showBorder: false,
		onhoverColor:"#428bca",
		collapseIcon: "glyphicon glyphicon-triangle-bottom",
		expandIcon: "glyphicon glyphicon-triangle-right",
		onNodeSelected:function(event, data){ 
			skip(data.text,data.name);
		}
		});
	$("#userTree").treeview({data:getUserTree(),
		levels:0,
		showBorder: false,
		onhoverColor:"#428bca",
		backColor: "#5d6981" ,
		collapseIcon: "glyphicon glyphicon-triangle-bottom",
		expandIcon: "glyphicon glyphicon-triangle-right",
		onNodeSelected:function(event, data){ 
			skip(data.text,data.name);
		}
		});
})
 function getAccountTree(){
		var accountTree =[{
			text:"会计",
			nodes:[
			       {
			    	   text:"基本信息管理",
			    	   nodes:[
			    	          {
			    	        	  text:"年度管理",  
			    	        	  name:"accountant/basic_message_manage/year_manage"
			    	          },{
			    	        	  text:"账户管理",	
			    	        	  name:"accountant/basic_message_manage/account_manage"
			    	          },{
			    	        	  text:"用户管理",	
			    	        	  name:"accountant/basic_message_manage/user_manage"
			    	          }
			    	          ]
			       },{
			    	   text:"收入管理",
			    	   nodes:[{
			    		   text:"收入科目管理",
			    		   name:"accountant/income_manage/income_subject_manage"
			    	   },{
			    		   text:"收入",     
			    		   name:"accountant/income_manage/income"
			    	   },{
			    		   text:"待出纳确认",  
			    		   name:"accountant/income_manage/wait_teller_affirm_incom"
			    	   },{
			    		   text:"出纳已确认收入",  
			    		   name:"accountant/income_manage/teller_affirm_incom"
			    	   }
			    	          ]
			       },{
			    	   text:"支出管理",
			    	   nodes:[{
			    		   text:"支出科目管理",     
			    		   name:"accountant/expenditure_manage/pay_subject_manage"
			    	   },{
			    		   text:"支出",				
			    		   name:"accountant/expenditure_manage/pay"
			    	   },{
			    		   text:"待出纳确认",		
			    		   name:"accountant/expenditure_manage/wait_teller_affirm_pay"
			    	   },{
			    		   text:"出纳已确认支出",	
			    		   name:"accountant/expenditure_manage/teller_affirm_pay"
			    	   }
			    	         ]
			       },{
			    	   text:"查看报表",
			    	   nodes:[{
			    		   text:"收入报表",			
			    		   name:"accountant/examine_report/income_table"
			    	   },{
			    		   text:"支出报表",			
			    		   name:"accountant/examine_report/pay_table"
			    	   },{
			    		   text:"收支报表",			
			    		   name:"accountant/examine_report/income_and_pay_table"
			    	   },{
			    		   text:"预算报表",			
			    		   name:"accountant/examine_report/budget_table"
			    	   },{
			    		   text:"收入与预算报表",	
			    		   name:"accountant/examine_report/income_and_budget_table"
			    	   },{
			    		   text:"支出与预算报表",	
			    		   name:"accountant/examine_report/pay_and_budget_table"
			    	   }
			    	   ]
			       }
			       ]
		},{
			text:"出纳",
			nodes:[{
	    		   text:"科目外来源",			
	    		   name:"cashier/subject_out_source"
	    	   },{
	    		   text:"待确认收入",			
	    		   name:"cashier/wait_affirm_income"
	    	   },{
	    		   text:"待确认支出",			
	    		   name:"cashier/wait_affirm_pay"
	    	   },{
	    		   text:"已确认收入",			
	    		   name:"cashier/affirm_income"
	    	   },{
	    		   text:"已确认支出",			
	    		   name:"cashier/affirm_pay"
	    	   }]
		}];
		return accountTree;
	}
	/* {
				text:"审批设置",					
				name:"leader/check_set"
			}, */
	function getLeaderTree(){
		var leaderTree = [{
			text:"领导",
			nodes:[{
				text:"审批管理",					
				name:"leader/check_manage"
			},{
				text:"年预算管理",				
				name:"leader/year_budget_manage"
			},{
				text:"账户资金查看",				
				name:"leader/account_fund_look"
			},{
				text:"查看报表",					
				nodes:[{
					text:"收入报表",				
					name:"accountant/examine_report/income_table"
				},{
					text:"支出报表",				
					name:"accountant/examine_report/pay_table"
				},{
					text:"收支报表",				
					name:"accountant/examine_report/income_and_pay_table"
				},{
					text:"预算报表",				
					name:"accountant/examine_report/budget_table"
				},{
					text:"收入与预算报表",		
					name:"accountant/examine_report/income_and_budget_table"
				},{
					text:"支出与预算报表",		
					name:"accountant/examine_report/pay_and_budget_table"
				}]
			}]
		}];
		return leaderTree;
	}
	function getUserTree(){
		var userTree = [{
			text:"普通用户",
			nodes:[{
				text:"报销管理",
				nodes:[{
					text:"我的报销草稿",			
					name:"domestic_consumer/reimburse_manage/my_reimbursement_draft"
				},{
					text:"查看已提交的报销",		
					name:"domestic_consumer/reimburse_manage/look_submit_reimbursement"
				},{
					text:"查看未通过的报销",		
					name:"domestic_consumer/reimburse_manage/look_not_pass_reimbursement"
				},{
					text:"已报销查看",			
					name:"domestic_consumer/reimburse_manage/look_pass_reimbursement"
				}]
			},{
				text:"申购管理",
				nodes:[{
					text:"我的申购草稿",			
					name:"domestic_consumer/purchase_manage/my_subscribe_draft"
				},{
					text:"查看已提交的申购",	
					name:"domestic_consumer/purchase_manage/look_submit_subscribe"
				},{
					text:"查看未通过的申购",		
					name:"domestic_consumer/purchase_manage/look_not_pass_subscribe"
				},{
					text:"已申购查看",		
					name:"domestic_consumer/purchase_manage/look_pass_subscribe"
				},{
					text:"申购转报销",			
					name:"domestic_consumer/purchase_manage/subscribe_to_reimbursement"
				}]
			}]
			}];
		return userTree;
	}
	function skip(text,name){
		if(name != undefined){
			window.top.center.location = "<%=name%>/app/jsp/user_operate/"+name+".jsp";
		}
	}
</script>
</html>