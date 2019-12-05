package com.login.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	//javax.mail-1.6.1.jar
	public static void sendMail(String mailTo,String otp) {
		try{
            String host ="smtp.gmail.com";
            String user = "suresh.kumar8409@gmail.com";
            String pass = "Suresh@8409";
            //String to = "surajjava121@gmail.com";
            String to =mailTo;
            String from = "suresh.kumar8409@gmail.com";
            String subject = "This is confirmation OTP Number "
            		+ " for Change The Password ."
            		+ " Please insert this OTP to Change"
            		+ " your Password. ";
            String messageText = " This is Your OTP No :-"+otp;
            boolean sessionDebug = false;

            Properties props = System.getProperties();
            
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
           // java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setText(messageText);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");
        }catch(Exception ex)
        {
            System.out.println(ex);
        }}
}
/*{ 
    public static void send(String to, String sub, String msg, final String user,final String pass)
    { 
     //create an instance of Properties Class   
     Properties props = new Properties();
     
     props.put("mail.smtp.host", "smtp.gmail.com");
     //below mentioned mail.smtp.port is optional
     props.put("mail.smtp.port", "587");		
     props.put("mail.smtp.auth", "true");
     props.put("mail.smtp.starttls.enable", "true");
     
    Session session = Session.getInstance(props,new javax.mail.Authenticator()
    {
  	  protected PasswordAuthentication getPasswordAuthentication() 
  	  {
  	 	 return new PasswordAuthentication(user,pass);
  	  }
   });
    
   try
   {
    MimeMessage message = new MimeMessage(session);
       message.setFrom(new InternetAddress(user));
       message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
       message.setSubject(sub);
       message.setText(msg);

        Transport class is used to deliver the message to the recipients 
       
       Transport.send(message);
    }
    catch(Exception e)
    {
    	 e.printStackTrace();
    }
  }  
}*/
