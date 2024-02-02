	//다음 페이지로 이동하는 함수
	function moveToNextPage() {
		var useAgreeChecked = document.getElementById('useAgreeCheckbox').checked;
		var infoAgreeChecked = document.getElementById('infoAgreeCheckbox').checked;

		if (!useAgreeChecked || !infoAgreeChecked) {
			alert('모든 필수 항목에 동의해주세요.');
			return;
		}

		var nextPageURL = "collectPreferenceFisrst.jsp";
		window.location.href = nextPageURL;
	}
	
	   // 전체 동의 체크박스 클릭 시 모든 필수 약관에 체크를 동기화하는 함수
    function checkAll() {
        var allCheckbox = document.getElementById('allCheckbox');
        var useAgreeCheckbox = document.getElementById('useAgreeCheckbox');
        var infoAgreeCheckbox = document.getElementById('infoAgreeCheckbox');
        var marketingAgreeCheckbox = document.getElementById('marketingAgreeCheckbox');

        // 전체 동의 체크박스가 체크되었는지 확인
        if (allCheckbox.checked) {
            // 전체 동의 체크박스가 체크된 경우 모든 필수 약관에 체크를 동기화
            useAgreeCheckbox.checked = true;
            infoAgreeCheckbox.checked = true;
            marketingAgreeCheckbox.checked = true;
        } else {
            // 전체 동의 체크박스가 체크 해제된 경우 모든 필수 약관에 체크를 해제
            useAgreeCheckbox.checked = false;
            infoAgreeCheckbox.checked = false;
            marketingAgreeCheckbox.checked = false;
        }
    }
