<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<frameset rows="15%,*" frameborder="no">
		<frame src="<%=path%>/app/jsp/framwork/head.jsp" name="head">
		<frameset cols="225px,*" frameborder="no">
			<frame src="<%=path%>/app/jsp/framwork/left.jsp" name="left">
			<frame src="<%=path%>/app/jsp/framwork/center.jsp" name="center">
		</frameset>
	</frameset>
</html>