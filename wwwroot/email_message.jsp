<%@ page language="java" contentType="text/html" %>
<%@ page import = "java.util.*" session="true" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.net.*"%>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page session="true" %>
 
<%
	String myemail = request.getParameter("myemail");
	String friendemail = request.getParameter("friendemail");
	String personalMessage = "";
	String articleURL  = request.getParameter("articleURL");
	String articleTitle = request.getParameter("title");
	
	if (request.getParameter("articleURL") != null){
		articleURL  = request.getParameter("articleURL");
%>	<!--not null: <%= request.getParameter("articleURL")%><br />-->
<%	} else { %>
      <!-- null: <%= request.getParameter("articleURL")%><br />-->

<%		articleURL = (String)session.getAttribute("articleURL") ;
	}
	//articleURL = (String)session.getAttribute("articleURL") ;
			
if (request.getServerName().equals("localhost")){ 
		articleURL  = "http://localhost:8080/planet/" + articleURL ;
	} else if (request.getServerName().equals("parsley.cit.nih.gov")){ 
	      if (request.getContextPath().equals("/planet")) {
		        articleURL  = "http://parsley.cit.nih.gov:8080/planet/" + articleURL ;
		   }
	
		//articleURL = reconstructedURL.toString();
	}else if (request.getServerName().equals("ccplanet.cancer.gov")){ 
		articleURL  = "http://ccplanet.cancer.gov/" + articleURL ;
	}
%>
 <!--articleURL: <= articleURL  %><br />
 reconstructedURL: <= reconstructedURL  %><br />
 Servlet Path: <= request.getServletPath()%><br>
 Context Path: %= request.getContextPath() %><br>
 Server Port: <=request.getServerPort() %><br>
 session articleURL <=session.getAttribute("articleURL")%><br>-->
<%
	
	if ( (request.getParameter("personalMessage") )!= null)   {
		personalMessage = request.getParameter("personalMessage");
	} 
%>
 	
<%
	String host = "mailfwd.nih.gov"; 
	//String to = friendemail;
	//String cc = myemail; 
	String subject = "Cancer Control P.L.A.N.E.T.: a link from " + myemail;
	String messageText = "";
	
	//e-mail content
	messageText = myemail + " sent you this message because Cancer Control P.L.A.N.E.T. may be of interest to you.<br><br>";
	if (personalMessage != null) {
		messageText += personalMessage + "<br><br>";
	} 
	
	messageText += articleTitle + " - " +  articleURL.replace("//", "&#47;&#47;") + "<br><br>";
	messageText += "Learn more about Cancer Control P.L.A.N.E.T. at http:&#47;&#47;hints.cancer.gov.";
	
	Properties props = System.getProperties();
	props.put("mail.host", host);
	props.put("mail.transport.protocol", "smtp");
	Session s = Session.getInstance(props,null);

  	MimeMessage message = new MimeMessage(s);

  	InternetAddress from = new InternetAddress(myemail);
	message.setFrom(from);

  	String toAddresses = request.getParameter("friendemail");
	message.addRecipients(Message.RecipientType.TO, toAddresses);
	//String ccAddresses =  myemail; 
	//message.setRecipients(Message.RecipientType.CC, ccAddresses);
	//String bccAddresses = "qshi@mmgct.com"; // request.getParameter("bcc");
	//message.setRecipients(Message.RecipientType.BCC, bccAddresses);
	message.setSubject(subject);
	message.setContent(messageText, "text/html"); 

  	Transport.send(message);
%>
		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Cancer Control P.L.A.N.E.T.: Share Cancer Control P.L.A.N.E.T. with a Friend</title>

<link href="styles-baseline.css" rel="stylesheet" type="text/css" />
<link href="styles-2-column.css" rel="stylesheet" type="text/css" />
<script src="scripts.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="/fsrscripts/triggerParams.js"></script> 
<script type="text/javascript" src="/fsrscripts/stdLauncher.js"></script>
<script type="text/javascript" src="javascript/validate.js"></script>
<script type="text/javascript" src="javascript/toggle.js"></script>
</head>

<body>
      <p>&nbsp;</p>
      <p align="center"><h3>Thank you for sending the e-mail!</h3></p>
       
      <p align="center"><A onclick=window.close() href="#">Close Window</A></p>

</body>
</html>