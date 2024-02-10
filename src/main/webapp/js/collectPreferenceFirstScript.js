
//아이콘 선택시 보더 주기
function selectJenre(id) {
    var imageToShowBorder = document.getElementById(id);
    imageToShowBorder.classList.toggle('showBorder');
}

// 이미지 선택 여부를 추적하기 위한 변수
var selectedImages = [];

function selectJenre(id) {
    var imageToShowBorder = document.getElementById(id);
    var index = selectedImages.indexOf(id);

    if (index === -1) {
        // 선택되지 않은 경우
        selectedImages.push(id);
        imageToShowBorder.classList.add('showBorder');
    } else {
        // 이미 선택된 경우 다시 클릭하면 선택 취소
        selectedImages.splice(index, 1);
        imageToShowBorder.classList.remove('showBorder');
    }
}

// 초기 진행 상태 설정
var progress = 0;

// 진행 상태 갱신 함수
function updateProgress() {
    var progressBar = document.getElementById('progress');
    var progressText = document.getElementById('progressText');

    // 진행도 업데이트
    progressBar.style.width = progress + '%';
    progressText.innerText = progress + '%';

    // 다음 진행 상태로 이동
    if (progress < 20) {
        progress++;
    }
}

// 10ms마다 진행 상태 업데이트
setInterval(updateProgress, 10);

function moveToNextPage() {
    // 선택된 이미지 개수 확인
    var selectedImageCount = document.querySelectorAll('.showBorder').length;

    // 다음 페이지로 이동합니다.
    window.location.href = "/livre/member/collectPreferenceSecond.jsp";
}
