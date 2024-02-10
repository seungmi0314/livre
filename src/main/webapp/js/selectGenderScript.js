// 아이콘 선택시 보더 주기
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
        if (selectedImages.length < 1) {
            // 선택된 이미지가 1개 미만인 경우 선택
            selectedImages.push(id);
            imageToShowBorder.classList.add('showBorder');
        }
    } else {
        // 이미 선택된 경우 다시 클릭하면 선택 취소
        selectedImages.splice(index, 1);
        imageToShowBorder.classList.remove('showBorder');
    }
}

// 초기 진행 상태 설정
var progress = 40;

// 진행 상태 갱신 함수
function updateProgress() {
    var progressBar = document.getElementById('progress');
    var progressText = document.getElementById('progressText');

    // 진행도 업데이트
    progressBar.style.width = progress + '%';
    progressText.innerText = progress + '%';

    // 다음 진행 상태로 이동
    if (progress < 60) {
        progress++;
    }
}

// 10ms마다 진행 상태 업데이트
setInterval(updateProgress, 10);

function moveToNextPage() {
    // 다음 페이지로 이동합니다.
    window.location.href = "/livre/member/createNickname.jsp";
}

// preButton을 눌렀을 때 이전 페이지로 돌아가는 함수
function goToPreviousPage() {
    history.back(); // 브라우저의 이전 페이지로 이동
}

// 이미지 선택 함수
function selectGender(gender) {
    // 모든 이미지에서 보더 스타일 제거
    var allImages = document.querySelectorAll('img');
    allImages.forEach(function(img) {
        img.classList.remove('showBorder');
    });

    // 선택된 이미지에 보더 스타일 추가
    var selectedImage = document.getElementById(gender + 'Icon');
    selectedImage.classList.add('showBorder');
}