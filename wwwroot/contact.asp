<html>
<head>
<title>Cancer Control PLANET</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
   
 function CheckInput()
{
   if (document.form1.feedback.value.length < 1) {
        window.alert("Please enter your comments.");
        document.form1.feedback.focus();
		return false;
   	}
	
}
 //-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><p class="banner"><a href="index.html"><img src="images/planet_logo.gif" alt="Cancer Control PLANET - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
    <td><a href="index.html"><img src="images/planet_banner2.gif" alt="Cancer Control PLANET - Links to resources for cancer control planning" width="369" height="82" border="0"></a></td>
    <td><p><a href="index.html">Home</a><br>
        <a href="contact.asp">Contact Us</a><br>
        <a href="about.html">About this Site</a><br>
        <a href="partners.html">PLANET Sponsors</a></p></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="6">
        <tr> 
          <td><hr size="1" noshade>
		  <h3>Contact Us</h3>
           
    <p>Your comments, questions, and suggestions are appreciated. Please direct them to <a href="mailto:ccplanet@mail.nih.gov">ccplanet@mail.nih.gov</a>.  </p>

<p>For general cancer information, please visit <a href="http://www.cancer.gov">Cancer.gov</a>.</p>
		
		<p>You may also provide feedback here on the Cancer Control PLANET.</p>
			<table width="100%" border="0" cellspacing="0" cellpadding="6">
        <tr> 
          <td width="50%" colspan="3">
          
            <% SUB feedbackForm() %>
            
            <form method="post" action="contact.asp" id="form1" name="form1" onSubmit="return CheckInput();">
            <table border="0" cellspacing="0" cellpadding="0"><!-- feedback form -->
            <tr>
				<td align="left" colspan="2"><textarea rows="12" cols="70" name="feedback"></textarea></td>
			</tr>
			<tr>
				<td align="left" colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td align="left" colspan="2" align="center">If you wish, tell us how to get in touch with you:</td>
			</tr>
			<tr>
				<td align="left" colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td align="left">Email:</td>
				<td align="left"><input type="text" name="email"></td>
			</tr>
			<tr>
				<td align="left">Phone:</td>
				<td align="left"><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td align="left" colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td align="left" colspan="2"><input type="submit" name="Submit" value="Submit Comments">
					<input type="reset" name="reset" value="Clear Form">
				</td>
			</tr>
            </table></form><!-- End of feedback form -->
            <% END SUB %> 
            
            
            <% SUB confirmPage ()
				Dim feedback
				Dim email
				Dim phone
	
      
				feedback = Request.Form("feedback")
				email = Request.Form("email")
				phone = Request.Form("phone")
			%>
           
			<p align="center"> Thank you for providing this information. Below is the information you provided.</p>
	
			<table border="0" cellpadding="6" cellspacing="0" align="center" width="50%"><!-- Confirm Page -->
			<tr>
				<td valign="top">Comments:</td>
				<td width="100%" align="left" valign="top"><%=feedback%></td>
			</tr>
			<tr>
				<td valign="top">Email:</td>
				<td align="left" valign="top"><%=email%></td>
			</tr>
			<tr>
				<td valign="top">Phone:</td>
				<td align="left" valign="top"><%=phone%></td>
			</tr>
			</table><!-- End of Confirm Page -->
			<% END SUB %>
			
      

			<% SUB confirmMail () 
	
				Dim strfeedback
				Dim stremail
				Dim strphone
	
      
				strfeedback = Request.Form("feedback")
				stremail = Request.Form("email")
				strphone = Request.Form("phone")

				SET mymail = server.CreateObject("CDONTS.Newmail")
				myMail.MailFormat = 0
				myMail.BodyFormat = 0

				HTML = "<table width=460 border=0> <tr> <td colspan=""2"">" &_
					"Dear Sir/Madam:" & "</td>" & "</tr>" &_
					"<tr> <td>" & "</td>" & "</tr>"&_
					"<tr> <td>" & "</td>" & "</tr>"&_
					"<tr> <font face=""Arial, Helvetica, sans-serif"" size=""-1""> <td colspan=""2"">" & "Below is the information submitted to Cancer Control PLANET feedback." & "</td>" & "</tr>"&_
					"<tr> <font face=""Arial, Helvetica, sans-serif"" size=""-1""> <td>" & "</td>" & "</tr>"&_
					"<tr> <font face=""Arial, Helvetica, sans-serif"" size=""-1""> <td>" & "Comments: " & "</td>" & "<td>" & strfeedback & "</td>" & "</tr>"&_
					"<tr> <font face=""Arial, Helvetica, sans-serif"" size=""-1""> <td>" & "Email: " & "</td>" &_
						"<td>" & stremail & " </td>" & "</tr>"&_
					"<tr> <font face=""Arial, Helvetica, sans-serif"" size=""-1""> <td>" & "Phone: " & "</td>" &_
						"<td>" & strphone & " </td>" & "</tr>"&_
					"<tr><td>" & "</td>" & "</tr>"&_
					"<tr><td>" & "</td>" & "</tr>"&_
					"<tr> <font face=""Arial, Helvetica, sans-serif"" size=""-1""> <td colspan=""2"">" & "Thank you." & "</td>" & "</tr>"&_
					"</table>"  
                     
				myMail.From = "Qi.Shi@matthewsgroup.com"
				myMail.To = "francis12@mail.nih.gov; cynkin1@mail.nih.gov; juranj@mail.nih.gov"
          
				myMail.Subject = "Cancer Control PLANET: Feedback"
				myMail.Body = HTML 
				myMail.Send

			   END SUB 
			%>

			<% 
			   IF request("Submit") = ""  THEN
					CALL feedbackForm ()
			   END IF

	           IF request("Submit") = "Submit Comments" THEN
					CALL confirmMail()
					CALL confirmPage()
			   END IF
			%>


        </td>
        </tr>
      </table>
	  
	  </td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
	</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><hr size="1" noshade>
	<div align="center"><a href="index.html">Home</a>&nbsp;&nbsp;&nbsp; <a href="about.html">About this 
        Site</a>&nbsp;&nbsp;&nbsp; <a href="contact.asp">Contact Us</a>&nbsp;&nbsp;&nbsp; 
        <a href="partners.html">Learn about PLANET Sponsors</a>&nbsp;&nbsp;&nbsp; <a href="privacy.html">Privacy 
        Policy</a>&nbsp;&nbsp;&nbsp; <a href="disclaimer.html">Disclaimer</a>&nbsp;&nbsp;&nbsp; <a href="accessibility.html">Accessibility</a><br>
      </div></td>
  </tr>
</table>
</body>
</html>