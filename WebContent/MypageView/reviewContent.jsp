<%@page import="Mypage.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

.tu{
	margin:auto;
	position:relative;
	float:center; margin:center:20px;
}



tr:nth-child(even) {
  background-color: #f2f2f2;
}

</style>
<c:url var="url2" value="/mypage/deleteReview.do">
		<c:param name="num" value="${num}"/>
</c:url>
<script type="text/javascript">
	function fn_del(){
		
		if(confirm("정말 삭제하시겠습니까?") == true){
			location.href="${url2}";
			console.log('success');
		}else{
			console.log("fail");
			return false;
		}
	}
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>



<script type="text/javascript">
    	//웹브라우저가 json1.jsp의 HTML코드를 모두 로딩 했을떄... function(){}함수가 실행되게 선언
    	$(function(){
    		
    			// id속성값이 checkJson인 <a>영역을 선택해서 가져와서 
    			// 클릭하는 행위(이벤트)를 등록함.
    			// -> 사용자가 <a>요소를 클릭하는 순간? function(){}<---이벤트처리기 함수가 자동으로 수행됨
    			$("#reviewComment").click(function(){ //★ id있는곳은 댓글등록 버튼 id로 주어야함.★
    				var id = $("#c_id").val(); 
    				var content = $("#c_content").val();   // 댓글폼이 id가 commentForm이어야 함.
    				var bnum = $('#bnum').val();
    				
					var _comment = '{"id":"'+id+'","content":"'+ content +'","bnum":"'+ bnum +'"}';
					console.log(id);
					console.log(content);
					console.log(bnum);
    			 	$.ajax({
    							type : "post",
    							async : true, //false  동기방식
    							url : "${contextPath}/comment/comment.do",
    							data:{
									comment : _comment
    							},
  							 	 success : function(data,textStatus){
    								
    								//서버페이지인? 서블릿에서 응답한 data매개변수 값은 
    								//JSONObject객체 형태의 문자열이다.
    								
    								//참고 : JSONObject객체형태의 문자열을 파싱해서 
    								//      JSONObject객체로 변환한다.
    								var comment = JSON.parse(data);
    								
    								var commentInfo = "";
									
    								commentInfo += '<tr id="reply' + comment.cnum + '"><td>' + comment.c_id + '</td>';
    								commentInfo += '<td>' + comment.c_content + '</td>';
    								commentInfo += '<td>' + comment.c_date + '&nbsp'; //yyyy-MM-dd HH:mm:ss ,삭제버튼.
    								commentInfo += '<button type="button" onclick="deleteComment('+comment.cnum+')">삭제</button></td></tr>';
        							
    								
    								$("#tr").append(commentInfo + "<br>");
    								$("#c_content").val("");
    								
    								if($("#replyEmpty")){
    									$("#replyEmpty").remove();
    								}
    							},
    							error : function(){
    								alert("통신에러가 발생했습니다.");
    							}  
    				 	   }); 
    			});
    	}); 
    	
    	function deleteComment(cnum){
			
			 
				var id = $("#c_id").val();
				console.log(cnum);
				var _deleteComment = '{"id":"'+id+'","cnum":"'+ cnum +'"}';
								
			 	$.ajax({
							type : "post",
							async : true, //false  동기방식
							url : "${contextPath}/comment/deleteComment.do",//comment/ 일땐 널값 안뜸.
							data:{
								deleteComment : _deleteComment
							},
							 	 success : function(data,textStatus){
								console.log(data);
								if(data = "success"){
									var del = "<td>댓글이 삭제되었습니다.</td>";
									$("#reply"+ cnum).html(del).fadeOut(1000, function(){
									$(this).remove();
																		
									
									if($(".table table-hover").find("tr").length == 0){
										
										var emptydel = "";
										
										emptydel += '<tr id="replyEmpty">';
										emptydel += ' 	<td>등록된 댓글이 없습니다.</td>';
										emptydel += '</tr>';
										
										$(".table table-hover").append(emptydel);
									}
								})
								}else{
									alert("댓글이 정상적으로 삭제되지 않았습니다.");
								}
			 					},
								
								error : function(){
									alert("통신에러가 발생했습니다.");
								}  
					}); 
    		}
    	
    	
	
    </script>
</head>
<body>
<!-- 대가리 --> 
<jsp:include page="../inc/header.jsp"/>

