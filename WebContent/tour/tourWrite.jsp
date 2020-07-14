<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
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

     <link type="text/css" rel="stylesheet" href="../css/board.css" />
</head>

<body>
   <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->
	<div class="container-fluid">  
	    <div class="row" >&nbsp;</div>
    <div class="row" id="main_img">
		  <div class="content">
		    <h2>패키지 상품 등록</h2>
		  </div>
		</div>
   		 </div>
	
<c:set var="id" value="${sessionScope.id }"/>
	
	<div class="container">
	  <form name="fr" method="post" action="${contextPath }/to/tourWritePro.do" enctype="multipart/form-data">
	    <div class="row">
	      <div class="col-20">
	        <label for="name">Name</label>
	      </div>
	      <div class="col-30-1">
	        <input type="text" id="name" name="id" readonly="readonly" value="${sessionScope.id}">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="subject">Title</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="subject" name="title" placeholder="제목을 입력하세요">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="tour_num">Product</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="tour_num" name="tour_num" placeholder="상품번호를 입력하세요">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="file">Image1</label>
	      </div>
	      <div class="col-80">
	       <input type="file" id="file1" name="img1" onchange="loadImg(this, 1)">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="file">Image2</label>
	      </div>
	      <div class="col-80">
	       <input type="file" id="file2" name="img2" onchange="loadImg(this, 2)">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="file">Image3</label>
	      </div>
	      <div class="col-80">
	       <input type="file" id="file3" name="img3" onchange="loadImg(this, 3)">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="file">Image4</label>
	      </div>
	      <div class="col-80">
	       <input type="file" id="file4" name="img4" onchange="loadImg(this, 4)">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="file">Image5</label>
	      </div>
	      <div class="col-80">
	       <input type="file" id="file5" name="img5" onchange="loadImg(this, 5)">
	      </div>
	    </div>
	    <br><br>
	      <div id = "btnarea">
			<div class="btn-div">
				<button type="submit" class="btn wrbtn" id="btn1">글쓰기</button>
				<button type="button" class="btn wrbtn" id="btn3" 
							onclick="location.href='${contextPath}/to/tour.do'">목록으로</button>
			</div>
		</div>
	  </form>
	</div>
    <jsp:include page="../inc/footer.jsp"></jsp:include>
<!--     footer part end -->
	<script type="text/javascript">
        function loadImg(value, num) { // value는 업로드한 파일
            if (value.files && value.files[0]) { // 파일을 업로드하면 배열 형태로 들어온다.
                var reader = new FileReader();
               
                reader.onload = function(e) { // reader가 실행되면 적용될 속성
                    switch (num) {
                    case 1 :
                        $("#file1").attr("src", e.target.result); // target.result는 업로드한 파일의 임시경로
                        break;
                    case 2 :
                        $("#file2").attr("src", e.target.result);
                        break;
                    case 3 :
                        $("#file3").attr("src", e.target.result);
                        break;
                    case 4 :
                        $("#file4").attr("src", e.target.result);
                        break;
                    }
                	case 5 :
                    	$("#file5").attr("src", e.target.result);
                    	break;
                	}
                };
               
                reader.readAsDataURL(value.files[0]); // reader호출, 파일의 url을 읽어 들임
            }
        }
    </script>

출처: https://qdgbjsdnb.tistory.com/214 [하위^^]
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