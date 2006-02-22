<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<%
    StringBuffer stateList = null;
	int topic = 0;
	Integer ccTopic = new Integer(0);
    String param = null;
	String htmlString = null;
    String caption = null;
    String pageTitle = "";

    param = request.getParameter("cctopic");
	
    if (param != null)
       topic = Integer.parseInt(param);
		ccTopic = new Integer(topic);

    QueryBean QBean = new QueryBean();
    // Find the page title to use based on the topic
    String topicTitle = QBean.getTopicDescription(ccTopic);
    pageTitle = "Locate " + topicTitle + " Partners in Your State or Region";
    caption = "Cancer Control PLANET - " + topicTitle;

    String typeString = "S";

    Vector states = QBean.getStateList();
    Iterator it2 = states.iterator();
	
    if (it2.hasNext())
    {
	
        stateList = new StringBuffer();
        int count= 0;
		//stateList.append("<tr><th colspan='2' align='left' valign='top' nowrap bgcolor='#F1F1FD'>States</th><th align='left' valign='top' bgcolor='#F1F1FD' nowrap>TERRITORIES/TRIBES</th></tr><tr><td valign='top' bgcolor='#F1F1FD' nowrap>");
        stateList.append("<table border='1' cellpadding='5' cellspacing='0' width='100%'><tr><th colspan='2' align='left' valign='top' nowrap bgcolor='#F1F1FD'>States</th></tr><tr><td valign='top' nowrap bgcolor='#F1F1FD'>");


        do
        {
           StateBean rs = (StateBean)it2.next();
		   
		      if (count == 26) {
                stateList.append("</td><td valign='top' bgcolor='#F1F1FD' nowrap>");
                //count = 0;
            }
			
             if (count == 51) {
              	stateList.append("</td></tr>");
				stateList.append("<tr><th colspan='2' bgcolor='#F1F1FD'>&nbsp;</th></tr>");
				stateList.append("<tr><th colspan='2' align='left' valign='top' nowrap bgcolor='#F1F1FD'>Territories / Tribes</th></tr><tr><td colspan='2' valign='top' bgcolor='#F1F1FD' nowrap>");
                //count = 0;
            }
			
			/*comment out 02/01/2006
                if (count == 56) {
                stateList.append("</td><td valign='top' bgcolor='#F1F1FD' nowrap>");
				//count = 0;
            } */
			
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
              //stateList.append("\n<br /><a href='rlist.jsp?r="+rs.getAbbreviation()+"&cctopic="+topic+"' class='a1'>"+rs.getName()+"</a>");
           stateList.append("\n<a href='rlist.jsp?r="+rs.getAbbreviation()+"&cctopic="+topic+"' class='a1'>"+rs.getName()+"</a>");
           count++;
      } while (it2.hasNext());
    //stateList.append("</td>");
	 stateList.append("</td></tr></table>");
    }
    
    
    NCIPopChartEmbedder myChart = new NCIPopChartEmbedder();
    myChart.appearanceFile = "apfiles/planet/ccpmap.pcxml";
    myChart.pcScript = "US.addPCXML(<DefaultShapeSettings><Drilldown URL='rlist.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)";
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
    <td><p class="banner"><a href="../index.html"><img src="../images/planet_logo.gif" alt="Cancer Control PLANET - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
    <td><a href="../index.html"><img src="../images/planet_banner_wider.gif" alt="Cancer Control PLANET - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
    <td><p><a href="../index.html">Home</a><br>
        <a href="../contact.html">Contact Us</a><br>
		<a href="http://ccplanetraining.cancer.gov" onclick="javascript:popWindow('http://ccplanetraining.cancer.gov', 'name','725','400','yes'); return false;">On-line Training</a><br />

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
	<h3>Research Partners in Cancer Control</h3>

      <div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;">
        <p>To view, click on map or state name below.</p>
	 </div>
      <p>To locate program partners in your state or region go to the <a href="">Program Partners</a> page.<br><br></p>
	</td>
</tr>
<tr>
	<td valign='top' colspan="2" bgcolor="#F1F1FD"><%= stateList.toString()%><br /></td>
	<td valign='top'><%= htmlString%></td>
</tr>
<tr>
	<td colspan="1" bgcolor="#F1F1FD"><br><a href="rlist.jsp?r=ALL&cctopic=<%= topic %>">View all U.S. Researchers by topic area</a></td>
</tr>
<tr> 
    <td colspan="3">The list of research partners was compiled based on those individuals who had received a grant during the fiscal year period from 1998-2003 and who have permitted their contact information to be listed as a resource for comprehensive cancer control planning and implementation within their state.</td>
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
