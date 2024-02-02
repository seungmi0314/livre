
	//아이콘 선택시 보더 주기
	// 아이콘 선택시 보더 주기
	function selectJenre(id) {

		var imageToShowBorder = document.getElementById(id);
		imageToShowBorder.classList.toggle('showBorder');
	}

	// 이미지 선택 여부를 추적하기 위한 변수
	var selectedImages = [];

	function selectJenre(id) {
		var imageToShowBorder = document.getElementById(id);

		// 이미 선택된 이미지인지 확인
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

	// 아래 함수는 progress가 100일 때 호출되어 텍스트를 변경합니다.
	function updateProgressText() {
		var progressText = document.getElementById('progressText');
		if (progress === 100) {
			progressText.innerText = 'Finish!';
		} else {
			progressText.innerText = progress + '%';
		}
	}

	// 초기 진행 상태 설정
	var progress = 100;

	// 진행 상태 갱신 함수
	function updateProgress() {
		var progressBar = document.getElementById('progress');

		// 진행도 업데이트
		progressBar.style.width = progress + '%';
		updateProgressText(); // 텍스트 업데이트 호출

		// 다음 진행 상태로 이동
		if (progress < 100) {
			progress++;
		}
	}

	// 10ms마다 진행 상태 업데이트
	setInterval(updateProgress, 5);

	function moveToNextPage() {
		// 여기에 다음 페이지로 이동하는 코드를 추가합니다.
		window.location.href = "celebrate.jsp"; // 다음 페이지의 URL을 입력하세요.
	}

	// preButton을 눌렀을 때 이전 페이지로 돌아가는 함수
	function goToPreviousPage() {
		history.back(); // 브라우저의 이전 페이지로 이동
	}
