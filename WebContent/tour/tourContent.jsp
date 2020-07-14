<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
 <c:set var = "DAO" value="${tourDAO}" /> 
<!doctype html>
<html lang="en">

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
    
     <link rel="stylesheet" href="../css/join.css">
    
</head>

<body>
   <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->
	<c:if test="${list != null }">
		<c:forEach var="list" items="${list }">
	<div class="container">
	<article>
	<form action="${contextPath}/to/tourContent.do" method="post" >
	<input type="hidden" name="num" value="${list['num']}">
	  <table class="table table-bordered">
	    <tbody>
	      <tr>
	      <td>${list["title"]}</td>
	      <td>상품번호 : ${list["tour_num"]}</td>
	      <td>가격 : ${list["price"]}</td>
	      </tr>
	      <tr>
	      <td colspan="4">
	      	<img alt="" src="${contextPath}/tourImage/${num}/${list['img1']}">
	      	<br><img alt="" src="${contextPath}/tourImage/${num}/${list['img2']}">
	      	<br><img alt="" src="${contextPath}/tourImage/${num}/${list['img3']}">
	      	<br><img alt="" src="${contextPath}/tourImage/${num}/${list['img4']}">
	      	<br><img alt="" src="${contextPath}/tourImage/${num}/${list['img5']}">
	      	<br><br><br><br><br><br><br><br><br>
	     </td>
		</tr>
	    </tbody>
	  </table>
	 </form>
	 		
				<div id = "btnarea">
					<div class="btn-div">
					<c:if test="${sessionScope.id.equals('admin')}">
						<button class="btn wrbtn" id="btn1"
							onclick="location.href='${contextPath}/to/updateTour.do?num=${num}'">수정하기</button> &nbsp;
						<button class="btn wrbtn" id="btn2"
							onclick="location.href='${contextPath}/to/deleteTour.do?num=${num}'">삭제</button>&nbsp;		
					</c:if>							
				<button class="btn wrbtn" id="btn3" 
							onclick="location.href='${contextPath}/to/tour.do'">처음으로</button> &nbsp;
					</div>
				</div>
					</article>
			</div>
		</c:forEach>
	</c:if>
	<div style="height: 50px;"></div>
<!--     footer part start -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
<!--     footer part end -->

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