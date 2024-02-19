<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common3.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="./../css/main-page.css" />
<link rel="stylesheet" href="./../css/header.css" />
<link rel="stylesheet" href="./../css/menu.css" />
<link rel="icon" href="/livre/assets/favicon.png">

<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<title>메인 페이지</title>

</head>

<body>
	<form action="<%=withFormTag%>" method="get">
		<input type="hidden" name="command" value="main-page">
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
								<div class="calendar">
									<!-- <img src="/livre/assets/calendar.png" alt="" /> -->
									<button onclick="previousMonth()">이전 달</button>
									<span id="dateSpan"></span>
									<button onclick="nextMonth()">다음 달</button>
									<br>
									<br>

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
							<div class="box_ranking">
								<h2 class="title">livre ‘s ranking</h2>
								<div class="box_liver_ranking">
									<ol class="list_ranking">
										<li class="item_ranking"><span class="number"><img
												src="/livre/assets/icon_1.svg" alt="" /></span> <strong
											class="ranking_title">오펜하이머</strong> <span class="name">파멸의
												작곡가 : 오펜하이머</span>
											<div class="box_author">
												<span class="author">밀리</span>
											</div></li>
										<li class="item_ranking"><span class="number"><img
												src="/livre/assets/icon_2.svg" alt="" /></span> <strong
											class="ranking_title">어서오세요, 휴남동 서점</strong> <span
											class="name">휴남동의 봄</span>
											<div class="box_author">
												<span class="author">Chhj923</span>
											</div></li>
										<li class="item_ranking"><span class="number"><img
												src="/livre/assets/icon_3.svg" alt="" /></span> <strong
											class="ranking_title">반지의 제왕</strong> <span class="name">프로도의
												삶은 ..</span>
											<div class="box_author">
												<span class="author">FBK33</span>
											</div></li>
										<li class="item_ranking"><span class="number"><img
												src="/livre/assets/icon_4.svg" alt="" /></span> <strong
											class="ranking_title">남산의 부장들</strong> <span class="name">자리와
												권력</span>
											<div class="box_author">
												<span class="author">Ghy13</span>
											</div></li>
									</ol>
								</div>
								<h2 class="title">Genre ranking</h2>
								<ul class="list_tab">
									<li class="item_tab">
										<button type="button" class="btn_tab">경제</button>
									</li>
									<li class="item_tab">
										<button type="button" class="btn_tab">건강</button>
									</li>
									<li class="item_tab">
										<button type="button" class="btn_tab">만화</button>
									</li>
									<li class="item_tab">
										<button type="button" class="btn_tab">여행</button>
									</li>
									<li class="item_tab">
										<button type="button" class="btn_tab">역사</button>
									</li>
									<li class="item_tab">
										<button type="button" class="btn_tab">희곡</button>
									</li>
									<li class="item_tab">
										<button type="button" class="btn_tab">기타</button>
									</li>
								</ul>
								<div class="box_liver_ranking">
									<ol class="list_ranking">
										<li class="item_ranking"><span class="number"><img
												src="/livre/assets/icon_1.svg" alt="" /></span> <strong
											class="ranking_title">오펜하이머</strong> <span class="name">파멸의
												작곡가 : 오펜하이머</span>
											<div class="box_author">
												<span class="author">밀리</span>
											</div></li>
										<li class="item_ranking"><span class="number"><img
												src="/livre/assets/icon_2.svg" alt="" /></span> <strong
											class="ranking_title">어서오세요, 휴남동 서점</strong> <span
											class="name">휴남동의 봄</span>
											<div class="box_author">
												<span class="author">Chhj923</span>
											</div></li>
										<li class="item_ranking"><span class="number"><img
												src="/livre/assets/icon_3.svg" alt="" /></span> <strong
											class="ranking_title">반지의 제왕</strong> <span class="name">프로도의
												삶은 ..</span>
											<div class="box_author">
												<span class="author">FBK33</span>
											</div></li>
										<li class="item_ranking"><span class="number"><img
												src="/livre/assets/icon_4.svg" alt="" /></span> <strong
											class="ranking_title">남산의 부장들</strong> <span class="name">자리와
												권력</span>
											<div class="box_author">
												<span class="author">Ghy13</span>
											</div></li>
									</ol>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</section>
	</form>

	<!-- Swiper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>


	<script>
		var today = new Date();
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
						row += '<td class="day-' + year + '-'
								+ padZero((month + 1)) + '-' + padZero(date)
								+ '"">' + date + '</td>';
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