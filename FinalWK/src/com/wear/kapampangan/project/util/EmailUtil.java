package com.wear.kapampangan.project.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

	private Properties mailServerProperties;
	private Session getMailSession;
	private MimeMessage generateMailMessage;
	
	public void generateAndSendEmail(String mail , String recepientEmail) throws AddressException, MessagingException {
		 
		// Step1
		System.out.println("\n 1st ===> setup Mail Server Properties..");
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.host", "smtp.gmail.com");
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");
		System.out.println("Mail Server Properties have been setup successfully..");
 
		// Step2
		System.out.println("\n\n 2nd ===> get Mail Session..");
		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		generateMailMessage = new MimeMessage(getMailSession);
		generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recepientEmail));
		generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(recepientEmail));
		generateMailMessage.setSubject("Greetings from Crunchify..");
		String emailBody = mail;
		generateMailMessage.setContent(emailBody, "text/html");
		System.out.println("Mail Session has been created successfully..");
 
		// Step3
		System.out.println("\n\n 3rd ===> Get Session and Send mail");
		Transport transport = getMailSession.getTransport("smtp");
 
		// Enter your correct gmail UserID and Password
		// if you have 2FA enabled then provide App Specific Password
		//transport.connect("smtp.gmail.com", "wearkapampanganoffcial", "rafaelmanuel0000");
		reconnect(transport);
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		transport.close();
	}
	
	public void reconnect(Transport t){
		try{
			t.connect("smtp.gmail.com", "wearkapampanganoffcial", "rafaelmanuel0000");
			System.out.println("*");
		}catch(Exception e){
			reconnect(t);
		}
	}
}
