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
    <title>글수정</title>
<jsp:include page="../inc/Bootstrap.jsp"></jsp:include>
<script src="../ckeditor/ckeditor.js"></script>

    
</head>

<body>	
  <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->
<!-- 로긴폼 -->
<c:set var="passwd" value="${vo.passwd }"/>
 	<div class="container" style="margin-top: 10px;">
		<div class="col-sm-12">						
			<form action="${contextPath }/not/noticeUpdatePro.do" method="post">	
			<input type="hidden" name="num" value="${vo.num }">																			
					<h2 align="center">공지사항 게시판 글 수정</h2>
					<br>
					<table class="table">
						<tr>
							<th width="100px" style="padding : auto;"><h5>
								<b>회원아이디</b>
							</h5></th>	
							<td><input type="text" class="form-control" readonly="readonly" name="name" value="${vo.id}">
							</td>
							</tr> 							
						<tr>
						<th  width="100px" style="padding: auto;"><h5>
									<b>제목</b>								
								</h5></th>
							<td><input type="text" class="form-control" name="title"  value="${vo.title}"></td>
						</tr>     
						<tr>
							<th width="100px" style="padding : auto;"><h5>
								<b>비밀번호</b>
							</h5></th>
							<td><input type="password" class="form-control" name="passwd" ></td>
						</tr>
						<tr>
							<th width="100px" style="padding: auto;"><h5>
									<b>내용</b>
								</h5></th>
							<td>
								<textarea name="content" id="content" rows="20" cols="80">${vo.content }</textarea>					    					          
				            </td>
						</tr>
						<tr>
							<td colspan="2" align="right">												
										<input type="submit" class="btn btn-dark" value="수정하기" />																																					
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