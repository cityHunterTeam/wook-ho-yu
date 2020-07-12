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

a {
	text-align: center;
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

<jsp:include page="../inc/header.jsp"/>

<meta charset="UTF-8">
<title>글목록</title>
</head>
<body>

	<h2 style="text-align: center">예약정보</h2><br><br>
	<table class="table table-hover text-center" style="width:50%; margin:auto">
		
				
				<tbody>
					<tr><td>고객 ID</td><td>${mvo.id}</td></tr>
					<tr><td>고객 Email</td><td>${mvo.email}</td></tr>
					<tr><td>기차종류</td><td>${vo.traingradename}</td></tr>  
					<tr><td>열차번호</td><td>${vo.trainno}</td></tr>
					<tr><td>출발시간</td><td><fmt:formatDate value="${vo.depplandtime}" pattern="yyyy-MM-dd kk:mm"/></td></tr>  
					<tr><td>출발지</td><td>${vo.depplacename}</td></tr>
					<tr><td>도착지</td><td>${vo.arrplacename}</td></tr>
					<tr><td>운임요금</td><td>${vo.adultcharge}</td></tr>
					
				</tbody>
	</table>

	  <script>
        // html 이 다 로딩된 후 실행
        $(document).ready(function() {
            // 체크박스들이 변경됬을때
            $(":checkbox").change(function() {
                var cnt = $("#person").val();
                 
                // 셀렉트박스의 값과 체크박스중 체크된 갯수가 같을때, 다른 체크박스들을 disable 처리
                if( cnt==$(":checkbox:checked").length ) {
                    $(":checkbox:not(:checked)").attr("disabled", "disabled");
                    $("#count_sp").hide('fast');
                }
                // 체크된 갯수가 다르면 활성화 시킴
                else {
                    $(":checkbox").removeAttr("disabled");
                    $("#count_sp").show('fast');
                }
                
              <c:forEach var="soldvo" items="${soldList}">
            	<c:forTokens var="soldSeat" items="${soldvo.seat}" delims=" ">
    		
    			var checked= document.getElementsByName("seatlist");
    			for(var i = 0; i < 80; i++){
    				if(checked[i].value =='${soldSeat}'){
    					checked[i].disabled = true;
    					console.log(checked[i].value);
    				}
    			}		
    		
    			</c:forTokens>
            </c:forEach>

            });
             
            // 셀렉트박스에서 다른 인원수를 선택하면 초기화 시킴
            $("#person").change(function(){
                $(":checkbox").removeAttr("checked");
                $(":checkbox").removeAttr("disabled");
                $("#count_sp").show('fast');

                <c:forEach var="soldvo" items="${soldList}">
                	<c:forTokens var="soldSeat" items="${soldvo.seat}" delims=" ">
        		
        			var checked= document.getElementsByName("seatlist");
        			for(var i = 0; i < 80; i++){
        				if(checked[i].value =='${soldSeat}'){
        					checked[i].disabled = true;
        					console.log(checked[i].value);
        				}
        			}		
        		
        			</c:forTokens>
                </c:forEach>

                
            });
        });
        
     	
       
	
        
       
    </script>
    <br>
<form action="${contextPath}/res/reserv1.do" method="post" style="border:1px solid #ccc">
<br>

<div class="seat-wrapper" style="text-align: center"> 
    <span>인원수 선택 : </span>
    <select id="person" name="person">
        <option value="1">1명</option>
        <option value="2">2명</option>
        <option value="3">3명</option>
        <option value="4">4명</option>
        <option value="5">5명</option>
        <option value="6">6명</option>
        <option value="7">7명</option>
        
    </select>
    <br>
    <br>
    <span id="count_sp" style="text-align:center"> *선택한 인원수만큼 좌석을 선택해주세요</span>
    
    </div>

    <br>
    
    
    <h2 style="text-align: center">좌석선택</h2><br><br>
    
    <table border="1" style="width:50%; margin:auto">
    
        <tr>
        <c:forEach var="i" begin="1" end="20">
            <td><label><input type="checkbox" name="seatlist" value="A${i}"/>A${i}</label></td>
        </c:forEach>
        </tr>
        <tr>
        <c:forEach var="i" begin="1" end="20">
            <td><label><input type="checkbox" name="seatlist" value="B${i}"/>B${i}</label></td>
        </c:forEach>    
        </tr>
        
        <tr>
        <td colspan="20" style="height: 30px; text-align: center;">복도</td>
        </tr>
        
        <tr>
        <c:forEach var="i" begin="1" end="20">
            <td><label><input type="checkbox" name="seatlist" value="C${i}"/>C${i}</label></td>
        </c:forEach>    
        </tr>
        <tr>
        <c:forEach var="i" begin="1" end="20">
            <td><label><input type="checkbox" name="seatlist" value="D${i}"/>D${i}</label></td>
        </c:forEach>    
        </tr>
        
    </table>
    <br>
	<br>
		
	<input type="hidden" name="id" value="${mvo.id}">
	<input type="hidden" name="email" value="${mvo.email}">
	<div style="text-align:center">
	<button type="submit" class="btn btn-warning">결제진행</button>
	</div>
 	
</form>



<c:forEach var="soldvo" items="${soldList}">
	<c:forTokens var="soldSeat" items="${soldvo.seat}" delims=" ">
		<script>
			var checked= document.getElementsByName("seatlist");
			for(var i = 0; i < 80; i++){
				if(checked[i].value =='${soldSeat}'){
					checked[i].disabled = true;
					console.log(checked[i].value);
				}
			}		
		</script>
	</c:forTokens>
</c:forEach>
	
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>