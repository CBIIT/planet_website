<%@ page language="java" contentType="text/html" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.*" %>

<html>
<head>
<title>State, Tribe and Territory Implementation Budgets</title>
<link href="http://ccplanet.cancer.gov/styles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bgcolor="White">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p class="banner"><a href="http://cancercontrolplanet.cancer.gov/index.html"><img src="http://cancercontrolplanet.cancer.gov/images/planet_logo.gif" alt="Cancer Control P.L.A.N.E.T. - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>    <td><a href="http://cancercontrolplanet.cancer.gov/index.html"><img src="http://cancercontrolplanet.cancer.gov/images/planet_banner_wider.gif" alt="Cancer Control P.L.A.N.E.T. - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
<td><p><a href="http://cancercontrolplanet.cancer.gov/contact.html">Contact Us</a><br>
		<a href="http://ccplanetraining.cancer.gov" onclick="javascript:popWindow('http://ccplanetraining.cancer.gov', 'name','725','400','yes'); return false;">On-line Training</a><br />
	    <a href="about.html">About This Site</a><br>
        <a href="http://cancercontrolplanet.cancer.gov/factsheet.pdf">Fact Sheet (PDF)</a><br>
        <a href="http://cancercontrolplanet.cancer.gov/partners.html">Sponsors</a></p></td>
  </tr>
  <tr>
    <td colspan="3">

      <hr size="1" noshade>
	</td>
  </tr>
</table>

<div STYLE="display: block; position: relative; left: 50px; right: 50px">

<%
/*
    Enumeration headerNames = request.getHeaderNames();
    while(headerNames.hasMoreElements()) {
      String headerName = (String)headerNames.nextElement();
      out.println("<TR><TD>" + headerName);
      out.println("    <TD>" + request.getHeader(headerName));
    }
	out.println("</table>");
*/	
	if (request.getHeader("user-agent").indexOf("MSIE 6.0") > 0)
	{
		out.print("<h3>Thank you for downloading this file.  If your browser is blocking popup windows, please click the bar above and choose, 'Download file...'.</H3>");
		out.print("<script>\nif (window.location.search.length > 0)\nwindow.location = '" + response.encodeRedirectURL(request.getQueryString()) + "'\n</script>");
	} else {
		out.print("YOU HAVE SOME BROWSER OTHER THAN IE6.0<br><br>\n");
		response.sendRedirect(request.getQueryString());
	}
//	out.print("request.queryString() is " + request.getQueryString());
%>  
</div>
</body>
</html>