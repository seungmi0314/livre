// 이미지 선택 여부를 추적하기 위한 변수
var selectedImages = [];

function selectJenre(id) {
    var imageToShowBorder = document.getElementById(id);

    // 이미지를 선택하거나 선택을 취소합니다.
    imageToShowBorder.classList.toggle('showBorder');

    // 선택된 이미지인지 확인
    var index = selectedImages.indexOf(id);

    if (index === -1) {
        // 선택되지 않은 경우 선택 목록에 추가
        selectedImages.push(id);
    } else {
        // 이미 선택된 경우 선택 목록에서 제거
        selectedImages.splice(index, 1);
    }
}

function moveToNextPage() {
    // 선택된 이미지 개수 확인
    var selectedImageCount = document.querySelectorAll('.showBorder').length;

    // 선택된 이미지가 없어도 다음 페이지로 이동
    window.location.href = "/Mylivre/member/collectPreferenceSecond.jsp";
}