<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="tourPackage.tourDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Martine</title>
    <link rel="icon" href="../img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="../css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="../css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="../css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="../fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="../css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="../css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/image.css">
	<link rel="stylesheet" href="../css/board.css">

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

</head>

<body>
<jsp:include page="../inc/header.jsp"/>
<div class="main">

<h1>Package Tour</h1>
<hr>

<c:if test="${empty articleList}">
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
  		 
    		<div class="tu" onclick="location.href='${contextPath}/to/tourContent.do?num=${article.num}'">
      			<img alt="" src="${contextPath}/tourImage/${article.num}/${article.img1}" style="width: 230px;height:180px;">
      			<h3>${article.title }</h3>
      			<p>${article.price}</p>
      			<fmt:formatDate value="${article.date}" var="ard" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${ts}" var="now" pattern="yyyy-MM-dd"/>				
				<c:if test="${ard == now}">
				<p width="2%"><fmt:formatDate value="${article.date}" pattern="kk:mm"/> &nbsp;조회수 : ${article.readcount}</p>
				</c:if>
				<c:if test="${ard != now}"> 
				<p width="2%"><fmt:formatDate value="${article.date}" pattern="yyyy-MM-dd"/> &nbsp;조회수 : ${article.readcount}</p>
				</c:if>
				
    </div>
  </div>
</div>
	</c:forEach>	
</c:if>

<div class="center">
	<c:if test="${count > 0}">
	
		<c:if test="${startPage > pageBlock}">
			<c:url var="url1" value="/to/tour.do">
				<c:param name="pageNum" value="${startPage-pageBlock}"/>
			</c:url>
			<a style="font-size: x-large;" class="page-link" href='${url1}'>Previous</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:url var="url2" value="/to/tour.do">
		<c:param name="pageNum" value="${i}"/>
		</c:url>
			<a style="font-size: x-large;" class="page-link" href='${url2}'>${i}</a>
		</c:forEach>
		
		<c:if test="${endPage < pageCount}">
			<c:url var="url3" value="/to/tour.do">
				<c:param name="pageNum" value="${startPage+pageBlock}"/>
			</c:url>
			<a style="font-size: x-large;" class="page-link" href='${url3}'>Next</a>
		</c:if>
	</c:if>
</div>
<br>
<br>
<c:if test="${sessionScope.id.equals('admin')}">
<div id = "btnarea">
	<div class="btn-div">
		<button class="btn wrbtn" id="btn1" onclick="location.href='${contextPath}/to/tourWrite.do'">글쓰기</button> &nbsp;&nbsp;			
	</div>
</div>
</c:if>


<!-- END MAIN -->
</div> 
<jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- jquery plugins here-->
    <script src="../js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="../js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="../js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="../js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="../js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="../js/jquery.ajaxchimp.min.js"></script>
    <script src="../js/jquery.form.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
    <script src="../js/mail-script.js"></script>
    <script src="../js/contact.js"></script>
    <!-- custom js -->
    <script src="../js/custom.js"></script>
</body>
</html>