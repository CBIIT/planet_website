<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.*" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<html>
<head>
<title>Cancer Control PLANET</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p class="banner"><a href="index.html"><img src="images/planet_logo.gif" alt="Cancer Control PLANET - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
    <td><a href="index.html"><img src="images/planet_banner2.gif" alt="Cancer Control PLANET - Links to resources for cancer control planning" width="369" height="82" border="0"></a></td>
    <td><p><a href="index.html">Home</a><br>
        <a href="contact.html">Contact Us</a><br>
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
			<p align="center"> Thank you for providing this information. Below is the information you provided.</p>

<%
    String feedback = request.getParameter("feedback");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    if (feedback == null || feedback.equals(""))
    {
%>
          <p>No information entered -- please enter your comments on the <a href="contact.html">contact page</a>.</p>
<%
    }
    else
    {
%>
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

<%
        // Write feedback to database.
        QueryBean QBean = new QueryBean();
        QBean.saveFeedback(feedback, email, phone);
        //QBean.close();
    }
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
    <td><hr size="1" noshade><div align="center"><a href="index.html">Home</a>&nbsp;&nbsp;&nbsp; <a href="contact.html">Contact Us</a>&nbsp;&nbsp;&nbsp; <a href="about.html">About this Site</a>&nbsp;&nbsp;&nbsp; <a href="partners.html">PLANET Sponsors</a>&nbsp;&nbsp;&nbsp; <a href="privacy.html">Privacy  Policy</a>&nbsp;&nbsp;&nbsp; <a href="disclaimer.html">Disclaimer</a>&nbsp;&nbsp;&nbsp; <a href="accessibility.html">Accessibility</a><br></div></td>
  </tr>
</table>
</body>
</html>
