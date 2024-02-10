$(document).ready(function(){
    $('.password i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type','password');
        }
    });
});







 
/*// 페이지 로드 시 실행되는 함수
window.onload = function() {
    // 쿠키 또는 로컬 스토리지에서 이메일을 가져와서 입력 필드에 설정
    var rememberedEmail = getCookie("rememberedEmail") || localStorage.getItem("rememberedEmail");
    if (rememberedEmail) {
        document.getElementById("memberEmail").value = rememberedEmail;
        document.getElementById("remember-check").checked = true;
    } else {
        // 기존에 저장된 정보가 없을 경우에는 체크박스 해제
        document.getElementById("remember-check").checked = false;
    }
};

// 로그아웃 버튼 클릭 시 실행되는 함수
function logout() {
    // 로컬 스토리지에서 이메일 삭제
    localStorage.removeItem("rememberedEmail");
    // 이후 로그아웃 처리 등을 수행
}

// 폼 제출 시 실행되는 함수
function submitForm() {
    var email = document.getElementById("memberEmail").value;
    var rememberCheckbox = document.getElementById("remember-check");
    
    // 쿠키 또는 로컬 스토리지에 이메일 저장
    if (rememberCheckbox.checked) {
        document.cookie = "rememberedEmail=" + email + "; expires=Fri, 31 Dec 9999 23:59:59 GMT; path=/";
        localStorage.setItem("rememberedEmail", email);
    } else {
        // 체크되어 있지 않을 경우 로컬 스토리지에서 이메일 삭제
        localStorage.removeItem("rememberedEmail");
    }

    // 이후 폼 제출 등을 수행
}
*/