package com.livre.controller.member;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class FindPasswordController extends SuperClass {
	private final String PREFIX = "member/";

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doPost(request, response);

		// 요청한 이메일을 가져온다.
		String memberEmail = request.getParameter("memberEmail");

		// 데이터베이스에 이메일이 존재한지 확인한다.
		MemberDao dao = new MemberDao();
		Member bean = dao.getMemberByEmail(memberEmail);

		if (bean == null) {
			request.setAttribute("alertMessage", "해당 계정으로 가입된 이력이 없습니다.\\n다시 시도해 주세요.");
			super.goToPage(PREFIX + "findPassword.jsp");
			return; // 메시지 설정 후 바로 리턴하여 메서드를 종료
		}

		// mail server 설정
		String host = "smtp.naver.com";
		String user = "chylee917@naver.com"; // 자신의 네이버 계정
		String password = "qwerqwerqwer1122"; // 자신의 네이버 페스워드

		// 메일 받을 주소
		String to_email = bean.getMemberEmail();

		// SMAP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 사용할 TLS/SSL 프로토콜 명시
		// props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 사용 중인 프로토콜에 맞게 변경
		// props.put("mail.smtp.ssl.ciphersuites",
		// "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"); // 사용 중인 암호 알고리즘에 맞게 변경

		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(4); // 0부터 4까지의 난수 생성
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			case 3:
				// 특수기호 ($, @, !, %, *, #, ?, &) 중 하나를 랜덤으로 추가
				String symbols = "$@!%*#?&";
				temp.append(symbols.charAt(rnd.nextInt(symbols.length())));
				break;
			}
		}

		String authkey = temp.toString();

		System.out.println(authkey);

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);

			}
		});

		// email 전송
		try {
			System.out.println("session : " + session);
			// MimeMessage 객체 생성
			MimeMessage msg = new MimeMessage(session);

			// 송신자 및 수신자 주소 설정
			msg.setFrom(new InternetAddress(user, "Livre"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("안녕하세요 Livre 임시 비밀번호 전송 메일입니다.");
			// 메일 내용
			msg.setText("회원님의 임시 비밀번호는 [ " + temp + " ] 입니다.\n보안을 위해 로그인 후 비밀번호를 변경해주세요.");

			Transport.send(msg);
			
			System.out.println("이메일 전송 성공");
			
			// 생성된 authkey로 회원 비밀번호 업데이트
			int updateResult = dao.updateMemberPwWithAuthkey(memberEmail, authkey);

			if (updateResult == 1) {
				// 이메일 전송 및 비밀번호 업데이트 성공 시
				HttpSession session2 = request.getSession();
				session2.setAttribute("authkey", authkey);
				session2.setAttribute("emailSentSuccessMessage", "메일이 성공적으로 전송되었습니다.");
				super.goToPage(PREFIX + "tempPassword.jsp");

			} else {
				// 비밀번호 업데이트 실패 시
				setAlertMessage("비밀번호 업데이트에 실패했습니다. 다시 시도해주세요.");
				super.goToPage(PREFIX + "findPassword.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("이메일 전송 실패");

			super.goToPage(PREFIX + "findPassword.jsp");
			return;
		}

		// HttpSession 객체를 사용하여 authkey 저장
		HttpSession session2 = request.getSession();
		session2.setAttribute("authkey", authkey);

//		// 패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
//		request.setAttribute("memberEmail", memberEmail);

		// 페이지 포워딩
		// request.getRequestDispatcher("/findPassword.jsp").forward(request, response);
		// super.goToPage(PREFIX + "findPassword.jsp");

	}

}