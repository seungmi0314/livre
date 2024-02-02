    	 // 초기 진행 상태 설정
        var progress = 60;

        // 진행 상태 갱신 함수
        function updateProgress() {
            var progressBar = document.getElementById('progress');
            var progressText = document.getElementById('progressText');

            // 진행도 업데이트
            progressBar.style.width = progress + '%';
            progressText.innerText = progress + '%';
            
            // 다음 진행 상태로 이동
            if (progress < 80) {
                progress++;
            }
        }

        // 10ms마다 진행 상태 업데이트
        setInterval(updateProgress, 10);
        
        
        function moveToNextPage() {
            // 입력 필드의 값을 가져옵니다.
            var inputGoal = document.querySelector('input[type="number"]').value;

            // 입력 필드의 값이 비어 있는지 확인합니다.
            if (inputGoal.trim() === "") {
                // 값이 비어 있는 경우
                alert("목표 권수를 기입해주세요!");
                return; // 다음으로 넘어가지 않음
            }

            // 입력 값이 유효한 경우 다음 페이지로 이동합니다.
            window.location.href = "createNickname.jsp"; // 다음 페이지 주소를 입력하세요.
        }
        
        // preButton을 눌렀을 때 이전 페이지로 돌아가는 함수
        function goToPreviousPage() {
            history.back(); // 브라우저의 이전 페이지로 이동
        }
        
        
        