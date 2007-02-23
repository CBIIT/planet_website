<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%
    StringBuffer stateList = null;
    String topic = "C";
    String param = null;
    String htmlString = null;
    String caption = null;
    String pageTitle = "";

    param = request.getParameter("cctopic");
    if (param != null)
        // The database expects the topic to be an uppercase character.
        // Uppercase it here so we don't have to uppercase it every time
        // we use it.
        topic = param.toUpperCase();
  
    QueryBean QBean = new QueryBean();
    // Find the page title to use based on the topic
    String topicTitle = QBean.getTopicDescription(topic);
    pageTitle = "Locate " + topicTitle + " Partners in Your State or Region";
    caption = "Cancer Control PLANET - " + topicTitle;

    String typeString = "S";

    ResultSet rs = QBean.getStateList();
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
           stateList.append("\n<br /><a href='list.jsp?r="+rs.getString("abbreviation")+"&cctopic="+topic+"' class='a1'>"+rs.getString("name")+"</a>");
           count++;
      } while (rs.next());
    stateList.append("</td>");
    }

    QBean.close();

    NCIPopChartEmbedder myChart = new NCIPopChartEmbedder();
    myChart.appearanceFile = "apfiles/planet/ccpmap.pcxml";
    myChart.pcScript = "US.addPCXML(<DefaultShapeSettings><Drilldown URL='list.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)";
    myChart.height = 449;
    myChart.width = 629;
    myChart.imageType = "FLASH";
    myChart.fallback = "STRICT";
    myChart.returnDescriptiveLink = false;
    myChart.userAgent = request.getHeader("USER-AGENT");
    htmlString = myChart.getEmbeddingHTML();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title><%= caption%></title>
<link href="../styles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bgcolor="White">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p class="banner"><a href="../index.html"><img src="../images/planet_logo.gif" alt="Cancer Control P.L.A.N.E.T. - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>    <td><a href="../index.html"><img src="../images/planet_banner_wider.gif" alt="Cancer Control P.L.A.N.E.T. - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
<td><p><a href="../index.html">Home</a><br>
        <a href="../contact.html">Contact Us</a><br>
	<a href="about.html">About This Site</a><br>
        <a href="../factsheet.pdf">Fact Sheet (PDF)</a><br>

        <a href="../partners.html">P.L.A.N.E.T. Sponsors</a></p></td>
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
<%--= pageTitle--%>Locate Program Partners in Your State or Region.
</div>

<div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;">
To view, click on map or state name below.
</div>
<!-- <div align="right" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;">
<a href="researcher.jsp?cctopic=0">View Research Partners</a>
</div> 
<br />-->
</td>
</tr>
<tr>
<td valign='top'><%= stateList.toString()%><br /></td>
<td valign='top'>
<%= htmlString%><br>
<a href="javascript:window.close()">Close Window</a>
</td>
<tr>
<td colspan="3"><a href='list.jsp?r=ALL&cctopic=<%= topic %>'>View all Program Partners</a>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><hr size="1" noshade>
	<div align="center">
          <a href="../index.html">Home</a>&nbsp;&nbsp;&nbsp;
          <a href="../contact.html">Contact Us</a>&nbsp;&nbsp;&nbsp;
          <a href="../about.html">About this Site</a>&nbsp;&nbsp;&nbsp;
          <a href="../partners.html">Sponsors</a>&nbsp;&nbsp;&nbsp;
          <a href="../privacy.html">Privacy Policy</a>&nbsp;&nbsp;&nbsp;
          <a href="../disclaimer.html">Disclaimer</a>&nbsp;&nbsp;&nbsp;
          <a href="../accessibility.html">Accessibility</a><br>
      </div>
    </td>
  </tr>
</table>
</body>
</html>
