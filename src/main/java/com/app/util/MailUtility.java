package com.app.util;

import java.io.FileInputStream;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

@Service
public class MailUtility {
	
	@Value("${mail.from.id}")
	private String fromMailId;
	
	@Value("${mail.from.password}")
	private String fromMailPassword;

	public boolean sendMail(MailData mailData) {
		try(FileInputStream fis = new FileInputStream(ResourceUtils.getFile("classpath:mail.properties"))) {
			
			Properties mailProps = new Properties();
			mailProps.load(fis);
			
			Session session = Session.getDefaultInstance(mailProps, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromMailId, fromMailPassword);
				}
			});	
			
			MimeMultipart mmp = new MimeMultipart();
			
			MimeBodyPart textBody = new MimeBodyPart();
			textBody.setText(mailData.getTextContent());
			mmp.addBodyPart(textBody);
			
			for (MailDocument doc: mailData.getDocs()) {
				MimeBodyPart docBody = new MimeBodyPart();
				docBody.setDataHandler(new DataHandler(doc.getDataSource()));
				docBody.setFileName(doc.getTitle());
				mmp.addBodyPart(docBody);
			}
			
			MimeMessage msg = new MimeMessage(session);
			msg.setSender(new InternetAddress(fromMailId));
			msg.setSubject(mailData.getSubject());
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mailData.getToMailId()));
			msg.setContent(mmp);
			
			Transport.send(msg);
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	}

	public String getFromMailId() {
		return fromMailId;
	}

	public void setFromMailId(String fromMailId) {
		this.fromMailId = fromMailId;
	}

	public String getFromMailPassword() {
		return fromMailPassword;
	}

	public void setFromMailPassword(String fromMailPassword) {
		this.fromMailPassword = fromMailPassword;
	}
	
}
