<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%
String param;
String htmlString = null;
String caption = "State Cancer Control Plans";
String pageTitle = "State Cancer Control Plans";
int count= 0;




StringBuffer stateList = null;
StringBuffer pcScript = null;

     QueryBean QBean = new QueryBean();
     ResultSet rs = QBean.getStatePlans();
	 
     //now get the information to display
     //theQuery = "SELECT state, name, plan_status, plan_URL, type FROM states;";

	 String beginTD = "<tr><td style='font-family: Arial,Helvetica;font-size: 12;' align=\"left\">";
	 String endTD = "</td></tr>";
	 
     pcScript = new StringBuffer();
     pcScript.append("US.addPCXML(<DefaultShapeSettings><Properties FillColor='#b2b2b2' FillType='Pattern' PatternType='DiagonalBottomToTop'/><Drilldown URL='' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>");
     pcScript.append("<Range Name='Red' LegendText='Cancer plan available' Minimum='1.0' Maximum='1.0'><RangeShapeSettings  Type='Rectangle' Width='8' Height='8'><MapProperties OverrideFillColor='True' OverrideShapeSettings='True'/><Properties FillColor='#b3a8ee'/></RangeShapeSettings></Range>");
     pcScript.append("<Range Name='Noplan' LegendText='Cancer plan in progress' Minimum='No data' Maximum='No data'><RangeShapeSettings  Type='Rectangle' Width='8' Height='8'><MapProperties OverrideFillColor='True' OverrideShapeSettings='True'/><Properties FillColor='#bfbfbf' FillType='Pattern' PatternType='DiagonalTopToBottom'/></RangeShapeSettings></Range>)");
     pcScript.append("US.addPCXML(<Legend Name='legend' Top='5' Left='213' Width='403' Height='23' ZIndex='56'><Properties RangeSizeForMarkers='True' MinimumFontSize='10.0' ReverseOrder='True' Font='Name:Helvetica; Size:11.0;'/></Legend>)");
     if (rs.next())
     {
      stateList = new StringBuffer();
      
      String typeString = "S";
      do
      {
       //the following lines are used to create can be added back in when the list gets over 27 states
       //*******************************
       if (count > 27)
       {
        stateList.append("</td><td valign='top'>");
        count = 0;
       }
       //******************************
       
       //the next section is to separate the Territories from the States
       //******************************
       if (typeString.compareTo(rs.getString("plan_type").toUpperCase()) != 0)
       {
          stateList.append("<br />");
          typeString = rs.getString("plan_type");
       }
       //******************************
       
       //if (count > 0)
       //	stateList.append("<br />");
       
       if (rs.getInt("plan_status") == 1)
       {
       				stateList.append("<br />");
           //create the text link
           stateList.append("<a href='"+ rs.getString("plan_URL").trim()+"' class='a1'  title='"+rs.getString("name").trim()+"' target='_blank'>"+rs.getString("name")+"</a>");
           //create the link on the map
           pcScript.append("US.addPCXML(<MapShapeItem Name='"+rs.getString("state")+"' Value='1'><ItemShapeSettings><MapProperties OverrideDrilldownSettings='True'/><Drilldown URL='"+rs.getString("plan_url")+"' Target='_blank' FillColor='White' ZoomPercent='120'/></ItemShapeSettings></MapShapeItem>)");
           count++;
       }

       
      }while (rs.next());
     }
     try
	 {
	 	QBean.close();
	 }
	 catch(SQLException exc)
	 {
	 	System.out.print(exc);
	 }
     NCIPopChartEmbedder myChart = new NCIPopChartEmbedder();
     myChart.appearanceFile = "apfiles/planet/ccpmap.pcxml";
     myChart.pcScript = pcScript.toString();
     myChart.height = 449;
     myChart.width = 629;
     myChart.imageType = "FLASH";
     myChart.fallback = "STRICT";
	 myChart.returnDescriptiveLink = false;
     myChart.userAgent = request.getHeader("USER-AGENT");
     htmlString = myChart.getEmbeddingHTML();
%>
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

<table summary="Links to state cancer control plans" bgcolor="white" border="0" cellpadding="5" cellspacing="0">
<tr>
<td align="left" colspan="3">
<div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 16px;	font-weight: bold;color : #000000;">
<%= pageTitle%>
</div>

<div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;">
To view, click on map or state name below.
</div>

</td>
</tr>
<tr>
<td valign='top'>
<%= stateList.toString()%>
<td valign='top'>
<br>
<%
//if there is only one column of state names, add a lot of padding for the map
if (count < 28)
 	out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
else //otherwise only add a couple of spaces for padding
	out.print("&nbsp;&nbsp;");
out.print(htmlString);
%>
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
