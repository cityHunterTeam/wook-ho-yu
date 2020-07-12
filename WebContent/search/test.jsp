<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
   function sub(){
	    document.checkReservationok.action="./viewReservationList.bo";
	    document.checkReservationok.submit();
/* 	   window.location.replace("viewReser_0_Main.jsp");    */
   }

</script>


<div id="wrap" class="myreservation">

		
	<div id="container">
		<div id="content">
			<!-- location -->
			<div id="location" class="" style="top: 0px;">
				<ol class="location_area">
					<li><a href="/CW/KO/main.do" id="Home">홈</a></li>
					<li><a href="javascript:document.reservationList1.submit();" class="menuDepth2">예약 조회</a></li>
					<li class="current"><span class="menuDepth3" href="#none">
		                                
		                              예약 조회/변경/환불</span>
						<div class="btn_lnb"><a href="#none" id="ReservationMenu">예약 조회/변경 하위 메뉴</a><span class="hidden-title">열기</span></div>
						<div class="lnb_area" style="display: none;">
							<ul class="location_lnb">
								<li class="on"><a href="#none" class="menuDepth3_1">
		                                
		                              예약 조회/변경/환불</a></li>
								<li><a href="#none" class="menuDepth3_2">
		                                
		                              온라인 체크인</a></li>
							</ul>
						</div>
					</li>
				</ol>
			</div>
			<!-- content_inner -->
			<div class="content_inner">
				<h1 class="pagetitle" name="lblReservationInquiryChange">예약 조회</h1>
				<!-- tab 영역 (S) -->
				<div class="tab_section02 tab_2w first">
					<ul class="js-tab-section">
						<li class="OnOffTab on">
							<div class="tab_area">
								
								<div class="tab_content country">
									<!-- 오프라인 예약내역 컨텐츠 (S) -->
									<p id="noti7">에어서울 예약센터에서 예약하신 내역 조회가 가능합니다.</p>
									<div class="tbl-input-row01 mgt20">
									
										<table>
										
											<caption id="noti8">오프라인 예약내역 데이터 표 | 영문성명, 예약번호, 예약여정, 탑승일로 구성되어있습니다.</caption>
											<colgroup>
												<col style="width:18.2%">
												<col>
												<col style="width:18.2%">
												<col>
											</colgroup>
											<tbody>
											<c:choose>
						                      <c:when test="${requestScope.vsize != 0 }">
						                        <c:forEach var="v" items="${requestScope.v}">
											<tr>
												<th scope="row"><label for="lastname" id="EngName">영문성명</label></th>
												<td colspan="3">
													<div>
														<span class="inp-txt mgr01"><input type="text" name="txtLastName" style="width:226px;text-transform:uppercase;ime-mode:inactive;ime-mode:disabled" id="txtLastName" title="Last Name(성) 입력란" value="${v.booking_eng_lastname}" readonly="readonly"></span>
														<span class="inp-txt"><input type="text" name="txtFirstName" style="width:226px;text-transform:uppercase;ime-mode:inactive;ime-mode:disabled" id="txtFirstName" title="First Name(이름) 입력란" value="${v.booking_eng_firstname}" readonly="readonly"></span>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtReservationNumber" id="ReservationNo">예약번호</label></th>
												<td colspan="3">
													<div>
														<span class="inp-txt"><input type="text" name="txtReservationNumber" style="width: 226px;text-transform:uppercase;" id="txtReservationNumber" maxlength="8" value="${v.booking_number}" readonly="readonly"></span>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtDepAirport" id="ReservationItinerary">예약여정</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking js-radioLayer01">
																<input type="text" name="txtDepAirport" id="txtDepAirport" value="${v.booking_start}"title="출발지 입력란" readonly="readonly" class="ui-autocomplete-input" autocomplete="off">																		
															</div>
															<div class="booking js-radioLayer01">
																<input type="text" name="txtArrAirport" id="txtArrAirport" value="${v.booking_arr}"title="도착지 입력란" readonly="readonly">
															</div>
														</div>
														<div id="divBookingJourneyLayer" class="booking-journey-layer">
															
														
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">출발일/도착일</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_start_date}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_arr_date}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
															
															
														</div>
														
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">출발 시간/도착 시간</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_start_time}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_arr_time}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
															
															
														</div>
														
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">항공기 편명</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_flight_name}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
														
														</div>
														
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">여권 번호</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_passportnumber}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
														
														</div>
														
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">선택 좌석 / 기내식</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_optseat}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_optfood}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
														
														</div>
														
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">결제 금액</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_total_price}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
														
														</div>
														
													</div>
												</td>
											</tr>
											 </c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<th><label>예약된 정보가 없습니다.</label></th>
							</tr>
							</c:otherwise>
							</c:choose>
											
											</tbody>
											 
										</table>
									</div>
									<div class="btn_article">
										<ul>											
											<li><button type="button" id="btnConfirm" class="btn-type01-col01" onclick="sub();">확인</button></li>
										</ul>
									</div>
									
									<ul class="uList01 mgt40">
										<li name="lblNoti2">예약번호 등 예약정보를 정확하게 입력하셔야 확인 가능합니다. 예) 12345678 또는 ABCDE</li>
										<li name="lblNoti3">탑승객의 영문성함을 정확히 입력하여야 확인 가능합니다.</li>
										<li name="lblNoti4">한 구간이라도 출발일이 지난 경우는 조회가 불가능합니다.</li>
										<li id="noti9">여행사를 통한 예약은 확인이 불가합니다.</li>
										<li name="lblNoti1">홈페이지 및 모바일을 통해서 구매하신 내역은 로그인 후 예약 조회, 변경, 취소 등이 가능합니다.</li>
										<li id="noti10" class="point-color01">홈페이지 및 모바일에서 비회원으로 예약하신 경우, [비회원 로그인 예약조회] 메뉴에서 예약번호 및 e-mail 입력 후 예약 조회 및 취소가 가능합니다.</li>
									</ul>
									<!-- 오프라인 예약내역 컨텐츠 (E) -->
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!-- tab 영역 (E) -->
			</div>
		</div>
	</div>
	<p name="viewLayerLogin" href="I/KO/viewTwoLoginPnr1" class="jsOpenLayer" style="display:none;"></p>
	<form id="checkReservationok" name="checkReservationok" method="post"></form>

</div>
