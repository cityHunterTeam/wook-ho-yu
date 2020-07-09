<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 			String out = "<script>"
// 					+ "window.alert('결제가 완료되었습니다');"
// 					+ "</script>";
			response.getWriter().print("<script>window.alert('결제가 완료되었습니다');</script>");
%>
</body>
</html>