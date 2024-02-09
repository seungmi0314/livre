<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../common/common2.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>livre</title>
	<link rel="stylesheet" href="/livre/css/bookList.css">
	<script type="text/javascript">
		$(document).ready(function(){
	        /* 필드 검색시 체크한 콤보박스 상태 보존 */
	        var optionList = $('#mode option'); /* 옵션 목록 */
	        for (var i = 0; i < optionList.length; i++) {
	            if (optionList[i].value == '${requestScope.paging.mode}') {
	                optionList[i].selected = true;
	            }
	        }
	
	        /* 필드 검색시 입력한 keyword 내용 보존 */
	        $('#keyword').val('${requestScope.paging.keyword}');
    	});
	</script>
</head>
<body>

	<section>

		<!-- 검색창 -->
		<form action="<%=withFormTag%>" method="get">
		<input type="hidden" name="command" value="bookList">
			<div class="d-flex bd-highlight search-box-p">
				<div class="p-2 flex-fill bd-highlight searchbox-btn">
					<input class="search-box" type="text" id="keyword" name="keyword" placeholder="검색어를 입력해 주세요.">
				</div>
				<div class="p-2 flex-shrink-1 bd-highlight">
					<button class="search-btn" type="submit">
						<img src="/livre/assets/search.svg" class="search-btn-default">
						<img src="/livre/assets/red-search.svg" class="search-btn-red">
					</button>
				</div>
			</div>
		
			<!-- 검색 결과 텍스트 -->
			<div class="result-text-div">
	            <span class="result-text">"${requestScope.keyword}"에 대한 ${requestScope.paging.pagingStatus}의 검색 결과</span>
	            <!-- 장르별 선택 -->
	            <select class="select-genre" id="mode" name="mode">
            		<option value="all">전체 검색</option>
	            	<optgroup label="장르 검색">
		            	<option value="1">경영/경제</option>
		            	<option value="2">건강/취미</option>
		            	<option value="3">어린이</option>
		            	<option value="4">역사</option>
		            	<option value="5">여행</option>
		            	<option value="6">과학</option>
		            	<option value="7">만화</option>
		            	<option value="8">정치/사회</option>
		            	<option value="9">소설/시/희곡</option>
		            	<option value="10">예술/대중문화</option>
		            	<option value="11">요리/살림</option>
		            	<option value="12">인문학</option>
		            	<option value="13">자기계발</option>
		            	<option value="14">종교/역학</option>
		            	<option value="15">청소년</option>
		            	<option value="16">컴퓨터/모바일</option>
		            	<option value="17">가정/원예/인테리어</option>
		            	<option value="18">스포츠</option>
	            	</optgroup>
	            </select>
	        </div>
	        
		</form>
		<!-- 검색 결과 책 -->
		<div class="result-all">
		
			<c:forEach var="bean" items="${dataList}">
				<div class="result-card">
					<a href="<%=notWithFormTag%>bookDetail&bookNo=${bean.bookNo}">
					<span>
						<img class="book-img" src="/livre/dummy/${bean.bookImg}">
					</span>
					</a>
					<p class="book-title">${bean.bookTitle}</p>
					<p>${bean.author} | ${bean.publisher}</p>
				</div>
			</c:forEach>
			
		</div>
			
		 
	</section>



</body>
</html>