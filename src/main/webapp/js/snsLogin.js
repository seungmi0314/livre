//페이지 로딩 시 카카오 SDK 초기화
document.addEventListener('DOMContentLoaded', function() {
	Kakao.init('07dab2542e666ab276222d8f579c67be');
	console.log("Kakao SDK Initialized:", Kakao.isInitialized());
}); // sdk초기화여부판단




// 카카오 로그인 함수
function kakaoLogin() {
	console.log("kakaoLogin 함수가 호출되었습니다.");
	Kakao.Auth.login({
		scope: 'account_email', // 사용자에게 이메일 정보 제공 동의를 받기 위한 scope 추가
		success: function(authObj) {
			console.log("Kakao login success:", authObj);

			// 사용자 정보에서 이메일 정보 가져오기
			Kakao.API.request({
				// 변경된 API 주소 사용
				url: '/v2/user/me',
				success: function(response) {
					console.log("Kakao user info:", response);

					var kakaoAccount = response.kakao_account;

					if (kakaoAccount && kakaoAccount.email) {
						var memberEmail = kakaoAccount.email;
						console.log("Member Email", memberEmail);
						  // 서버에 카카오 로그인 처리 요청
                        processLogin(memberEmail);
					} else {
						console.error("사용자 이메일 정보를 찾을 수 없습니다.");
					}
				},
				fail: function(error) {
					console.error("Kakao user info fail:", error);
				}
			});
		},
		fail: function(error) {
			console.error("Kakao login fail:", error);
		}
	});
}


function processLogin(memberEmail) {
	$.ajax({
		url: "/livre/member/kakaoLogin",
		data: {
			"memberEmail": memberEmail,

		},
		type: "post",
		//dataType:"JSON",
		success: function(memberNo) {
			//성공적으로 하고나면 이동할 url

			console.log("aJax Success", memberEmail);

			if (memberNo != 0) {
				location.href = '../book/my-review'; // 경로 바꿔
			} else {
				location.href = '../member/joinMemberShip';
			}

		},

		error: function(error, status) {
			console.log(error, status);
		},
	});
}

//====================================================================

function kakaoSignUp() {
	Kakao.Auth.login({
		success: function(response) {
			Kakao.API.request({
				url: "/v2/user/me",
				success: function(response) {
					//console.log(response)

					memberEmail = JSON.stringify(response.kakao_account.email);

					console.log("memberEmail", memberEmail);

					process(memberEmail);

					//접속된 회원의 토큰값 출력됨
					//alert(JSON.stringify(authObj));
				},
				fail: function(error) {
					console.log(error);
				},
			});
		},
	});

	function process(memberEmail) {
		$.ajax({
			url: "kakaoSignUp",
			data: {
				memberEmail: memberEmail,
			},
			type: "post",
			//dataType:"JSON",
			success: function(data) {
				//성공적으로 하고나면 이동할 url

				console.log("data", data);
				console.log("aJax", memberEmail);

				alert("livre에 오신걸 환영합니다");
				location.href = "login";
			},

			error: function(error, status) {
				console.log(error, status);
			},
		});
	}
}



//카카오로그아웃  
function kakaoLogout() {
	if (Kakao.Auth.getAccessToken()) {
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function(response) {
				console.log(response)
			},
			fail: function(error) {
				// 로그인 실패 시 에러 처리
				console.log(error)
			},
		})
		Kakao.Auth.setAccessToken(undefined)
	}
}