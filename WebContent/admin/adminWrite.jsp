<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="../inc/header.jsp"/>

<head>
<meta charset="UTF-8">
<title>글쓰기</title>


</head>

<body>
<h1 style="text-align:center">새 글 쓰기</h1>
<form name="articleForm" method="post" action="${contextPath}/adm/adminWritePro.do" >

<table border="0" align="center">
<tr>
<td>
	<input type="hidden" name="id" value="${sessionScope.id}"/>
</td>
</tr>
<tr>
	<td align="right">글제목: </td>
	<td colspan="2"><input type="text" size="66" maxlength="500" name="title"/></td>
</tr>
<tr>
	<td align="right" valign="top"><br>글내용:</br> </td>
	<td colspan="2"><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea></td>
</tr>
<tr>
	<td align="right"></td>
	<td colspan="2">
	<input type="submit" value="글쓰기"/>
	<input type=button value="목록보기" onclick="location.href='${contextPath}/adm/adminlist.do';"/>
	</td>
</tr>
</table>
</form>
</body>
<jsp:include page="../inc/footer.jsp"/>

</html>