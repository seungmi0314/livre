<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common3.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/livre/css/my-page.css">

<title>마이 페이지</title>
<script type="text/javascript">
    $(document).ready(function() {
			
	});
    function validCheck(){/* form validation check */
			var memberNick = $('#memberNick').val();  			
			
			if(memberNick.length < 4 || memberNick.length > 10){
				alert('닉네임은 4자리 이상 10자리 이하로 입력해 주세요.');
				return false ; /* false이면 이벤트 전파 방지 */
			}
	
			
    </script>

</head>

<body>

	<form action="<%=withFormTag%>" method="post">
		<input type="hidden" name="command" value="my-page">
		<input type="hidden" id="memberNo" name="memberNo" value="${bean.memberNo}">
		<div class="content-warp">
			<section>
				<div class="section-1">
					<div class="section-1-top">
						<ul>
							<li>
								<c:choose>
									<c:when test="${bean.rankNo == 0}">
							            브론즈
							        </c:when>
							        <c:when test="${bean.rankNo == 1}">
							            브론즈
							        </c:when>
							        <c:when test="${bean.rankNo == 2}">
							            실버
							        </c:when>
							        <c:when test="${bean.rankNo == 3}">
							            골드
							        </c:when>
							        <c:when test="${bean.rankNo == 4}">
							            플레
							        </c:when>
							        <c:when test="${bean.rankNo == 5}">
							            다이아
							        </c:when>
    							</c:choose>
    						</li>
							<li>${bean.memberNick}</li>
							<li><img src="/livre/assets/security_mypage.png"></li>
							<li><a href="">비밀번호 설정</a></li>
						</ul>
					</div>
					<div class="section-1-mid">
						<div class="mid-left">
							<img src="/livre/assets/my page.png">
								<c:choose>
							        <c:when test="${bean.memberImg eq null}">
							            <img src="/livre/assets/profile_mypage.png">
							        </c:when>
							        <c:when test="${bean.memberImg ne null}">
							            <img src="/livre/assets/${bean.memberImg}">
							        </c:when>
    							</c:choose>
								<span>
									<a href="/livre/Livre?command=ImgUpdate&memberNo=${sessionScope.logInfo.memberNo}" target="_blank">수정
									</a>
								</span>
						</div>
						<div class="mid-right">
							<p>프로필</p>
							<ul>
								<li><img src="/livre/assets/username_mypage.png"> <input
									class="profile_input" type="text" id="memberNick"
									name="memberNick" value="${bean.memberNick}"></li>
								<li><img src="/livre/assets/gender_mypage.png"> <input
									class="profile_input" type="text" id="fakegender"
									name="fakegender" value="${bean.gender}" disabled="disabled">
									<input type="hidden" id="gender" name="gender"
									value="${bean.gender}"></li>
								<li><img src="/livre/assets/address_mypage.png"> <input
									class="profile_input" type="text" id="name" name="address"
									value="${bean.address}"></li>
							</ul>
							<div class="update-set">
								<div class="btn-left">
									<img src="/livre/assets/octicon_trash-24.png"><a href="">회원탈퇴</a>
								</div>
								<div class="btn-right">
									<img src="/livre/assets/edit_bookmark.png">
									<button type="submit" onclick="return validCheck();">등록/수정</button>
								</div>
							</div>
						</div>

					</div>
					<div class="section-1-mid2">
						<p>등급</p>
						<div class="content-layout">
							<div class="mid2-left">
								<img src="/livre/assets/rank_first.png"> 
								<span>
									<c:choose>
										<c:when test="${bean.rankNo == 0}">
							            	브론즈
							        	</c:when>
								        <c:when test="${bean.rankNo == 1}">
								            브론즈
								        </c:when>
								        <c:when test="${bean.rankNo == 2}">
								            실버
								        </c:when>
								        <c:when test="${bean.rankNo == 3}">
								            골드
								        </c:when>
								        <c:when test="${bean.rankNo == 4}">
								            플레
								        </c:when>
								        <c:when test="${bean.rankNo == 5}">
								            다이아
								        </c:when>
    								</c:choose>
								</span>
							</div>
							<div class="mid2-mid">
								<div class="mid2-background">
									<div class="mid2-inner-background"></div>
								</div>

								<span>다음 단계까지 열심히 해봐요!</span>
							</div>
							<div class="mid2-right">
								<img src="/livre/assets/rank_second.png"> 
								<span>
									<c:choose>
										<c:when test="${bean.rankNo == 0}">
							            	브론즈
							        	</c:when>
								        <c:when test="${bean.rankNo == 1}">
								            실버
								        </c:when>
								        <c:when test="${bean.rankNo == 2}">
								            골드
								        </c:when>
								        <c:when test="${bean.rankNo == 3}">
								            플레
								        </c:when>
								        <c:when test="${bean.rankNo == 4}">
								            다이아
								        </c:when>
    								</c:choose>
								</span>
							</div>
						</div>
					</div>
					<div class="section-1-bottom">
						<p>관심 분야</p>
						<div class="bottom-layout">
							<div>
								<img src="/livre/assets/hobby_mypage.png">
								<p>스포츠</p>
							</div>
							<div>
								<img src="/livre/assets/hobby2_mypage.png">
								<p>건강/취미</p>
							</div>
							<div>
								<img src="/livre/assets/hobby3_mypage.png">
								<p>소설/시/희곡</p>
							</div>
						</div>
						<div class="update-set">

							<div class="btn-right">
								<img src="/livre/assets/edit_bookmark.png"><a href="">등록/수정</a>
							</div>
						</div>
					</div>
				</div>
				<div class="section-right">
					<div class="section-2">
						<div class="section-2-top">
							<img src="/livre/assets/bookmarks_mypage.png">
							<p>내가 좋아요 한 목록</p>
						</div>
						<div class="section-2-content">
							<ul>
								<li><img src="/livre/assets/book_example_mypage.png">
									<div class="content-layout2">
										<div class="content-title">
											제목 : 수제비를 공부하고 서울사이버 대학에..<span><img
												src="/livre/assets/fill-star.svg"><img
												src="/livre/assets/fill-star.svg"><img
												src="/livre/assets/fill-star.svg"><img
												src="/livre/assets/fill-star.svg"><img
												src="/livre/assets/fill-star.svg"></span>
										</div>
										<div class="content-text">
											야호를 한번 하면 야호지만, 야호를 두번하면 야호야호다.<br> 그리고 수제비는 맛있기 때문에
											수제비를 공부했고 야호야호 호야야...
										</div>
									</div></li>
								<li><img src="/livre/assets/book_example_mypage.png">
									<div class="content-layout2">
										<div class="content-title">
											제목 : 명작은 두번 봐도 명작이다.<span><img
												src="/livre/assets/fill-star.svg"><img
												src="/livre/assets/fill-star.svg"><img
												src="/livre/assets/stroke-star.svg"><img
												src="/livre/assets/stroke-star.svg"><img
												src="/livre/assets/stroke-star.svg"></span>
										</div>
										<div class="content-text">
											왜 똑같은 책을 두번 샀냐하면 이 계정주인이 홍진호 이기 때문이다.<br> 왜 똑같은 책을 두번
											샀냐하면 이 계정주인이 홍진호 이기 때문...
										</div>
									</div></li>
								<li><img src="/livre/assets/book_example_mypage.png">
									<div class="content-layout2">
										<div class="content-title">
											제목 : 3번 보는건 사진을 가져오기 귀찮아서가...<span><img
												src="/livre/assets/stroke-star.svg"><img
												src="/livre/assets/stroke-star.svg"><img
												src="/livre/assets/stroke-star.svg"><img
												src="/livre/assets/stroke-star.svg"><img
												src="/livre/assets/stroke-star.svg"></span>
										</div>
										<div class="content-text">
											신나가지고 1절, 2절, 3절에 이어 뇌절을 하고있다.<br> 사실 3트를하고 기사를 못딴다면 이
											책의 가치를 의심해 볼 필요가 있...
										</div>
									</div></li>
							</ul>
						</div>
						<div class="section2-bottom">
							<img src="/livre/assets/view_all_bookmarks_mypage.png"><a
								href="">전체보기</a>
						</div>
					</div>
					<div class="section-3">
						<div class="section-3-top">
							<img src="/livre/assets/my_pick_mypage.png">
							<p>My Pick</p>
						</div>
						<div class="section-3-content">
							<p>진정한 작가에게, 매 작품은성취감을 넘어 무언가를 다시 시도하는새로운 시작이어야 한다</p>
						</div>
					</div>
				</div>
			</section>
		</div>
	</form>

</body>
</html>