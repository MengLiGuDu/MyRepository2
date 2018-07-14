<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
	<frameset rows="20%,*" border="0">
		<frame src="<%=request.getContextPath()%>/app/jsp/user_manage/logistics/InventoryGérer.jsp" noresize="noresize">
		<frame src="<%=request.getContextPath()%>/app/jsp/user_manage/logistics/check/checkManage_below.jsp" noresize="noresize" name="check_below">
	</frameset>
</html>