<br><br><br>
<div class="container">
<form action="${contextPath}/mypage/reviewContent.do" align="center" color="blue" method="post" enctype="multipart/form-data">

<p><h2>글 상세보기</h2></p>
	
    <hr>
    <div>
    <c:set var="vo" value="${vo}"/>
    <label for="id" ><b>작성자</b></label>
    <input type="text" id="id" name="id" value="${vo.id}" readonly>
	</div>
	<div>
	<label for="image" ><b>이미지</b></label>
	<img alt="" src="${contextPath}/upload/${vo.num}/${vo.image}" style="width: 360px;height:270px;">
    
    </div>
	<div>
    <label for="title"><b>제목</b></label>
    <input type="text" id="title" value="${vo.title}" name="title" rows="5" cols="5" readonly>
	</div>
	<div>
    <label for="content"><b>글내용</b></label>
    <textarea id="content" name="content">${vo.content}</textarea>
	</div>
	
	<br><br>
	
	<label for="Reviewcomment" align="center"><b>댓글</b></label>
	<br>
	<div class="tu">
	
	
	<c:if test="${commentList.size() == 0}">
	
		<div id="replyEmpty">
				<p>등록된 댓글이 없습니다.</p>
		</div>
	</c:if>
	
	<c:if test="${commentList.size() > 0}">
	<c:forEach var="comment" items="${commentList}">
	
	<table class="table table-hover" style="text-align:center; border: 1px solid white;" bgcolor = "white">
		<div class="tu">
    			<tr id="reply${comment.cnum}">
    				<td>${comment.c_id}</td>
      			   	<td>${comment.c_content}</td>
      			   	<input type="hidden" id="cnum" name="cnum" value="${comment.cnum }">
      				<fmt:formatDate value="${comment.c_date}" var="ard" pattern="yyyy-MM-dd"/>
					<fmt:formatDate value="${ts}" var="now" pattern="yyyy-MM-dd"/>				
					<c:if test="${ard == now}">
					<td><fmt:formatDate value="${comment.c_date}" pattern="HH:mm"/>
					</c:if>
					<c:if test="${ard != now}"> 
					<td><fmt:formatDate value="${comment.c_date}" pattern="yyyy-MM-dd"/> 
					</c:if>&nbsp;&nbsp;&nbsp;
					<c:if test="${sessionScope.id == comment.c_id}">
					<button type="button" onclick="deleteComment('${comment.cnum}')">삭제</button>
					</c:if></td>
									
				</tr>
				</div>
	</table>
	</c:forEach>	
	</c:if>
	</div>
	
	
	<div class="container">
	<div class="row">
	<table class="table table-hover" style="text-align:center; border: 1px solid white;" bgcolor = "white">
	<tbody id = "tr">
		<div class="tu">
	
	
		</div>
	</tbody>
	</table>
	</div>
	</div>
	<c:if test="${id != null }">
	<div class="container">
	<div class="row">
	<form action="${contextPath}/comment/comment.do" name ="commentForm" method="post">
	<table class="table table-hover" id="tx" style="text-align:center; width:50%; margin:auto; border: 1px solid white;" bgcolor = "white">
		<tbody>	
			<tr>
			<td  colspan="2"><input type="type" id="c_id" name="c_id" value="${sessionScope.id}">
			<input type="hidden" id="bnum" name="bnum" value="${vo.num}">
			<textarea name="c_content" id="c_content" align="center" rows="5" cols="130" placeholder="댓글을 입력해주세요."></textarea>
			<input type="button" class = "button alt" id="reviewComment"  style="cursor: pointer; float:right" value="댓글등록" > <br></td>
			</tr>	
					
		</tbody>
	</table>	
	</c:if>
	</form>
	</div>
</div>	
	
    <div class="clearfix" style="text-align:center">
      <button type="button" class="cancelbtn" onclick="location.href='${contextPath}/mypage/review.do'">돌아가기</button>
      	<c:if test="${id == vo.id }">
      		<c:url var="url1" value="/mypage/updateReview.do">
			<c:param name="num" value="${num}"/>
			</c:url>
			
    		<button type="button" class="cancelbtn" onclick="location.href='${url1}'">수정하기</button>
    		<button type="button" class="cancelbtn" onclick="fn_del()">삭제하기</button>
    	
    	</c:if>
    </div>
    
   
    
  </div>
</form>



<!-- 밑바닥 -->
<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>
</html>


