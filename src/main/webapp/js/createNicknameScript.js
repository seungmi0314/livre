// 랜덤 닉네임 설정
var nicknames = ["21세기 윤동주", "현명한 백석", "책읽는 셰익스피어", "지혜로운 트루먼", "문학소년 소크라테스"];

window.onload = function() {
    var randomIndex = Math.floor(Math.random() * nicknames.length);
    var randomNickname = nicknames[randomIndex];
    var nicknameInput = document.querySelector('input[type="text"]');
    nicknameInput.value = randomNickname;
};

// 이미지 선택 시 보더 주기
function selectJenre(id) {
    var imageToShowBorder = document.getElementById(id);
    imageToShowBorder.classList.toggle('showBorder');
}

// 이미지 선택 여부를 추적하기 위한 변수
var selectedImages = [];

function trackSelectedImages(id) {
    var imageToShowBorder = document.getElementById(id);
    var index = selectedImages.indexOf(id);

    if (index === -1) {
        if (selectedImages.length < 1) {
            selectedImages.push(id);
            imageToShowBorder.classList.add('showBorder');
        }
    } else {
        selectedImages.splice(index, 1);
        imageToShowBorder.classList.remove('showBorder');
    }
}



// 다음 페이지로 이동
function moveToNextPage() {
    var inputNickname = document.querySelector('input[type="text"]').value;

    if (inputNickname.trim().length < 2) {
        alert("두 자리 이상의 멋진 별명을 지어주세요.");
        return;
    }

    window.location.href = "/Mylivre/member/finalCheck.jsp";
}

// 이전 페이지로 이동
function goToPreviousPage() {
    history.back();
}