<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class 선택자 연습</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


// $(document).ready(function(){
// 	var value = $("#sbox1").find(":selected").val();
// 	if(value == '강릉선'){
// 		$(".class1").html("<img src='../img/강릉선.png'>");
// 	}else if(value == '경부선'){
// 		$(".class1").html("<img src='../img/경부선.png'>");
// 	}else if(value == '경전선'){
// 		$(".class1").html("<img src='../img/경전선.png'>");
// 	}else if(value == '전라선'){
// 		$(".class1").html("<img src='../img/전라선.png'>");
// 	}else if(value == '호남선'){
// 		$(".class1").html("<img src='../img/호남선.png'>");
// 	}
// });
$(function(){
	$('#sbox1').change(function(){
		var value=$("#sbox1").find(":selected").val();
		
		if(value == '강릉선'){
			$(".class1").html("<img src='../img/강릉선.png'>");
	 	}else if(value == '경부선'){
	 		$(".class1").html("<img src='../img/경부선.png'>");
	 	}else if(value == '경전선'){
	 		$(".class1").html("<img src='../img/경전선.png'>");
	 	}else if(value == '전라선'){
	 		$(".class1").html("<img src='../img/전라선.png'>");
	 	}else if(value == '호남선'){
	 		$(".class1").html("<img src='../img/호남선.png'>");
	 	}
	})
});


</script>
</head>
<body>
<div class="class1"></div>
<input type="button" value="KTX 강릉선 노선도 보기" onClick="addImage()"/>


<select id="sbox1" name="sbox1">	
	<option value="KTX노선도 보기" >KTX노선도 보기</option>
	<option value="강릉선" >강릉선 </option>
	<option value="경부선" >경부선 </option>
	<option value="경전선" >경전선 </option>
	<option value="전라선" >전라선 </option>
	<option value="호남선" >호남선 </option>
</select>
</body>
</html>