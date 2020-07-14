<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
a{
	text-align: center;

}


</style>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>    

<jsp:include page="../inc/header.jsp"/>

<meta charset="UTF-8">
<title>주문목록</title>
</head>
<body>
	<h2 align="center">${id}의 주문목록</h2>
	<br>
	<br>
	<table class="table table-hover text-center" style="width: 80%; margin:auto;">
				<colgroup class="d-none d-lg-table-column-group">
					<col style="width:80px"/>
					<col />
					<col style="width:100px"/>
					<col style="width:100px"/>
					<col style="width:100px"/>
				</colgroup>
				<thead>
					<tr height="10" align="center" bgcolor="lightgreen">
						<td>기차종류</td>
						<td>출발지</td>
						<td>도착지</td>
						<td>결제금액</td>
						<td>결제날짜</td>
						<td>출발날짜</td>
					</tr>
				</thead>
				<tbody>
				
		<c:if test="${articleList== null}">
			<tr height="10" >
				<td colspan="4">
					<p align="center">
						<b><span style="font-size:9pt;">결제내역이 없습니다.</span></b>
					</p>
				</td>
			</tr>	
		</c:if>
		<c:if test="${articleList != null}">
			<c:forEach var="article" items="${articleList}">
				<tr align="center" onclick="location.href='${contextPath}/my/content.do?num=${article.num}&pageNum=${pageNum}'">
					<td width="5%">${article.traingradename}
					<td width="5%">${article.depplacename}</td>
					<td width="5%">${article.arrplacename}</td>
					<td width="5%">${article.adultcharge}원</td>			
					<td width="5%"><fmt:formatDate value="${article.reser_date}" pattern="yyyy-MM-dd kk:mm"/></td>
					<td width="5%"><fmt:formatDate value="${article.depplandtime}" pattern="yyyy-MM-dd kk:mm"/></td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
	</table>
	<br>
	<div class="row">
		<div class="col-12">
			<ul class="pagination justify-content-center">
			<c:if test="${count > 0}">
				<c:if test="${startPage > pageBlock}">
					<c:url var="url1" value="/my/order.do">
						<c:param name="pageNum" value="${startPage-pageBlock}"/>
					</c:url>
						<a style="font-size: xx-large;" class="page-link" href='${url1}'>Previous</a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:url var="url2" value="/my/order.do">
				<c:param name="pageNum" value="${i}"/>
				</c:url>
						<a style="font-size: xx-large;" class="page-link" href='${url2}'>${i}</a>
				</c:forEach>
				
				<c:if test="${endPage < pageCount}">
					<c:url var="url3" value="/my/order.do">
						<c:param name="pageNum" value="${startPage+pageBlock}"/>
					</c:url>
						<a style="font-size: xx-large;" class="page-link" href='${url3}'>Next</a>
				</c:if>
			</c:if>
			</ul>
		</div>
	</div>
	<br>
	<br>
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>