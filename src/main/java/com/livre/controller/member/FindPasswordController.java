package com.livre.controller.member;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class FindPasswordController extends SuperClass {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 비밀번호 찾기에 대한 get 요청 처리 로직

		// 요청에서 이메일을 가져온다.
		String memberEmail = request.getParameter("memberEmail");

		// 데이터베이스에 이메일이 존재한지 확인한다.
		MemberDao dao = new MemberDao();
		Member bean = dao.getMemberByEmail(memberEmail);

		if (memberEmail != null && bean != null) {
			// 랜덤한 인증코드를 생성한다.
			String verificationCode = generateVerificationCode();

			// 나중에 인증을 위해 세션에 인증코드를 저장한다.
			session.setAttribute("verificationCode", verificationCode);

			// 사용자에게 인증코드를 전송한다.
			sendVerificationCodeByEmail(memberEmail, verificationCode);

			// 인증코드를 입력하는 페이지로 포워딩한다.
			request.setAttribute("memberEmail", memberEmail);
			request.getRequestDispatcher("/findPassword.jsp").forward(request, response);

		} else {
			// 데이터베이스에서 이메일을 찾을 수 없는 경우
			setAlertMessage("이메일을 찾을 수 없습니다.");
			goToPage("/findPassword.jsp");
		}

		super.doGet(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 비밀번호 찾기에 대한 post 요청 처리 로직

		// 요정에서 인증코드와 새 비밀번호를 가져온다.
		String verificationCode = request.getParameter("verificationCode");
		String newPassword = request.getParameter("newPassword");

		// 세션에서 저장된 인증코드를 가져온다
		String storeVerificationCode = (String) session.getAttribute("verificationCode");

		if (verificationCode.equals(storeVerificationCode)) {
			// 인증 코드가 일치하는경우, 데이터베이스에서 비밀번호를 업데이트한다.
			MemberDao dao = new MemberDao();
			dao.updatePassword(logInfo.getMemberAddress(), newPassword);

			// 사용자에게 비밀번호가 성공적으로 변경되었음을 알린다.
			setAlertMessage("비밀번호가 성공적으로 변경되었습니다.");
			goToPage("/login.jsp");
		} else {
			// 인증 코드가 일치하지 않는 경우, 에러 메세지를 표시한다.
			setAlertMessage("유효하지 않은 인증 코드입니다.");
			goToPage("/findPassword.jsp");
		}
	}

	private String generateVerificationCode() {
		// 랜덤한 6자리의 인증 코드를 생성한다.
		Random random = new Random();
		int code = 100000 + random.nextInt(900000);
		return String.valueOf(code);
	}

	private void sendVerificationCodeByEmail(String toEmail, String verificationCode) {
		// 필요한 JavaMail 클래스 가져오기
		// (이 부분은 이미 import 되어 있어야 합니다)

		// 이메일을 보낼 이메일 주소가 있다고 가정합니다
		String fromEmail = "chylee917@gmail.com";
		String emailSubject = "비밀번호 재설정 인증 코드";
		String emailBody = "인증 코드: " + verificationCode;

		// Set up properties for the mail session
		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com"); // SMTP 호스트 주소
		properties.put("mail.smtp.port", "587"); // SMTP 포트
		properties.put("mail.smtp.auth", "true"); // 인증 사용
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		// Create a Session object
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("chylee917@gmail.com", "qwerqwerqwer1122"); // 이메일 계정과 비밀번호
			}
		});

		try {
			// Create a MimeMessage object
			Message message = new MimeMessage(session);

			// Set the sender and recipient addresses
			message.setFrom(new InternetAddress(fromEmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

			// Set the email subject and body
			message.setSubject(emailSubject);
			message.setText(emailBody);

			// Send the email
			Transport.send(message);

			// 여기에 필요한 코드를 추가하세요.
			// 사용자에게 인증코드를 전송했다는 메시지 등을 추가할 수 있습니다.

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
