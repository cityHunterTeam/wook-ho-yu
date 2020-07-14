<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>공지사항</title>
    <jsp:include page="/inc/Bootstrap.jsp"></jsp:include>
     
</head>

<body>
	<c:set var="center" value="${param.center}"/>
	<c:if test="${center == null}">
		<c:set var="center" value="noticeCenter.jsp"/>
	</c:if>


   <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->

  	<div class="container-flude" style="min-height: 630px" id="con1" >
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-1 w-100" style="padding-top: 92px">
				<a href="${contextPath}/not/notice.do" class="btn btn-dark w-100 mb-1" >공지사항</a><br>
				<a href="#" class="btn btn-dark w-100 mb-1">1:1 문의</a><br>
				<a href="${contextPath}/not/faq.do" class="btn btn-dark w-100 mb-1">자주 묻는 질문</a><br>
				<a href="${contextPath}/que/question.do" class="btn btn-dark w-100 mb-1">문의 게시판</a>
			</div>
			<div class="col-sm-6" align="center">
				<br>
				<h2>공지 사항</h2>
				<br>
				<table class="table mx-3 table-hover">
					<thead class="thead-light">
						<tr style="text-align: center">
							<th width="7%" >번호</th>
							<th width="60%">제목</th>
							<th width="15%" >조회수</th>
							<th width="15%" >등록일</th>
						</tr>
												
						<c:if test="${articleList == null }">																								
						<tr>
							<td colspan="5">게시판 글이 없습니다.</td>
						</tr>
						</c:if>												
					</thead>
					<c:if test="${articleList != null }">
					<tbody>
						<c:forEach var="article" items="${articleList }" >
							<c:url var="url1" value="/not/noticeContent.do">
							<c:param name="num" value="${article.num }"/>
							</c:url>
							<tr align="center" onclick="location.href='${url1}'">
								<td>${article.num }</td>
								<td>${article.title }</td>
								<td>${article.count }</td>
								<td><fmt:formatDate value="${article.date}"/></td>
							</tr>
						</c:forEach>						
					</tbody>
					</c:if>	
					<tfoot>
						<tr>
							
							
							<td colspan="2">
								<ul class="pagination">								  
						      <c:if test="${count > 0}">   
						      <c:if test="${startPage > pageBlock}">     
						         <c:url var="url1" value="/not/noitce.do">       
						            <c:param name="pageNum" value="${startPage-pageBlock}"/>           
						         </c:url>        
						      </c:if>        
						      <c:if test="${endPage < pageCount}">
						         <c:url var="url3" value="/not/notice.do">
						            <c:param name="pageNum" value="${startPage+pageBlock}"/>
						         </c:url>
						        
						      </c:if>
						   </c:if>	
					
         							<c:forEach var="i" begin="${startPage}" end="${endPage}">
      
     							 <c:url var="url2" value="/not/notice.do">
      
      						<c:param name="pageNum" value="${i}"/>
      							</c:url>
										<li class="page-item active"><a class="page-link" href="${url2}">${i}</a></li>																	
									</c:forEach>
				
								</ul>
								
							</td>
							<td colspan="2">
								<c:if test="${id == 'admin'}">
									<button onclick="location.href='${contextPath}/not/write.do'" class="btn btn-dark float-right btn-sm"><i class="fas fa-pen-fancy"></i>글 쓰기</button>
								</c:if>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div> 

<!--     footer part start -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
<!--     footer part end -->
   
</body>

</html>