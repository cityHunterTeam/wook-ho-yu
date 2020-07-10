<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/reset.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cls1 {
	text-decoration: none;
}

.cls2 {
	text-align: center;
	font-size: 30px;
}

a {
	text-align: center;
}

.seat {
	width: 40px;
	height: 30px;
}

.clicked {
	background-color: green;
	color: white;
}
</style>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>    

<jsp:include page="../inc/header.jsp"/>

<meta charset="UTF-8">
<title>글목록</title>
</head>
<body>
	<h2 style="text-align: center">결제정보</h2><br><br>
	<form action="${contextPath}/res/reserv2.do" method="post" style="border:1px solid #ccc">
	
	<table class="table table-hover text-center" style="width:50%; margin:auto">
				<tbody>
					<tr><td>고객 ID</td><td>${vo.reser_id}</td></tr>
					<tr><td>고객 Email</td><td>${vo.reser_email}</td></tr>
					<tr><td>기차종류</td><td>${vo.traingradename}</td></tr>  
					<tr><td>열차번호</td><td>${vo.trainno}</td></tr>
					<tr><td>출발시간</td><td><fmt:formatDate value="${vo.depplandtime}" pattern="yyyy-MM-dd kk:mm"/></td></tr>  
					<tr><td>출발지</td><td>${vo.depplacename}</td></tr>
					<tr><td>도착지</td><td>${vo.arrplacename}</td></tr>
					<tr><td>결제금액</td><td>${vo.adultcharge}</td></tr>
					<tr><td>결제좌석</td><td>${vo.seat}</td></tr>
				</tbody>
	</table>
    <br>
	<br>
	
	<div style="text-align:center">
	<button type="submit" class="btn btn-warning">카카오 페이 결제</button>
	</div>
</form>	
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>