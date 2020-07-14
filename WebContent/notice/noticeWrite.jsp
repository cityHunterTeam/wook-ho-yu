<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>글쓰기</title>
<jsp:include page="../inc/Bootstrap.jsp"></jsp:include>
<script src="../ckeditor/ckeditor.js"></script>

    
</head>

<body>	
  <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->
<!-- 로긴폼 -->
<c:set var="id" value="${sessionScope.id }"/>
 	<div class="container" style="margin-top: 10px;">
		<div class="col-sm-12">						
			<form action="${contextPath }/not/writePro.do" method="post">																				
					<h2 align="center">공지사항 게시판 글 작성</h2>
					<br>
					<table class="table">
						<tr>
							<th width="100px" style="padding : auto;"><h5>
								<b>이름</b>
							</h5></th>	
							<td><input type="text" class="form-control" readonly="readonly" name="name" value="${sessionScope.id }">
							</td>
							</tr> 							
						<tr>
						<th  width="100px" style="padding: auto;"><h5>
									<b>제목</b>								
								</h5></th>
							<td><input type="text" class="form-control" name="title" placeholder="제목을 입력하세요"></td>
						</tr>     
						<tr>
							<th width="100px" style="padding : auto;"><h5>
								<b>비밀번호</b>
							</h5></th>
							<td><input type="password" class="form-control" name="passwd" placeholder="비밀번호를 입력하세요"></td>
						</tr>
						<tr>
							<th width="100px" style="padding: auto;"><h5>
									<b>내용</b>
								</h5></th>
							<td>
								<textarea name="content" id="content" rows="20" cols="80" placeholder="내용을 입력해주세요."></textarea>					    					          
				            </td>
						</tr>
						<tr>
							<td colspan="2" align="right">					
										<input type="submit" class="btn btn-dark" value="작성" />																														
								<a class="btn btn-danger" onclick="location.href='${contextPath}/not/notice.do'">취소</a>
							</td>
						</tr>
					</table>
				</form>
		</div>
	</div>

<!--     footer part start -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
<!--     footer part end -->
	</body>
</html>