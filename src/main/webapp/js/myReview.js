// 삭세하기 버튼 누르면 x 버튼 나오기
// 추후 글자도 바꾸기
function xBtn(){
	
	const xBtn = document.getElementsByClassName('del');
	
	// x버튼 숨기기
	 for (let i = 0; i < xBtn.length; i++) {
	    // x버튼 숨기기
		if(xBtn[i].style.visibility !== 'hidden') {
	
		    xBtn[i].style.visibility = 'hidden';
	
		  } else {
			// 보이기
		    xBtn[i].style.visibility = 'visible';
	  }
	}
}

/* 독후감 삭제 */
function deleteReview(reviewNo, paramList){
	/* no : 삭제될 게시물 번호, paramList : 페이징 관련 파라미터들 */
		
		var response = window.confirm('해당 게시물을 삭제하시겠습니까?');
		
		if(response==true){
			var url = '<%=notWithFormTag%>reviewDel&reviewno=' + reviewNo + paramList;
			/*alert(url);*/
			location.href = url ;
		
		}else{
			alert('게시물 삭제가 취소되었습니다.');
			return false ;
		}
}


