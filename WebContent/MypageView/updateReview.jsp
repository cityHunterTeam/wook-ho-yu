<%@page import="Mypage.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	</script>
	
</head>
<body>

<!-- 대가리 --> 
<jsp:include page="../inc/header.jsp"/>

<br><br><br>
<div class="container">
<c:url var="url1" value="/mypage/updateReviewPro.do">
<c:param name="num" value="${num}"/>
</c:url>
<form action="${url1}" align="center" color="blue" method="post" enctype="multipart/form-data">
<p><h2>글 수정 페이지입니다.</h2></p>

    <hr>
    <div>
    <c:set var="vo" value="${vo}"/>
    <label for="id" ><b>작성자</b></label>
    <input type="text" id="id" name="id" value="${vo.id}" readonly>
	</div>
	<div>
	<label for="image" ><b>이미지</b></label>
	<img alt="" src="${contextPath}/upload/${vo.num}/${vo.image}" style="width: 360px;height:270pxs;">
    <input type="file" id="image" name="image" value="${contextPath}/upload/${vo.num}/${vo.image}">
    </div>
	<div>
    <label for="title"><b>제목</b></label>
    <input type="text" id="title" value="${vo.title}" name="title" rows="5" cols="5">
	</div>
	<div>
    <label for="content"><b>글내용</b></label>
    <textarea id="content" name="content">${vo.content}</textarea>
	</div>
	
    <div class="clearfix">
      <button type="button" class="cancelbtn" onclick="location.href='${contextPath}/mypage/review.do'">돌아가기</button>
      <button type="submit" class="signupbtn">수정하기</button>
    </div>
    
  </div>
</form>



<!-- 밑바닥 -->
<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>
</html>


