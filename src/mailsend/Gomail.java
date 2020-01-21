package mailsend;

import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;

public class Gomail {

	public static void main(String[] args) {
		String host = "smtp.naver.com"; //인터넷으로 이메일을 보내기 위한 프로토콜
		final String user = "c0jin2@naver.com"; // 발신자 아이디
		final String password = "choi30763850!!"; // 발신자 비밀번호
		
		String to = "y__1_7@naver.com"; // 수신자 이메일
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host); //smtp 서버 지정
		props.put("mail.smtp.auth", "true");
		
		//smtp 서버 정보와 사용자 정보를 기반으로 session 클래스의 인스턴스 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
			    return new PasswordAuthentication(user, password);
			   }
			  });

			  try {
			   MimeMessage message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(user));
			   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			   // 이메일 제목
			   message.setSubject("[Subject] Java Mail Test");
			   
			   // 이메일 내용
			   message.setContent("<a href = &quot;http://www.naver.com&quot;>클릭하세요</a>", "text/html;charset=UTF-8");
//			   message.setRecipient(RecipientType.TO, new InternetAddress(to));


			   //이메일 전송
			   Transport.send(message);
			   System.out.println("message sent successfully...");

			  } catch (MessagingException e) {
			   e.printStackTrace();
			  }
			
			
		

	}

}
