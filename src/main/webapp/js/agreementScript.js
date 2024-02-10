	//다음 페이지로 이동하는 함수
	function moveToNextPage() {
		var useAgreeChecked = document.getElementById('useAgreeCheckbox').checked;
		var infoAgreeChecked = document.getElementById('infoAgreeCheckbox').checked;

		if (!useAgreeChecked || !infoAgreeChecked) {
			alert('모든 필수 항목에 동의해주세요.');
			return;
		}

		var nextPageURL = "/livre/member/collectPreferenceFisrst.jsp";
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
    
// 개별 동의 체크박스가 변경될 때 모두 동의 체크박스 상태를 확인하고 변경하는 함수
function checkIndividual() {
    var allCheckbox = document.getElementById('allCheckbox');
    var useAgreeCheckbox = document.getElementById('useAgreeCheckbox');
    var infoAgreeCheckbox = document.getElementById('infoAgreeCheckbox');
    var marketingAgreeCheckbox = document.getElementById('marketingAgreeCheckbox');

    // 모든 필수 약관이 동의되어 있는 상태에서 하나라도 해제될 경우
    if (!useAgreeCheckbox.checked || !infoAgreeCheckbox.checked || !marketingAgreeCheckbox.checked) {
        allCheckbox.checked = false; // 모두 동의 체크박스도 해제
    } else {
        // 모든 필수 약관이 동의되어 있는 경우
        allCheckbox.checked = true; // 모두 동의 체크박스도 체크
    }

    // 다른 체크 박스들 중 하나라도 해제되면, 모두 동의 체크박스도 체크 해제
    if (!useAgreeCheckbox.checked || !infoAgreeCheckbox.checked || !marketingAgreeCheckbox.checked) {
        allCheckbox.checked = false;
    }
}