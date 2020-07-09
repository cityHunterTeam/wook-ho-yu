<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주 묻는 질문</title>
<jsp:include page="/inc/Bootstrap.jsp"></jsp:include>

<!-- 아이콘을 위한 css -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<script type="text/javascript">
	$(function() {
		$(".bt").on(
				'click',
				function() {
					$(".card").attr("style", "display:none");
					var index = $(".bt").index(this);
					if (index == 0) {
						$(".card").attr("style", "display:flex");

					} else {
						index = index * 5;
						for (var i = 1; i < 6; i++) {
							$(".card:eq(" + (index - i) + ")").attr("style",
									"display:flex");
						}

					}

				});
		$("[name=searchbtn]").on(
				"click",
				function() {
					$(".card").attr("style", "display:none");
					var leng = $(".card").length;
					for (var i = 0; i < leng; i++) {

						var cardlink = $(".card-link:eq(" + i + ")").text();
						var cardbody = $(".card-body:eq(" + i + ")").text();
						var search = $("[name=search]").val();
						if (cardlink.indexOf(search) != -1
								|| cardbody.indexOf(search) != -1) {
							$(".card:eq(" + i + ")").attr("style",
									"display:flex");
						}

					}

				});
	});
</script>

</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<%-- Top End --%>

	<div class="container-flude mb-3">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-1 w-100" style="padding-top: 120px" >
				<a href="${contextPath }/not/notice.do" class="btn btn-dark w-100 mb-1" >공지사항</a><br>
				<a href="#" class="btn btn-dark w-100 mb-1">1:1 문의</a><br>
				<a href="${contextPath }/not/question.do" class="btn btn-dark w-100 mb-1">자주 묻는 질문</a><br>
				<a href="#" class="btn btn-dark w-100 mb-1">문의 게시판</a>
			</div>

			<div class="col-sm-6 border pb-3 mt-2">
				<br>
				<h2 class="ml-3" align="center">자주 묻는 질문</h2>
				<br> <br>
				<div class="btn-group w-100">
					<a href="#" class="btn btn-dark btn-lg bt">전체</a> <a href="#" class="btn btn-dark btn-lg bt">예약/변경</a> <a href="#" class="btn btn-dark btn-lg bt">서비스</a> <a href="#"
						class="btn btn-dark btn-lg bt">결제</a> <a href="#" class="btn btn-dark btn-lg bt">기타</a>
				</div>
				<br> <br>
				<div class="row mx-2">
					<div class="input-group">
						<input type="text" class="form-control" name="search" placeholder="검색어">
						<div class="input-group-prepend">
							<span class="input-group-prepend"><button class="btn btn-danger" type="button" name="searchbtn">검색</button> </span>
						</div>
					</div>
				</div>
				<br> <br>
				<div id="service" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse1"> 인터넷에서 일부 승객 예약 변경은 어떻게 하나요? </a>
						</div>
						<div id="collapse1" class="collapse" data-parent="#service">
							<div class="card-body">[예약조회 > 항공권 예약조회/변경/환불]에서 '탑승자 분리' 버튼을 선택하세요.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse2"> 탑승자 이름을 바꾸고 싶습니다. 변경 가능한가요? </a>
						</div>
						<div id="collapse2" class="collapse" data-parent="#service">
							<div class="card-body">항공권은 타인양도 및 명의변경이 불가합니다. 영문명과 성별 등 여권정보와 상이한 정보로 예약한 경우 탑승이 거절될 수 있으며, 결제 후 변경시에는 취소 환불 후 재예약 하셔야 합니다. 단, 원하는 항공권 및 좌석이 없을 수 있습니다. 탑승자 이름 중 발음이 동일한 일부 글자 및 영문스펠링
								오류의 경우 예약센터(1666-3060)를 통해 문의해 주시면 변경이 가능합니다.(수수료 없음) 이름 수정시에는 새로 예약을 진행하는 것이 아니며, 구매한 항공권의 이름을 변경하는 작업을 실시하게 됩니다. 예약 완료 후 이름이 상이한 경우 출발 전 반드시 예약센터로 연락주신 후 수정 부탁드립니다. 고객문의 페이지에서는 수정이 불가하오니,
								반드시 예약센터로 요청하여 주시기 바랍니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse3"> 단체예약은 어떻게 합니까? </a>
						</div>
						<div id="collapse3" class="collapse" data-parent="#service">
							<div class="card-body">홈페이지와 예약센터를 통하여 예매하실 수 있습니다. 단체예약(10명이상) 문의는 1666-6265번으로 문의하여 주시기 바랍니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse4"> 예약센터를 통해 예매해도 인터넷 할인 받을 수 있나요? </a>
						</div>
						<div id="collapse4" class="collapse" data-parent="#service">
							<div class="card-body">예약센터를 통한 예매인 경우에는 인터넷 할인을 적용 받으실 수 없습니다. 또한, 예약센터, 공항지점 등 인터넷 이외의 지점에서 예약을 하시고 인터넷으로 구매하시는 경우에는 인터넷 할인이 적용되지 않습니다. 인터넷 할인을 받기 원하시는 경우에는 예약과 구매를 모두 인터넷을 통해서 하셔야 합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse5"> 예약을 했는데도 잔여좌석이 계속 "9"석인 이유는 무엇인가요? </a>
						</div>
						<div id="collapse5" class="collapse" data-parent="#service">
							<div class="card-body">예약인원수에 따라 개인 예약과 단체 예약으로 구분됩니다. 개인 예약은 최대 9명 이하의 인원으로 예약하는 경우이고, 단체예약은 10명 이상 인원이 국내선 2구간 이상 동시에 여행을 예약하는 경우입니다. 잔여좌석의 표시는 실제 좌석이 10석 이상 남아있더라도 최대 개인 예약 가능 좌석수
								9석까지만 시스템에서 보여지며, 남아있는 여유좌석이 9석 미만일 경우 실제 잔여석 수 그대로 표시됩니다.</div>
						</div>
					</div>

				</div>
				<div id="reserve" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse6"> 노선별 기내식은 어떻게 제공되나요? </a>
						</div>
						<div id="collapse6" class="collapse" data-parent="#reserve">
							<div class="card-body">아래 URL을 따라 이동해보시면 에어부산에서 제공하고있는 노선별 기내식서비스를 확인하실 수 있습니다. 감사합니다. https://rsvweb.airbusan.com/content/common/service/cabin</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse7"> 소아나 유아 기내식은 어떻게 제공되나요? </a>
						</div>
						<div id="collapse7" class="collapse" data-parent="#reserve">
							<div class="card-body">유아에게는 기내식이 제공되지 않습니다. 소아에게는 소아식을 별도로 운영하지 않으며, 성인과 동일한 식사가 제공됩니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse8"> 항공기가 결항되었을 때 항공사에서는 어떠한 조치를 하나요? </a>
						</div>
						<div id="collapse8" class="collapse" data-parent="#reserve">
							<div class="card-body">결항의 사유 및 상황에 따라 조치 내역이 다릅니다. 천재지변 기상, 공항사정 등의 불가항력적인 사태로 인하여 결항되었을 경우 문자서비스와 전화로 안내하고 있습니다. 고객님의 불편을 최소화 하도록 노력하겠습니다. 감사합니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse9"> 자전거를 위탁 수하물로 운송이 가능한가요? </a>
						</div>
						<div id="collapse9" class="collapse" data-parent="#reserve">
							<div class="card-body">수하물로 운송을 하기 위해서는 핸들을 고정하고 페달을 제거한 후, 적절히 포장하여야 하며,무료수하물 허용량을 초과하는 경우에는 초과 수하물 요금을 지불하셔야 합니다. 수속시 면책 확인서에 동의 해주셔야 위탁 운송 가능합니다. 또한 고가의 자전거의 경우 저희 직원의 별도 안내를 받아주시기
								바랍니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse10"> 수하물도 많고 아이들까지 데리고 가서 어려움이 많습니다. 도움을 좀 받을 수 있을까요? </a>
						</div>
						<div id="collapse10" class="collapse" data-parent="#reserve">
							<div class="card-body">저희 에어부산에서는 7세 미만의 유/소아 2명 이상과 함께하는 여성, 혼자 여행하시는 만 70세 이상의 노약자, 장애 3등급 이상의 장애인 손님이 공항에서 편하게 이동하실 수 있도록 투게더 서비스를 제공하고 있습니다. 서비스를 신청하실 경우에는 예약센터 (1666-3060)을 통하여 아래의
								내용을 말씀해주세요. ① 서비스 신청 사유 (연령상의 이유/소아 동반/장애 등급) ② 필요하신 서비스 장소 (출발공항/도착공항) 1) 이용대상 - 7세 미만의 유/소아 2명 이상과 함께하는 여성 - 혼자 여행하시는 만 70세 이상의 노약자 - 장애 3등급 이상의 장애인 2) 서비스 이용 요금 에어부산 전 노선 무료로 제공해드리고 있습니다.
								3) 서비스 안내 - 출발지 공항에서 우선으로 좌석배정과 수하물 수속을 받게 되며 전담 직원의 안내에 따라 출발 편 탑승구까지 안내해 드립니다. - 도착지 공항에서는 탑승구에서 대기하고 있는 담당 직원이 수하물 찾는 일을 도와 드립니다. 4) 유의사항 - 투게더 서비스는 카운터에 도착하신 시점부터 직원의 안내 서비스가 제공됩니다. - 투게더
								서비스는 승객의 수하물 운반을 대행하는 서비스가 아니며, 공항에서 수하물 취급에 따르는 제반 비용 발생 시 승객부담이 될 수 있습니다. - 서비스 신청고객은 공항에서 배포해 드리는 투게더 서비스 목걸이를 서비스 종료 시까지 착용하셔야 합니다. - 마중객 대기장소인 도착 출구까지 안내해 드리며, 마중객 상봉 여부 및 교통편 탑승 여부는 서비스
								제공이 되지 않습니다.</div>
						</div>
					</div>

				</div>
				<div id="pay" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse11"> 영수증은 어디에서 받을 수 있나요? </a>
						</div>
						<div id="collapse11" class="collapse" data-parent="#pay">
							<div class="card-body">홈페이지/모바일을 통해 구매하신 항공권의 영수증은 [예약조회> 항공권 예약조회/변경/환불]을 통하여 영수증 확인 및 출력이 가능합니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse12"> 인터넷 예약 도중 이중(중복) 결제가 되었는데 어떻게 해야 하나요? </a>
						</div>
						<div id="collapse12" class="collapse" data-parent="#pay">
							<div class="card-body">예약센터(1666-3060)로 연락주시면, 카드 결제 및 발권 여부 확인 후 처리를 도와드리겠습니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse13"> 인터넷 구매시 카드 승인은 정상적으로 이뤄졌으나, 예약 조회가 되지 않을 때 어떻게 해야하나요? </a>
						</div>
						<div id="collapse13" class="collapse" data-parent="#pay">
							<div class="card-body">예약센터(1666-3060)로 연락주시거나 홈페이지에서 고객문의를 남겨주시면, 확인 후 처리를 도와드리겠습니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse14"> 인터넷으로 결제 시 무통장으로 입금할 수 있는 방법은 없나요? </a>
						</div>
						<div id="collapse14" class="collapse" data-parent="#pay">
							<div class="card-body">현재 무통장 입금 방법은 채택하고 있지 않습니다 대신, 신용카드 및 실시간 계좌이체 방법을 통하여 결제하실 수 있습니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse15"> 다른 사람카드를 통해 예약/결제도 가능한가요? </a>
						</div>
						<div id="collapse15" class="collapse" data-parent="#pay">
							<div class="card-body">카드 번호 및 카드 사용자만이 알 수 있는 정보를 확인하여 인증절차를 거친 후, 구매가 가능합니다.</div>
						</div>
					</div>
				</div>
				<div id="other" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse16"> 탑승확인서 및 탑승 후 영수증은 어떻게 발급할 수 있나요? </a>
						</div>
						<div id="collapse16" class="collapse" data-parent="#other">
							<div class="card-body">에어부산을 이용하신 후 탑승확인서 및 영수증이 필요하신 손님은 당사 예약센터 1666-3060 으로 연락주셔서 본인확인 절차를 거치신 후 발급이 가능합니다. 본인확인 시 신분증을 팩스로 요청할 수 있으며, 탑승확인서는 본인에게만 발급이 가능함을 참고하여 주시기 바랍니다. 만약, 공항 현장에
								나가실 수 있는 손님은 공항 지점에서도 발급이 가능합니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse17"> 회원정보를 변경하고 싶어요. 방법을 알려 주세요. </a>
						</div>
						<div id="collapse17" class="collapse" data-parent="#other">
							<div class="card-body">다음과 같은 절차로 회원정보를 변경하실 수 있습니다. &lt;홈페이지&gt; 1) 홈페이지 우측상단의 ‘마이 페이지'를 클릭합니다. 2) '나의 정보' 우측의 '개인정보 수정' 버튼을 클릭합니다. 3) 원하시는 내용을 변경하고 우측 하단의 "수정" 버튼을 클릭하시면 완료됩니다.
								&lt;모바일&gt; 1) 우측상단의 ‘MY'버튼을 누르고 '회원정보수정'탭을 누르세요. 2) 원하시는 내용을 변경하고 하단의 '저장' 버튼을 클릭하시면 완료됩니다</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse18"> 기업우대 프로그램이란 무엇인가요? </a>
						</div>
						<div id="collapse18" class="collapse" data-parent="#other">
							<div class="card-body">기업우대 프로그램이란 ? 기업우대 프로그램에 가입한 기업의 임∙직원들은 연중 할인된 운임으로 에어부산을 이용하여 기업경영에 도움을 드리는 프로그램입니다. 기업 직원 출장 목적뿐만 아니라 개인적인 항공권 이용시에도 기업에 부여한 할인혜택을 그대로 받아 사용 가능합니다. ▶ 가입방법 기업회원
								가입을 선택하신 후 가입 필수사항을 기입하시면 담당자 검토 후 기업체의 기업코드를 메일로 발부하며 기업코드명에 그대로 입력하시면 됩니다. (홈페이지에서만 가능) ▶ 회원혜택 이용구간 및 할인율 부산-김포 노선 주중 15%~25%, 주말 15%~20% 할인 제공 ※ 실적에 따라 할인율이 달라질 수 있습니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse19"> 출발 당일 언제까지 공항에 도착해야 하나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">출발 전 탑승수속 및 출발수속에는 시간이 필요합니다. 그러므로 출발 1~2시간 전까지 여유 있게 공항에 도착하시기 바랍니다. 탑승수속은 항공기 출발 20분 전(국내선)/40분 전(국제선)에 마감됩니다. 해당 시각 이전까지 탑승권 수령 및 수하물 위탁 등의 모든 수속을 완료해 주시기 바랍니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse20"> 아시아나와 마일리지 제휴가 되나요? </a>
						</div>
						<div id="collapse20" class="collapse" data-parent="#other">
							<div class="card-body">현재 에어부산은 마일리지제도가 별도로 제공되지 않으나 좀 더 합리적인 가격으로 고객님께 제공해 드리고 있으며, [FLY&STAMP] 회원 혜택 프로그램을 운영중입니다. 단, 아시아나 항공으로 발권 시 아시아나 마일리지를 적립해 드리고 있습니다.</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<%-- Footer Start --%>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>