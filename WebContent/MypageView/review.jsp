<%@page import="Mypage.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>

<style>

.page-link {display: inline-block !important;}
.center {text-align: center;}
.tu{
	width:300px;height:280px;
	margin:auto;
	position:relative;
	float:left; margin:left:5px;
}
.row1 {display: inline-block !important;}
</style>
<link rel="stylesheet" href="../css/image.css">
<jsp:include page="../inc/header.jsp"/>
<div class="main">

<h1>리뷰게시판</h1>
<hr>

<h2>여행객들의 리뷰를 적는 게시판입니다.</h2>

<c:if test="${articleList == null }">
		<tr height="10">
			<td colspan="4">
				<p align="center"><b>등록된 글이 없습니다.</b></p>
			</td>
		</tr>
</c:if>

<c:if test="${articleList != null}">
	<c:forEach var="article" items="${articleList}">
<div class="row1">
  <div class="column1">
  		 
    		<div class="tu" onclick="location.href='${contextPath}/mypage/reviewContent.do?num=${article.num}'">
      			
      			<img alt="" src="${contextPath}/upload/${article.num}/${article.image}" style="width: 230px;height:180px;">
      			<fmt:formatDate value="${article.date}" var="ard" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${ts}" var="now" pattern="yyyy-MM-dd"/>			
				<c:set var="file" value="${article.image}"/>
      			
      			<c:if test="${file != null }">      				
					<c:if test="${ard == now}">
					<h3>
					<img src="${contextPath}/upload/new.png" style="width:20px; height:20px;">
					${article.title }
					<img src="${contextPath}/upload/file.jpg" style="width:30px; height:30px;"> 
					</h3>
	      			<p>${article.id}</p>
					<p width="2%"><fmt:formatDate value="${article.date}" pattern="kk:mm"/> &nbsp;조회수 : ${article.readcount}</p>
					</c:if>
				
					<c:if test="${ard != now}"> 
					<h3>
					${article.title }
					<img src="${contextPath}/upload/file.jpg" style="width:30px; height:30px;"> 
					</h3>
	      			<p>${article.id}</p>
					<p width="2%"><fmt:formatDate value="${article.date}" pattern="yyyy-MM-dd"/> &nbsp;조회수 : ${article.readcount}</p>
					</c:if>
				</c:if>
				
				<c:if test="${file == null }">
				<c:if test="${ard == now}">
					<h3>
					<img src="${contextPath}/upload/new.png" style="width:20px; height:20px;">
					${article.title }
					</h3>
	      			<p>${article.id}</p>
					<p width="2%"><fmt:formatDate value="${article.date}" pattern="kk:mm"/> &nbsp;조회수 : ${article.readcount}</p>
					</c:if>
				
					<c:if test="${ard != now}"> 
					<h3>${article.title }</h3>
	      			<p>${article.id}</p>
					<p width="2%"><fmt:formatDate value="${article.date}" pattern="yyyy-MM-dd"/> &nbsp;조회수 : ${article.readcount}</p>
					</c:if>
				</c:if>
							
    </div>
  </div>
</div>
	</c:forEach>	
</c:if>

<div class="center">
	<c:if test="${count > 0}">
	
		<c:if test="${startPage > pageBlock}">
			<c:url var="url1" value="/mypage/review.do">
				<c:param name="pageNum" value="${startPage-pageBlock}"/>
			</c:url>
			<a style="font-size: x-large;" class="page-link" href='${url1}'>Previous</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:url var="url2" value="/mypage/review.do">
		<c:param name="pageNum" value="${i}"/>
		</c:url>
			<a style="font-size: x-large;" class="page-link" href='${url2}'>${i}</a>
		</c:forEach>
		
		<c:if test="${endPage < pageCount}">
			<c:url var="url3" value="/mypage/review.do">
				<c:param name="pageNum" value="${startPage+pageBlock}"/>
			</c:url>
			<a style="font-size: x-large;" class="page-link" href='${url3}'>Next</a>
		</c:if>
	</c:if>
</div>
<br>
<br>
<c:if test="${sessionScope.id != null}">
<div style="text-align:center;">
	<button type="button" onclick="location.href='${contextPath}/mypage/reviewWrite.do'">글쓰기</button>
</div>
</c:if>

<jsp:include page="../inc/footer.jsp"></jsp:include>
<!-- END MAIN -->
</div> 