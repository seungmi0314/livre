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
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doPost(request, response);

		// 요청한 이메일을 가져온다.
		String memberEmail = request.getParameter("memberEmail");
		// String memberPw = request.getParameter("memberPw");
		String memberPw = "qwerqwerqwer1122";
		System.out.println("memberPw : " + memberPw);
		// 데이터베이스에 이메일이 존재한지 확인한다.
		MemberDao dao = new MemberDao();
		Member bean = dao.getMemberByEmail(memberEmail);

		if (bean == null) {
			setAlertMessage("아이디나 이메일 정보가 맞지 않습니다");
			goToPage("/findPassword.jsp");
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
			int rIndex = rnd.nextInt(3);
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
			}
		}

		String authkey = temp.toString();

		System.out.println(authkey);

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
				// memberEmail, memberPw
				// bean.getMemberEmail(), bean.getMemberPw()???
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
			msg.setSubject("안녕하세요 Livre 인증 메일입니다.");
			// 메일 내용
			msg.setText("인증 번호는 : " + temp);

			Transport.send(msg);
			System.out.println("이메일 전송 성공");

			// 생성된 authkey로 회원 비밀번호 업데이트
			int updateResult = dao.updateMemberPwWithAuthkey(memberEmail, authkey);

			if (updateResult == 1) {
				// 이메일 전송 및 비밀번호 업데이트 성공 시
				HttpSession session2 = request.getSession();
				session2.setAttribute("authkey", authkey);

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