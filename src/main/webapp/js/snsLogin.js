//페이지 로딩 시 카카오 SDK 초기화
document.addEventListener('DOMContentLoaded', function() {
	Kakao.init('07dab2542e666ab276222d8f579c67be');
	console.log(Kakao.isInitialized());
}); // sdk초기화여부판단

var memberEmail;


// 카카오 로그인 함수
function kakaoLogin() {
	Kakao.Auth.login({
		success: function(response) {
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(response) {
					// 로그인 성공 시 사용자 정보 출력
					console.log(response)
					// 이 부분이 로그인 된것임.
	        	  // DB에 저장하는 서블릿 연결해주고 로그아웃 따로 마련하겠음
	        	  
	        	  memberEmail = JSON.stringify(response.kakao_account.email);
	        	  console.log("memberEmail", memberEmail);
	        	  
	        	   process(memberEmail);

                    //접속된 회원의 토큰값 출력됨
                    //alert(JSON.stringify(authObj));
	        	  
				},
			})
		},
		fail: function(error) {
			console.log(error)
		},
	})
}

 function process(memberEmail) {
        $.ajax({
            url: "kakaoLogin",
            data: {
                "memberEmail": memberEmail,

            },
            type: "post",
            //dataType:"JSON",
            success: function (memberNo) {
                //성공적으로 하고나면 이동할 url

                console.log("aJax", memberEmail);

                if(memberNo != 0) {
					location.href = '../book/main-page';
				} else {
					location.href= '${contextPath}/member/joinMemberShip';
				}
                
            },

            error: function (error, status) {
                console.log(error, status);
            },
        });
    }

//====================================================================

function kakaoSignUp() {
    Kakao.Auth.login({
        success: function (response) {
            Kakao.API.request({
                url: "/v2/user/me",
                success: function (response) {
                    //console.log(response)

                    memberEmail = JSON.stringify(response.kakao_account.email);

                    console.log("memberEmail", memberEmail);

                    process(memberEmail);

                    //접속된 회원의 토큰값 출력됨
                    //alert(JSON.stringify(authObj));
                },
                fail: function (error) {
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
            success: function (data) {
                //성공적으로 하고나면 이동할 url

                console.log("data", data);
                console.log("aJax", memberEmail);

                alert("livre에 오신걸 환영합니다");
                location.href = "login";
            },

            error: function (error, status) {
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

