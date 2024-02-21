<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common3.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="/livre/css/main-page.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
<link rel="stylesheet" href="/livre/css/menu.css" />
<link rel="icon" href="/livre/assets/favicon.png">

<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<title>메인 페이지</title>
<script type="text/javascript">
	function fn_genreChg(id){
		var memberNo = "${bean.memberNo}";
		location.href="/livre/Livre?command=main-page&memberNo="+memberNo+"&genreNo="+id;
		/* 
		$.ajax({
			url: "/livre/Livre?command=MyServletAjax",
			type:"POST",
			data:{genreNo:id},
			dataType:"json",
			success:function(data){
				JSON.stringify(data);
				if(data == "fail"){
					alert("데이터존재하지 않음");
				}else{
					alert(data.length);
				}
			},
			  error:function(result, status){
				  console.log('error');
				  console.log(result);
				  console.log('상태 메시지 : ' + status);
			  }
			
		}); */
	}
</script>
</head>

<body>
	<section>
		<div class="content-wrap">
			<div class="container">
				<div class="inner">
					<div class="box_slide_no">
						<!-- Swiper -->
						<div class="swiper mySwiper">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img src="/livre/assets/livre_banner_mainpage2.png" alt="" />
								</div>
								<div class="swiper-slide">
									<img src="/livre/assets/livre_banner_mainpage2.png" alt="" />
								</div>
								<div class="swiper-slide">
									<img src="/livre/assets/livre_banner_mainpage2.png" alt="" />
								</div>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
					<div class="box_content">
						<div class="box_calendar">
							<h2 class="title">Book Calendar</h2>
							<div class="calendar" style="text-align: center;">
								<p>
								<span id="dateSpan"></span>
								</p>
								<br> <br>

								<table id="calendar">
									<thead>
										<tr>
											<th>일</th>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
											<th>토</th>
										</tr>
									</thead>
									<tbody id="calendar-body">
									</tbody>
								</table>
							</div>
						</div>
						<form action="<%=withFormTag%>" method="get">
						    <input type="hidden" name="command" value="main-page"> <input type="hidden" id="memberNo" name="memberNo" value="${bean.memberNo}">
						    <div class="box_ranking">
						        <h2 class="title">livre ‘s ranking</h2>
						        <div class="box_liver_ranking">
						            <ol class="list_ranking">
						            	<c:forEach var="result" items="${rankList}" varStatus="status">
						            		<li class="item_ranking">
						            			<span class="number"><img src="/livre/assets/icon_${status.count}.svg" alt="" /></span> 
						            			<strong class="ranking_title">${result.bookTitle }</strong> 
						            			<span class="name">
						            				<c:choose>
														<c:when test="${fn:length(result.reviewTitle) gt 10}">
															${fn:substring(result.reviewTitle, 0, 10) }...	
														</c:when>
														<c:otherwise>
															${result.reviewTitle}
														</c:otherwise>
													</c:choose>
					            				</span>
							                    <div class="box_author">
							                        <span class="author">
							                        	<c:choose>
															<c:when test="${fn:length(result.memberNick ) gt 6}">
																${fn:substring(result.memberNick , 0, 6) }...	
															</c:when>
															<c:otherwise>
																${result.memberNick }
															</c:otherwise>
														</c:choose>
							                        </span>
							                    </div>
							                </li>
						            	</c:forEach>
						            </ol>
						        </div>
						        <h2 class="title">Genre ranking</h2>
						        <ul class="list_tab">
						            <li class="item_tab">
						                <button type="button" class="btn_tab" onclick="fn_genreChg('1');">경제</button>
						            </li>
						            <li class="item_tab">
						                <button type="button" class="btn_tab" onclick="fn_genreChg('2');">건강</button>
						            </li>
						            <li class="item_tab">
						                <button type="button" class="btn_tab" onclick="fn_genreChg('7');">만화</button>
						            </li>
						            <li class="item_tab">
						                <button type="button" class="btn_tab" onclick="fn_genreChg('5');">여행</button>
						            </li>
						            <li class="item_tab">
						                <button type="button" class="btn_tab" onclick="fn_genreChg('4');">역사</button>
						            </li>
						            <li class="item_tab">
						                <button type="button" class="btn_tab" onclick="fn_genreChg('3');">소설</button>
						            </li>
						            <li class="item_tab">
						                <button type="button" class="btn_tab" onclick="fn_genreChg('6');">기타</button>
						            </li>
						        </ul>
						        <div class="box_liver_ranking">
						            <ol class="list_ranking">
						            	<c:forEach var="result" items="${genreRankList}" varStatus="status">
						            		<li class="item_ranking">
						            			<span class="number"><img src="/livre/assets/icon_${status.count}.svg" alt="" /></span> 
						            			<strong class="ranking_title">
						            				<c:choose>
														<c:when test="${fn:length(result.bookTitle) gt 10}">
															${fn:substring(result.bookTitle, 0, 10) }...	
														</c:when>
														<c:otherwise>
															${result.bookTitle}
														</c:otherwise>
													</c:choose>
						            			</strong> 
						            			<span class="name">
						            				<c:choose>
														<c:when test="${fn:length(result.reviewTitle) gt 10}">
															${fn:substring(result.reviewTitle, 0, 10) }...	
														</c:when>
														<c:otherwise>
															${result.reviewTitle}
														</c:otherwise>
													</c:choose>
					            				</span>
							                    <div class="box_author">
							                        <span class="author">
							                        	<c:choose>
															<c:when test="${fn:length(result.memberNick ) gt 6}">
																${fn:substring(result.memberNick , 0, 6) }...	
															</c:when>
															<c:otherwise>
																${result.memberNick }
															</c:otherwise>
														</c:choose>
							                        </span>
							                    </div>
							                </li>
						            	</c:forEach>
						            </ol>
						        </div>
						    </div>
						</form>
					</div>
				</div>
			</div>
		</div>


	</section>
	

	<!-- Swiper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>


	<script>
		var today = new Date();
		var s_endDate = "";
		var s_bookimg = "";
		var p_date = "";
		var p_equalChk = "";
		var currentMonth = today.getMonth();
		var currentYear = today.getFullYear();
		var months = [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ];

		function generateCalendar(month, year) {
			var calendarBody = document.getElementById('calendar-body');
			calendarBody.innerHTML = '';

			//월 시작일
			var firstDay = new Date(year, month, 1);

			//월 종료일
			var lastDay = new Date(year, month + 1, 0);

			var startingDay = firstDay.getDay();
			var monthLength = lastDay.getDate();

			var date = 1;
			var calendarHtml = '';

			/*달력 만듦*/
			for (var i = 0; i < 6; i++) {
				var row = '<tr>';
				for (var j = 0; j < 7; j++) {
					if (i === 0 && j < startingDay) {
						row += '<td></td>';
					} else if (date > monthLength) {
						break;
					} else {
						<c:forEach var="result" items="${myReviewList}" varStatus="status">
							s_endDate = "${result.endDate}";
							s_bookImg = "${result.bookImg}";
							console.log(s_bookImg );
							p_date=year + '/' + padZero((month + 1)) + '/' + padZero(date);
							//console.log(p_date);
							if(s_endDate == p_date){
								row += '<td class="day-' + year + '-' + padZero((month + 1)) + '-' + padZero(date) + '"" id="day/' + year + '/'
								+ padZero((month + 1)) + '/' + padZero(date)
								+ '"">' + date + '<img src="/livre/dummy/'+s_bookImg+'\"></td>';
								p_equalChk = "T";
							}
						</c:forEach>
						if(p_equalChk != "T"){
							row += '<td class="day-' + year + '-'
							+ padZero((month + 1)) + '-' + padZero(date)
							+ '"" id="day/' + year + '/'
							+ padZero((month + 1)) + '/' + padZero(date)
							+ '"">' + date + '<img src="/livre/assets/blankspace.png"></td>';
						}else{
							p_equalChk = "";
						}
						/* 
						row += '<td class="day-' + year + '-'
								+ padZero((month + 1)) + '-' + padZero(date)
								+ '"" id="day/' + year + '/'
								+ padZero((month + 1)) + '/' + padZero(date)
								+ '"">' + date + '<img src="/livre/dummy/17_07.jpg"></td>';
						 */
							date++;
						
					}
				}

				row += '</tr>';
				calendarHtml += row;
				if (date > monthLength) {
					break;
				}
			}
			$('#dateSpan').text(+year + '년' + padZero((month + 1)) + "월");
			calendarBody.innerHTML = calendarHtml;
		}

		//이전달 달력 재생성
		function previousMonth() {
			currentMonth--;
			if (currentMonth < 0) {
				currentMonth = 11;
				currentYear--;
			}
			generateCalendar(currentMonth, currentYear);
		}

		//다음달 달력 재생성
		function nextMonth() {
			currentMonth++;
			if (currentMonth > 11) {
				currentMonth = 0;
				currentYear++;
			}
			generateCalendar(currentMonth, currentYear);
		}

		//0 자리표기
		function padZero(number) {
			return (number < 10 ? '0' : '') + number;
		}

		//달력 생성 최초 실행
		generateCalendar(currentMonth, currentYear);
	</script>

	<script src="/livre/js/main-page-banner.js"></script>
</body>
</html>













