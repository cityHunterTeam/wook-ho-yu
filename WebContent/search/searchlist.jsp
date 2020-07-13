<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
<title>글목록</title>
</head>
<body>
	<table class="table table-hover text-center" style="width: 80%; margin:auto;" >
				<thead>
					<tr height="10" align="center" bgcolor="lightgreen">
						<td>기차종류</td>
						<td>열차번호</td>
						<td>출발일</td>
						<td>출발역</td>
						<td>도착역</td>
						<td>운임요금</td>
						<td>예약하기</td>
					</tr>
				</thead>
				<tbody>
		<c:if test="${fn:length(hashlist) == 0}">
			<tr height="10">
				<td colspan="4">
					<p align="center">
							<br>
						<b><span style="font-size:20pt;">해당하는 열차가 없습니다.</span></b>
					</p>
				</td>
			</tr>	
		</c:if>
		<c:if test="${fn:length(hashlist) != 0}">
		
			<c:forEach var="hash" items="${hashlist}" >
				<tr align="center">
					<c:if test="${hash['adultcharge'] != 0}">
					<td width="10%">${hash["traingradename"]}</td>
					<td width="10%">${hash["trainno"]}</td>
					<td width="10%"><fmt:formatDate value="${hash['depplandtime']}" pattern="yyyy-MM-dd kk:mm"/></td>
					<td width="10%">${hash["depplacename"]}</td>
					<td width="10%">${hash["arrplacename"]}</td>
					<td width="10%">${hash["adultcharge"]}원</td>
					<c:url var="url1" value="/res/seat.do">
						<c:param name="traingradename" value="${hash['traingradename']}"/>	
						<c:param name="trainno" value="${hash['trainno']}"/>				
						<c:param name="adultcharge" value="${hash['adultcharge']}"/>
						<c:param name="depplandtime" value="${hash['depplandtime']}"/>
						<c:param name="depplacename" value="${hash['depplacename']}"/>
						<c:param name="arrplacename" value="${hash['arrplacename']}"/>	
					</c:url>
					<td width="10%"><a href="${url1}">예약하기</a></td>
					</c:if>
				</tr>
			</c:forEach>
			
		</c:if>
		</tbody>
	</table>
	
	
	<br>
	<br>
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>