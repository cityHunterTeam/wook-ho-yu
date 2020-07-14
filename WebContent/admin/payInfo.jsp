<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/reset.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cls1 {
	text-decoration: none;
}

.cls2 {
	text-align: center;
	font-size: 30px;
}


.seat {
	width: 40px;
	height: 30px;
}

.clicked {
	background-color: green;
	color: white;
}
</style>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>    

<meta charset="UTF-8">

<jsp:include page="../inc/adminHeader.jsp"/>

<div class="container-fluid">
  <div class="row">
<jsp:include page="../inc/adminSidebar.jsp"/>
 <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
 	<h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group mr-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
            This week
          </button>
        </div>
      </div>

<body>
<c:set var="vo" value="${vo}"/>
	<h2 style="text-align: center">결제정보</h2><br><br>
	<div class="container">
	<form action="${contextPath}/adm/payInfo.do?num=${vo.num}" method="post" style="border:1px solid #ccc;">
	
	<table class="table table-hover text-center" style="width:50%; margin:auto;">
				<tbody>
					<tr><td>고객 ID</td><td>${vo.reser_id}</td></tr>
					<tr><td>고객 Email</td><td>${vo.reser_email}</td></tr>
					<tr><td>기차종류</td><td>${vo.traingradename}</td></tr>  
					<tr><td>열차번호</td><td>${vo.trainno}</td></tr>
					<tr><td>출발시간</td><td><fmt:formatDate value="${vo.depplandtime}" pattern="yyyy-MM-dd kk:mm"/></td></tr>  
					<tr><td>출발지</td><td>${vo.depplacename}</td></tr>
					<tr><td>도착지</td><td>${vo.arrplacename}</td></tr>
					<tr><td>결제금액</td><td>${vo.adultcharge}</td></tr>
					<tr><td>결제좌석</td><td>${vo.seat}</td></tr>
				</tbody>
	</table>
	</div>
	</body>
    <br>
	<br>

	<div style="text-align:center">
	<button type="button" onclick="history.back();">목록보기</button>
	</div>
</form>	
</div>
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>