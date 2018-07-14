<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<frameset rows="10%,*"   border="0">	<!-- frameborder="no" -->
	<frame src="<%=request.getContextPath()%>/app/jsp/framwork/top.jsp" name="top" >
	<frameset cols="11%,*" border="0">
		<frame src="<%=request.getContextPath()%>/app/jsp/framwork/left.jsp" name="left">
		<frame src="<%=request.getContextPath()%>/app/jsp/framwork/right.jsp" name="right">
	</frameset>
</frameset>
</html>