/*
 * Created by shroffta@mail.nih.gov 
 * Copyright (c) 2004 NCI (National Cancer Institute). 
 * All Rights Reserved.
 */
package gov.nci.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * @author: shroffta@mail.nih.gov
 * @created: Mar 25, 2005 3:37:22 PM
 */
public class Mailer {
	
	// Email address of the user sending the message
	private String from;
	
	// Server that is hosting the SMTP server.
	private String host ="mailfwd.nih.gov";

	// message represents the entire email message.
	private MimeMessage message;

    /**  
     * default constructor
     */
	
	public Mailer(){       
		// Get system properties
		Properties props = System.getProperties();
		
		// Get session
		Session session = Session.getDefaultInstance(props, null);
		
		// Instantiate a new message
		message = new MimeMessage(session);
		
		/* Hardcoding the host
		try 
		{
	        ServletContext sc = request.getSession().getServletContext();			
			host = sc.getInitParameter("mailServer");
		} catch (Exception e) {
			// do nothing
		}
		
		// Setup the mail server 
		props.put("mail.smtp.host", host);
		*/
	}
	
	/**
	 * Sends the Message
	 * @return boolean to signify whether the message was successfully sent.
	 */
	public boolean sendEmail(){
		try 
		{
			Transport.send(message);
			return true;
		} 
		catch (Exception e)
		{
			//Unable to send message
			return false;
		}
	}

	public boolean setRecipient(String recipient) {
	    try
	    {
	        message.setRecipient(Message.RecipientType.TO, (Address) new InternetAddress(recipient));
	        return true;
	    }
	    catch(Exception e)
	    {
	        System.out.println("Unable to set the recipient.");
	        return false;
	    }	    
	}

	public boolean setSubject(String subject) {
	    try
	    {
	        message.setSubject(subject);
	        return true;
	    }
	    catch(Exception e)
	    {
	        System.out.println("Unable to set the subject.");
	        return false;
	    }	    
	}

	public boolean setBody(String body) {
	    try
	    {
	        message.setText(body);
	        return true;
	    }
	    catch(Exception e)
	    {
	        System.out.println("Unable to set the body.");
	        return false;
	    }	    
	}

	public boolean setSender(String sender) {
	    try
	    {
	        message.setFrom(new InternetAddress(sender));
	        return true;
	    }
	    catch(Exception e)
	    {
	        System.out.println("Unable to set the sender.");
	        return false;
	    }	    
	}
}

