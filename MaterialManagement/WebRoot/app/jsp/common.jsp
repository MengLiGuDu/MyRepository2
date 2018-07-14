<%@ page import="java.util.*"%>
<%
	String projectName = request.getContextPath();
	String PN = projectName;
	String rootUrl = "http://"+request.getServerName()+":"+request.getServerPort();
	Object userPosition = session.getAttribute("position");
%>
<link rel="stylesheet" href="<%=PN%>/app/css/bootstrap.css" />
<link rel="stylesheet" href="<%=PN%>/app/css/bootstrap-table.css">
<link rel="stylesheet" href="<%=PN%>/app/css/bootstrap-editable.css">
<link rel="stylesheet" href="<%=PN%>/app/css/bootstrapValidator.css">
<script type="text/javascript" src="<%=PN%>/app/js/jquery-3.2.1.js" ></script>
<script type="text/javascript" src="<%=PN%>/app/js/bootstrap.js" ></script>
<script type="text/javascript" src="<%=PN%>/app/js/echarts.js" ></script>
<script type="text/javascript" src="<%=PN%>/app/js/bootstrap-table.js"></script>
<script type="text/javascript" src="<%=PN%>/app/js/bootstrap-editable.js" ></script>
<script type="text/javascript" src="<%=PN%>/app/js/bootstrap-table-editable.js" ></script>
<script type="text/javascript" src="<%=PN%>/app/js/bootstrap-typeahead.js" ></script>
<script type="text/javascript" src="<%=PN%>/app/js/bootstrap-treeview.js" ></script>
<script type="text/javascript" src="<%=PN%>/app/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="<%=PN%>/app/js/bootstrapValidator.js"></script>
