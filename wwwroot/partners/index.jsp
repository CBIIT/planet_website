<%@ page language="java" contentType="text/html" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.corda.CordaEmbedder" %>
<%@ page import="oracle.jdbc.driver.*" %>
<%
StringBuffer stateList = null;
String topic = "C";
String param = null;
String htmlString = null;
String caption = null;
String pageTitle = "Locate Comprehensive Cancer Control Partners in Your State or Region.";

param = request.getParameter("cctopic");
if (param != null)
   topic = param;
   
if (topic.equalsIgnoreCase("T"))
{
   pageTitle = "Locate Potential Tobacco Control Partners in Your State or Region.";
   caption = "Cancer Control PLANET - Tobacco Control Partners";
}
else if (topic.equalsIgnoreCase("P"))
{
   pageTitle = "Locate Potential Physical Activity Partners in Your State or Region.";
   caption = "Cancer Control PLANET - Physical Activity Partners";
}
else
{
   pageTitle = "Locate Comprehensive Cancer Control Partners in Your State or Region.";
   caption = "Cancer Control PLANET - Cancer Control Partners";
}

    String URL = "jdbc:oracle:thin:@mooch.nci.nih.gov:1521:mooch920";
    String username = "pma_web_user";
    String password = "pjc242323";
    String typeString = "S";
 
    DriverManager.registerDriver(new OracleDriver());
    Connection con = DriverManager.getConnection(URL, username, password);
    
    Statement stmt = con.createStatement();
    String theQuery = "SELECT abbreviation, name, type " +
                      "FROM dccps.cc_partner_states " +
                      "ORDER BY type, name";

    ResultSet rs = stmt.executeQuery(theQuery);
    if (rs.next())
    {
        stateList = new StringBuffer();
        int count= 0;
        do
        {
           if (count > 27)
           {
               stateList.append("</td><td valign='bottom'>");
               count = 0;
           }
           if (typeString.compareTo(rs.getString("type")) != 0)
           {
               stateList.append("<br />");
               typeString = rs.getString("type");
           }
           stateList.append("<br /><a href='list.jsp?r="+rs.getString("abbreviation")+"&cctopic="+topic.toUpperCase()+"' class='a1'>"+rs.getString("name")+"</a>");
           count++;
      } while (rs.next());
    stateList.append("</td>");
    }
     
    CordaEmbedder myChart = new CordaEmbedder();
    myChart.appearanceFile = "apfiles/ccp/ccpmap.pcxml";

    //change the next two lines to point to your popchart/optimap server or to a redirector
    myChart.externalServerAddress = "http://your.optimap.server:2001";
    myChart.internalCommPortAddress = "http://your.optimap.server:2002";

    //change the next line so the drilldown url points to your application server
    myChart.pcScript = "US.addPCXML(<DefaultShapeSettings><Drilldown URL='http://your.app.server/ccp/list.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)";

    myChart.height = 449;
    myChart.width = 629;
    myChart.imageType = "FLASH";
    myChart.fallback = "STRICT";
    myChart.userAgent = request.getHeader("USER-AGENT");
    htmlString = myChart.getEmbeddingHTML();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title><%= caption%></title>
<link href="styles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bgcolor="White">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><p class="banner"><a href="http://cancercontrolplanet.cancer.gov/index.html"><img src="images/planet_logo.gif" alt="Cancer Control PLANET - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
    <td><a href="http://cancercontrolplanet.cancer.gov/index.html"><img src="images/planet_banner2.gif" alt="Cancer Control PLANET - Links to resources for cancer control planning" width="369" height="82" border="0"></a></td>
    <td><p><a href="http://cancercontrolplanet.cancer.gov/index.html">Home</a><br>
        <a href="http://cancercontrolplanet.cancer.gov/contact.html">Contact Us</a><br>
        <a href="http://cancercontrolplanet.cancer.gov/about.html">About this Site</a><br>
        <a href="http://cancercontrolplanet.cancer.gov/partners.html">PLANET Sponsors</a></p></td>
  </tr>
  <tr> 
    <td colspan="3">
      <hr size="1" noshade> 
	</td>
  </tr>
</table>

<table summary="Links to potential partner list" bgcolor="white" border="0" cellpadding="5" cellspacing="0">
<tr>
<td align="left" colspan="3">
<div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 16px;	font-weight: bold;color : #000000;">
<%= pageTitle%>
</div>

<div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;">
To view, click on map or state name below.
</div>
<br />
</td>
</tr>
<tr>
<td valign='top'><a href='list.jsp?r=all&cctopic=<%= topic.toUpperCase()%>'>View all partners</a><br />
<%= stateList.toString()%>
<td valign='top'>
<%= htmlString%>
</td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><hr size="1" noshade>
	<div align="center"><a href="http://cancercontrolplanet.cancer.gov/index.html">Home</a>&nbsp;&nbsp;&nbsp; <a href="http://cancercontrolplanet.cancer.gov/contact.html">Contact Us</a>&nbsp;&nbsp;&nbsp; 
    <a href="http://cancercontrolplanet.cancer.gov/about.html">About this Site</a>&nbsp;&nbsp;&nbsp; 
        <a href="http://cancercontrolplanet.cancer.gov/partners.html">PLANET Sponsors</a>&nbsp;&nbsp;&nbsp; <a href="http://cancercontrolplanet.cancer.gov/privacy.html">Privacy 
        Policy</a>&nbsp;&nbsp;&nbsp; <a href="http://cancercontrolplanet.cancer.gov/disclaimer.html">Disclaimer</a>&nbsp;&nbsp;&nbsp; <a href="http://cancercontrolplanet.cancer.gov/accessibility.html">Accessibility</a><br>
      </div></td>
  </tr>
</table>
</body>
</html>
