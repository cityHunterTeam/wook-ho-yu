<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="notice.noticeDAO"%>
<%@page import="notice.noticeVO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/notice.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container-fluid">  
	    <div class="row" >&nbsp;</div>
    <div class="row" id="main_img">
		  <div class="content">
		    <h2>공지사항 등록</h2>
		  </div>
		</div>
   		 </div>
	

<c:set var="id" value="${sessionScope.id }"/>

	<div class="container">
	  <form name="fr" method="post" action="${contextPath}/not/noticeUpdatePro.do">

	    <div class="row">
	      <div class="col-20">
	        <label for="name">Name</label>
	      </div>
	      <div class="col-30-1">
	        <input type="text" id="name" name="id"  readonly="readonly" value="${vo.id}">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="subject">Subject</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="subject" name="title"  value="${vo.title }">
	      </div>
	    </div>
		 <div class="row">
	      <div class="col-20">
	        <label for="passwd">Password</label>
	      </div>
	      <div class="col-80">
	        <input type="password" id="passwd" name="passwd">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="content">Content</label>
	      </div>
	      <div class="col-80">
	        <textarea id="content" name="content" style="height:300px">${vo.content }</textarea>
	      </div>
	    </div>
	    	<input type="hidden" name="num" value="${num}"/>
	     <br><br>
	      <div id = "btnarea">
			<div class="btn-div">
				<button type="submit" class="btn wrbtn" id="btn1">수정하기</button>
				<button type="button" class="btn wrbtn" id="btn3" 
							onclick="location.href='${contextPath}/not/notice.do'">목록으로</button>
			</div>
		</div>
	  </form>
	</div>
</body>
</html>