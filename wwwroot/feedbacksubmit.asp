<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Cancer Control PLANET</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles.css" rel="stylesheet" type="text/css">
</head>
<%
Dim conn
Dim cmd

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open ConnectString

Set cmd = GetStoredProc(conn, "products_order_pkg", "save_feedback")
cmd.Parameters.Append cmd.CreateParameter("feedback", adVarChar, adParamInput, 4000, Request.Form("feedback"))
cmd.Parameters.Append cmd.CreateParameter("email", adVarChar, adParamInput, 80, Request.Form("email"))
cmd.Parameters.Append cmd.CreateParameter("phone", adVarChar, adParamInput, 25, Request.Form("phone"))
cmd.Execute
Set cmd = Nothing
Set conn = Nothing
%>

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
          <td width="50%" colspan="3"><h2>Provide Feedback on the Site</h2>
            <p>Thank you for providing the comment for the Research-tested Intervention Programs (RTIPs) Web site</p>
            <% 

	            Response.Write ("feedback: " & request.Form("feedback") & "<br>")
	            Response.Write ("email: " & request.Form("email") & "<br>")  
	            Response.Write ("phone: " & request.Form("phone"))  
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
