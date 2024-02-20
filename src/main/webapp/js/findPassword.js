$(document).ready(function() {
	// 초기에 모든 invalid-feedback 요소를 숨깁니다.
	$('.invalid-feedback').hide();

	// 이메일 입력란에 키 입력 이벤트 핸들러 추가
	$('#memberEmail').keyup(function() {
		// 이메일 입력란에 텍스트가 입력되는 순간 invalid-feedback 숨김
		$('#validEmail').hide();
	});

	// 폼 제출 이벤트 핸들러 추가
	$('#findPasswordForm').on('submit', function(e) {
		return validCheck(); // 유효성 검사를 수행하고 결과에 따라 폼 제출을 결정
	});
});

function validCheck() {
	// 이메일 유효성 검사 실행
	return checkEmail();
}
