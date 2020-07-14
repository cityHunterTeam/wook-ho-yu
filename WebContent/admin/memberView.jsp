<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/join.css">
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:set var="vo" value="${vo}" />
	<form action="${contextPath}/adm/memberViewPro.do" method="post"
		style="border: 1px solid #ccc">
		<div class="container">
			<h1>회원정보 수정</h1>
			<hr>
			<label for="id"><b>Id</b></label> <input type="text"
				placeholder="Enter Id" name="id" value="${vo.id}" readonly>
			
			<label for="psw"><b>Password</b></label>
			 <input type="password" placeholder="Enter Password" name="passwd" value="${vo.passwd}"required> 
			<label for="name"><b>Name</b></label>
			<input type="text" placeholder="Enter Name" name="name" id="name" value="${vo.name}" required>
			<label for="birth"><b>Birth</b></label>
			<input type="text" placeholder="Enter Birth" name="birth" id="birth"value="${vo.birth}" required> 
			<label for="email"><b>Email</b></label>
			<input type="email" name="email" id="email" placeholder="Email" value="${vo.email}" required>
			 <label for="phone"><b>Phone</b></label>
			<input type="text" name="phone" id="phone" placeholder="Phone" value="${vo.phone}" required>
			 <label for="address"><b>Address</b></label>
			<input type="text" name="address" id="address" placeholder="Address"
				value="${vo.address}" required>
			<div class="clearfix">
			
				<button type="button" class="cancelbtn"
					onclick="location.href='${contextPath}/adm/delMembers.do">회원삭제</button>
				<button type="submit" class="signupbtn">회원정보 수정</button>
			</div>
		</div>
	</form>
</body>
</html>