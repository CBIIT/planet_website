<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
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

    
    Vector states = QBean.getStateList();
    Iterator it2 = states.iterator();
	
    if (it2.hasNext())
    {
	
        stateList = new StringBuffer();
        int count= 0;
		stateList.append("<tr><th colspan='2' align='left' valign='top' nowrap bgcolor='#F1F1FD'>STATES</th><th align='left' valign='top' bgcolor='#F1F1FD' nowrap>TERRITORIES/TRIBES</th></tr><tr><td valign='top' bgcolor='#F1F1FD' nowrap>");


        do
        {
           StateBean rs = (StateBean)it2.next();
		   
		      if (count == 26) {
                stateList.append("</td><td valign='top' bgcolor='#F1F1FD' nowrap>");
                //count = 0;
            }
			
            if (count == 51) {
              // stateList.append("</td><td valign='top' bgcolor='#F1F1FD' nowrap>");
                stateList.append("<br><br>");
            }
			
			if (count > 0 && count != 26 && count !=51)
                stateList.append("<br />");
				
           /* comment out 10/26/2005
		   
		   if (count > 27)
           {
               stateList.append("</td><td valign='bottom' bgcolor='F1F1FD'>");
               count = 0;
           }
           if (typeString.compareTo(rs.getType()) != 0)
           {
               stateList.append("<br />");
               typeString = rs.getType();
           } */
           stateList.append("\n<a href='list.jsp?r="+rs.getAbbreviation()+"&cctopic="+topic+"' class='a1'>"+rs.getName()+"</a>");
           count++;
      } while (it2.hasNext());
    stateList.append("</td>");
    }
    
    
    

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
    <td><p class="banner"><a href="../index.html"><img src="../images/planet_logo.gif" alt="Cancer Control PLANET - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>    <td><a href="../index.html"><img src="../images/planet_banner_wider.gif" alt="Cancer Control PLANET - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
<td><p><a href="../index.html">Home</a><br>
        <a href="../contact.html">Contact Us</a><br>
	<a href="about.html">About This Site</a><br>
        <a href="../factsheet.pdf">Fact Sheet (PDF)</a><br>

        <a href="../partners.html">PLANET Sponsors</a></p></td>
  </tr>
  <tr>
    <td colspan="3">
      <hr size="1" noshade>
	</td>
  </tr>
</table>

<table summary="Links to potential partner list" bgcolor="white" border="1" cellpadding="5" cellspacing="0">
<tr>
	<td align="left" colspan="3">
	<h3>Program Partners in Cancer Control</h3>
	
        <%--= pageTitle--%>
	 <div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;">
		<p><strong>To view, click on map or state name below.</strong></p>
	</div>
	    <p>To locate research partners in your state or region go to the  <a href="researcher.jsp?cctopic=0">research partners</a> page.</p>
		
	</div>
	<!--<br />-->
	</td>
</tr>
<tr>
	<td valign='top'><%= stateList.toString()%><br /></td>
	<td valign='top'><%= htmlString%><br></td>
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
          <a href="../partners.html">PLANET Sponsors</a>&nbsp;&nbsp;&nbsp;
          <a href="../privacy.html">Privacy Policy</a>&nbsp;&nbsp;&nbsp;
          <a href="../disclaimer.html">Disclaimer</a>&nbsp;&nbsp;&nbsp;
          <a href="../accessibility.html">Accessibility</a><br>
      </div>
    </td>
  </tr>
</table>
</body></html>
