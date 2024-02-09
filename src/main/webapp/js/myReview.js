// 삭세하기 버튼 누르면 x 버튼 나오기
// 추후 글자도 바꾸기
function xBtn(){
	
	const xBtn = document.getElementsByClassName('del');
	
	// x버튼 숨기기
	 for (let i = 0; i < xBtn.length; i++) {
	    
		if(xBtn[i].style.visibility == 'hidden') {
	
		    // 보이기
		    xBtn[i].style.visibility = 'visible';
	
		  } else {
			
		    xBtn[i].style.visibility = 'hidden';
	  }
	}
}

