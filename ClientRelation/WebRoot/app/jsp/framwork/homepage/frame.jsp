<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>framework</title>
</head>
	<frameset rows="15%, *" frameborder="no">
		<frame src="<%=PATH%>/toTopView.action?user=${user}" name="top">
		<frameset cols="15%, *">
			<frame src="<%=PATH%>/toLeftView.action" name="left">
			<frame src="<%=PATH%>/app/jsp/framwork/homepage/right.jsp" name="right">
		</frameset>
	</frameset>
</html>