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
		function readURL(input){
			
			console.debug(input);
			console.debug(input.files);
			
			if(input.files && input.files[0]){
				$("#tdImg").html("<img id='preview' src='#' width=200 height=200 />");
				var reader = new FileReader();
				
				//지정한 <img>태그에 첫번째 파일 input에 첨부한 파일에  대한 File객체의 내용을 읽어 들임.
				reader.readAsDataURL(input.files[0]);
				
				//파일의 모두 읽어 들였다면
				reader.onload = function(ProgressEvent){
					
					console.debug(ProgressEvent);
					
					$('#preview').attr('src',ProgressEvent.target.result);
				}
			}
		}
		
		function backToList(obj){ //아래의 <form>요소전체가 매개변수로 넘어온다.
			 
			 obj.action = "${contextPath}/board/listArticles.do";
			 obj.submit(); //<form>태그를 이용해 BoardController서블릿으로 전체글을 검색해줘~요청함.
		 }
	</script>
</head>
<body>

<!-- 대가리 --> 
<jsp:include page="../inc/header.jsp"/>

<br><br><br>
<div class="container">
<form action="${contextPath}/mypage/reviewWritePro.do" align="center" color="blue" method="post" enctype="multipart/form-data">
<h1>리뷰 글쓰기</h1>
<p>여행객들의 리뷰를 적는 게시판 입니다.</p>

    <hr>
    <div>
    <label for="id" ><b>작성자</b></label>
    <input type="text" id="id" name="id" value="${sessionScope.id}" readonly>
	</div>
	<div>
	<label for="image" ><b>이미지</b></label>
    <input type="file" id="image" name="image" onchange="readURL(this);">
    </div>
    <div id="tdImg">
	</div>
	<div>
    <label for="title"><b>제목</b></label>
    <input type="text" id="title" placeholder="제목을 입력하세요." name="title" rows="5" cols="5" required>
	</div>
	<div>
    <label for="content"><b>글내용</b></label>
    <textarea id="content" placeholder="내용을 입력하세요." name="content" required></textarea>
	</div>
	
    <div class="clearfix">
      <button type="button" class="cancelbtn" onclick="location.href='${contextPath}/mypage/review.do'">돌아가기</button>
      <button type="submit" class="signupbtn">글쓰기</button>
    </div>
    
  </div>
</form>



<!-- 밑바닥 -->
<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>
</html>


