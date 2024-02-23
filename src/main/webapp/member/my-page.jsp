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
    }
    
    function fn_meDelete(memberNo){
    	if(confirm("정말 탈퇴 하시겠습니까?")){
    		location.href="/livre/Livre?command=meDelete&memberNo="+memberNo;
    	}
    }
			
    </script>

</head>

<body>

	<form action="<%=withFormTag%>" method="post">
		<input type="hidden" name="command" value="my-page">
		<input type="hidden" id="memberNo" name="memberNo" value="${bean.memberNo}">
		<input type="hidden" id="genreList" name="genreList" value="${bean.genreList}">
		<div class="content-warp">
			<section>
				<div class="section-1">
					<div class="section-1-top">
						<ul>
							<li>
								<c:choose>
									<c:when test="${bean.rankNo == 0}">
							            새싹
							        </c:when>
							        <c:when test="${bean.rankNo == 1}">
							            새싹
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
							            리버
							        </c:when>
    							</c:choose>
    						</li>
							<li>
								<c:choose>
									<c:when test="${fn:length(bean.memberNick) gt 6}">
										${fn:substring(bean.memberNick, 0, 6) }..	
									</c:when>
									<c:otherwise>
										${bean.memberNick}
									</c:otherwise>
								</c:choose>
							</li>
							<li><img src="/livre/assets/security_mypage.png"></li>
							<li><a href="/livre/Livre?command=updatePassword&memberNo=${sessionScope.logInfo.memberNo}">비밀번호 설정</a></li>
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
						        <li>
						        	<img src="/livre/assets/username_mypage.png"> 
						        	<input class="profile_input" type="text" id="memberNick" name="memberNick" value="${bean.memberNick}" placeholder="천재만재류건희">
						        </li>
						        <li>
						        	<img src="/livre/assets/gender_mypage.png"> 
						        	<input class="profile_input" type="text" id="fakegender" name="fakegender" value="${bean.gender}" placeholder="남자" disabled="disabled">
						            <input type="hidden" id="gender" name="gender" value="${bean.gender}">
					            </li>
						        <li>
						        	<img src="/livre/assets/address_mypage.png"> 
						        	<input class="profile_input" type="text" id="name" name="address" value="${bean.address}" placeholder="서울시 마포구">
					        	</li>
						    </ul>
						    <div class="update-set">
						        <div class="btn-left">
						            <img src="/livre/assets/octicon_trash-24.png"><a href="#" onclick="fn_meDelete('${bean.memberNo}');">회원탈퇴</a>
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
							            	새싹
							        	</c:when>
								        <c:when test="${bean.rankNo == 1}">
								            새싹
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
								        <c:when test="${bean.rankNo == 4}">
								            리버
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
							            	실버
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
								            리버
								        </c:when>
    								</c:choose>
								</span>
							</div>
						</div>
					</div>
					<div class="section-1-bottom">
						<p>관심 분야</p>
						<div class="bottom-layout">
							<c:set var="genresList1" value="${fn:split(bean.genreList, ',')}" /> 
							<c:set var="genresLength" value="${fn:length(genresList1)}" />
							<c:set var="countChk" value="1"/>
							<c:forEach var="result1" items="${genresList1}" varStatus="status">
								<c:forEach var="result2" items="${genresList}" varStatus="status">
									<c:choose>
										<c:when test="${result1 eq result2.genreno and countChk eq genresLength}">
											<div>
												<img src="/livre/assets/hobby_mypage.png">
												<p>${result2.genre}</p>
											</div>
										</c:when>
										<c:when test="${result1 eq result2.genreno}">
											<c:set var="countChk" value="${countChk+1}"/>
											<div>
												<img src="/livre/assets/hobby_mypage.png">
												<p>${result2.genre}</p>
											</div>
										</c:when>
										<c:otherwise>
										
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
							</c:forEach>
						</div>
						<div class="update-set">

				
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
								<c:forEach var="result" items="${likeReviewList}" varStatus="status">
									<li>
										<img src="/livre/dummy/${result.bookimg }">
										<div class="content-layout2">
											<div class="content-title">
												<c:choose>
													<c:when test="${fn:length(result.reviewtitle) gt 15}">
														제목 : ${fn:substring(result.reviewtitle, 0, 19) }...	
													</c:when>
													<c:otherwise>
														제목 : ${result.reviewtitle}
													</c:otherwise>
												</c:choose>
											</div>
											<div class="content-text">
												<c:choose>
													<c:when test="${fn:length(result.reviewtext) gt 60 }">
														내용 : ${fn:substring(result.reviewtext, 0, 60) }...	
													</c:when>
													<c:otherwise>
														내용 : ${result.reviewtext}
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="section2-bottom">
							<img src="/livre/assets/view_all_bookmarks_mypage.png">
							<a href="/livre/Livre?command=myFavoriteReview&memberNo=${bean.memberNo}">전체보기</a>
						</div>
					</div>
					<div class="section-3">
						<div class="section-3-top">
							<img src="/livre/assets/my_pick_mypage.png">
							<p>My Pick</p>
						</div>
						<div class="section-3-content">
							<c:choose>
								<c:when test="${fn:length(myReview.phrase) gt 60 }">
									${fn:substring(myReview.phrase, 0, 60) }...	
								</c:when>
								<c:otherwise>
									<p>${myReview.phrase}</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</section>
		</div>
	</form>
</body>
</html>