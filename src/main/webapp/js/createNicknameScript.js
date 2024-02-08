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
		

        
        // 초기 진행 상태 설정
        var progress = 80;

        // 진행 상태 갱신 함수
        function updateProgress() {
            var progressBar = document.getElementById('progress');
            var progressText = document.getElementById('progressText');

            // 진행도 업데이트
            progressBar.style.width = progress + '%';
            progressText.innerText = progress + '%';
            
            // 다음 진행 상태로 이동
            if (progress < 100) {
                progress++;
            }
        }

        // 10ms마다 진행 상태 업데이트
        setInterval(updateProgress, 10);
        
        function moveToNextPage() {
            // 입력 필드의 값을 가져옵니다.
            var inputNickname = document.querySelector('input[type="text"]').value;

            // 입력 값의 길이를 확인하고, 두 자리 이상인지 여부를 검사합니다.
            if (inputNickname.trim().length < 2) {
                // 두 자리 미만인 경우
                alert("두 자리 이상의 멋진 별명을 지어주세요.");
                return; // 다음으로 넘어가지 않음
            }

            // 입력 값이 유효한 경우 다음 페이지로 이동합니다.
            window.location.href = "/Mylivre/member/finalCheck.jsp"; // 다음 페이지 주소를 입력하세요.
        }
        
     // preButton을 눌렀을 때 이전 페이지로 돌아가는 함수
        function goToPreviousPage() {
            history.back(); // 브라우저의 이전 페이지로 이동
        }
        
        
        
