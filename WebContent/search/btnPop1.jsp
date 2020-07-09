<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Content-Script-Type" content="text/javascript">

<title>역명조회</title>
<meta name="author" content="한국철도공사">
<meta name="copyright" content="300-720 대전광역시 동구 중앙로 240">
 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
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
	
	
	function putStation(name,code)
	{	
		opener.document.getElementById("txtGoStart").value = name;
		opener.document.getElementById("code1").value=code;
		self.close();
	}
</script>
	<style type="text/css">
		.bg03 {background:#FCDBF2}
		.tbl_h tr td{font-weight:bold;color:#017cab}
	</style>
</head>
<body class="popup">
	<div class="popup_ly" style="width:92%">
		<div class="header">
			<h2>역명조회</h2>
		</div>
		<div class="cont">
			<!-- popup content -->
	KTX노선도 지도보기 : 
	<select id="sbox1" name="sbox1">	
		<option value="KTX노선도 보기">KTX노선도 보기</option>
		<option value="강릉선" >강릉선 </option>
		<option value="경부선" >경부선 </option>
		<option value="경전선" >경전선 </option>
		<option value="전라선" >전라선 </option>
		<option value="호남선" >호남선 </option>
	</select>
		<div class="class1"></div>

			<table class="table table-sm" summary="출발역을 선택 하세요." >
				<caption>역명조회</caption>
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<tbody>
						<tr>
							<td class="bg03"><a href="javascript:putStation('서울'    ,'NAT010000')" title="KTX 정차역">서울    </a></td>
							<td class="bg03"><a href="javascript:putStation('용산'    ,'NAT010032')" title="KTX 정차역">용산    </a></td>
							<td class="bg03"><a href="javascript:putStation('영등포'  ,'NAT010091')" title="KTX 정차역">영등포  </a></td>
							<td class="bg03"><a href="javascript:putStation('광명'    ,'NATH10219')" title="KTX 정차역">광명    </a></td>
							
							<td class="bg03"><a href="javascript:putStation('수원'    ,'NAT010415')" title="KTX 정차역">수원    </a></td>
						</tr>	
						<tr>
							<td class=""><a href="javascript:putStation('평택'    ,'NAT010754')">평택    </a></td>
							<td class="bg03"><a href="javascript:putStation('천안아산','NAT080045')" title="KTX 정차역">천안아산</a></td>
							<td class=""><a href="javascript:putStation('천안'    ,'>NAT010971')">천안    </a></td>
							<td class="bg03"><a href="javascript:putStation('오송'    ,'NAT010570')" title="KTX 정차역">오송    </a></td>
							<td class=""><a href="javascript:putStation('조치원'  ,'NAT011298')">조치원  </a></td>
						</tr>
						<tr>
							<td class="bg03"><a href="javascript:putStation('대전'    ,'NAT011668')" title="KTX 정차역">대전    </a></td>
							<td class="bg03"><a href="javascript:putStation('서대전'  ,'NAT030057')" title="KTX 정차역">서대전  </a></td>
							<td class=""><a href="javascript:putStation('김천'    ,'NAT012546')">김천    </a></td>
							<td class=""><a href="javascript:putStation('구미'   ,'NAT012775')">구미    </a></td>
							<td class="bg03"><a href="javascript:putStation('김천구미' ,'NATH12383')" title="KTX 정차역">김천구미</a></td>
						</tr>
						<tr>
							<td class=""><a href="javascript:putStation('대구'   ,'NAT013239')">대구    </a></td>
							<td class="bg03"><a href="javascript:putStation('동대구'   ,'NAT013271')" title="KTX 정차역">동대구  </a></td>
							<td class="bg03"><a href="javascript:putStation('포항'    ,'NAT8B0351')" title="KTX 정차역">포항  </a></td>
							<td class="bg03"><a href="javascript:putStation('밀양'    ,'NAT013841')" title="KTX 정차역">밀양    </a></td>
							<td class="bg03"><a href="javascript:putStation('구포'    ,'NAT014281')" title="KTX 정차역">구포    </a></td>
						</tr>
						<tr>
							<td class="bg03"><a href="javascript:putStation('부산'    ,'NAT014445')" title="KTX 정차역">부산    </a></td>
							<td class="bg03"><a href="javascript:putStation('신경주'  ,'NATH13421')" title="KTX 정차역">신경주  </a></td>
							<td class=""><a href="javascript:putStation('태화강'  ,'NAT750726')">태화강  </a></td>
							<td class="bg03"><a href="javascript:putStation('울산(통도사)' ,'NATH13717')" title="KTX 정차역">울산(통도사)</a></td>
							<td class="bg03"><a href="javascript:putStation('마산'    ,'NAT880345')" title="KTX 정차역">마산    </a></td>
						</tr>
						<tr>
							<td class="bg03"><a href="javascript:putStation('창원중앙','NAT880281')" title="KTX 정차역">창원중앙</a></td>
							<td class="bg03"><a href="javascript:putStation('경산'    ,'NAT013395')" title="KTX 정차역">경산    </a></td>
							<td class="bg03"><a href="javascript:putStation('논산'    ,'NAT030508')" title="KTX 정차역">논산    </a></td>
							<td class="bg03"><a href="javascript:putStation('익산'    ,'NAT030879')" title="KTX 정차역">익산    </a></td>
							<td class="bg03"><a href="javascript:putStation('정읍'    ,'NAT031314')" title="KTX 정차역">정읍    </a></td>
						</tr>
						<tr>
							<td class="bg03"><a href="javascript:putStation('광주송정','NAT031857')" title="KTX 정차역">광주송정</a></td>
							<td class="bg03"><a href="javascript:putStation('목포'    ,'NAT032563')" title="KTX 정차역">목포    </a></td>
							<td class="bg03"><a href="javascript:putStation('전주'    ,'NAT040257')" title="KTX 정차역">전주    </a></td>
							<td class="bg03"><a href="javascript:putStation('순천'    ,'NAT041595')" title="KTX 정차역">순천    </a></td>
							<td class="bg03 lin02"><a href="javascript:putStation('여수EXPO','NAT041993')" title="KTX 정차역">여수EXPO(구,여수역)</a></td>
						</tr>
						<tr>
							<td class=""><a href="javascript:putStation('대천'    ,'NAT080952')">대천    </a></td>
							<td class="bg03"><a href="javascript:putStation('청량리'  ,'NAT130126')">청량리  </a></td>
							<td class=""><a href="javascript:putStation('춘천'    ,'NAT140873')">춘천    </a></td>
							<td class=""><a href="javascript:putStation('제천'    ,'NAT021549')">제천    </a></td>
							<td class=""><a href="javascript:putStation('동해'    ,'NAT601485')">동해    </a></td>
						</tr>
						<tr>
							<td class="bg03"><a href="javascript:putStation('강릉'	,'NAT601936')" title="KTX 정차역">강릉	</a></td>
							<td class="bg03"><a href="javascript:putStation('행신'	,'NAT110147')" title="KTX 정차역">행신	</a></td>
							<td class=""><a href="javascript:putStation('남춘천'	,'NAT140840')">남춘천 	</a></td>
							<td class=""><a href="javascript:putStation('부전'	,'NAT750046')">부전    	</a></td>
							<td class=""><a href="javascript:putStation('신탄진'	,'NAT011524')">신탄진    </a></td>
						</tr>
						<tr>
							<td class=""><a href="javascript:putStation('영동'	,'NAT012124')">영동    </a></td>
							<td class=""><a href="javascript:putStation('왜관'	,'NAT012968')">왜관    </a></td>
							<td class=""><a href="javascript:putStation('원주'	,'NAT021082')">원주    </a></td>
							<td class="bg03"><a href="javascript:putStation('정동진'	,'NAT601774')" title="KTX 정차역">정동진 </a></td>
							<td class=""><a href="javascript:putStation('홍성'	,'NAT080622')">홍성    </a></td>
						</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	
	
    <script src="../js/bootstrap.min.js"></script>

</body></html>
</html>