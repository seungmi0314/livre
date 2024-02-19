package com.livre.model.bean;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class KakaoApi {

    public String getToken(String authorize_code) {
        String access_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // POST 요청 설정
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // POST 데이터 설정
            String params = "grant_type=authorization_code"
                    + "&client_id=5975a25df2fa8cac4ce9ba8863d45540" // 본인이 발급받은 key
                    + "&redirect_uri=http://localhost:8090/livre/kakaoLogin"
                    + "&code=" + authorize_code;
            conn.getOutputStream().write(params.getBytes("UTF-8"));

            // 요청 후 응답 받기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder sb = new StringBuilder();
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            // 응답 데이터 파싱
            String jsonString = sb.toString();
            access_Token = parseToken(jsonString);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_Token;
    }

    private String parseToken(String jsonString) {
        // 여기서 응답 JSON 문자열을 파싱하여 access_token을 추출하는 코드를 작성합니다.
        // 예를 들어, JSON 라이브러리(Gson, Jackson 등)를 사용하여 파싱할 수 있습니다.
        // 이 예제에서는 단순히 문자열을 검색하여 추출하는 방식으로 처리합니다.
        // (실제로는 JSON 파싱 라이브러리를 사용하는 것이 더 안전하고 효율적입니다.)
        String access_Token = "";

        // 예시 코드
        int startIdx = jsonString.indexOf("\"access_token\":\"") + "\"access_token\":\"".length();
        int endIdx = jsonString.indexOf("\"", startIdx);
        if (startIdx != -1 && endIdx != -1) {
            access_Token = jsonString.substring(startIdx, endIdx);
        }

        return access_Token;
    }

    public Member getKakaoUserInfo(String accessToken) {
        // 여기에 Kakao 사용자 정보를 가져오는 코드를 작성합니다.
        // accessToken을 사용하여 Kakao API에 요청을 보내고 사용자 정보를 가져옵니다.
        // 예를 들어, Kakao API의 /v2/user/me 엔드포인트를 호출하여 사용자 정보를 가져올 수 있습니다.
        // 실제로는 HTTP 요청을 보내고 JSON 응답을 파싱하는 등의 작업이 필요합니다.
        // 이 예제에서는 가상의 Member 객체를 반환하도록 처리합니다.
        Member kakaoMember = new Member();
        kakaoMember.setMemberEmail("kakao@example.com");
        kakaoMember.setMemberNick("Kakao User");
        // 추가적인 사용자 정보 설정

        return kakaoMember;
    }

    public void kakaoLogout(String accessToken) {
        // 여기에 Kakao 로그아웃 처리를 위한 코드를 작성합니다.
        // accessToken을 사용하여 Kakao API에 로그아웃 요청을 보냅니다.
        // 예를 들어, Kakao API의 /v1/user/logout 엔드포인트를 호출하여 로그아웃 요청을 할 수 있습니다.
        // 실제로는 HTTP 요청을 보내는 등의 작업이 필요합니다.
    }
}
