<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<%
String param;
String htmlString = null;
String caption = "State, Tribe and Territory Plans";
String pageTitle = "State, Tribe and Territory Plans";
int count= 0;

StringBuffer stateList = null;
StringBuffer pcScript = null;

     QueryBean QBean = new QueryBean();
     Vector statePlans = QBean.getStatePlans();

     //now get the information to display
     //theQuery = "SELECT state, name, plan_status, plan_URL, type FROM states;";

	 String beginTD = "<tr><td style='font-family: Arial,Helvetica;font-size: 12;' align=\"left\">";
	 String endTD = "</td></tr>";

     pcScript = new StringBuffer();
     pcScript.append("US.addPCXML(<DefaultBackgroundShapeSettings><Properties FillColor='#b2b2b2' FillType='Pattern' PatternType='DiagonalBottomToTop'/><Drilldown URL='' FillColor='White' ZoomPercent='120'/></DefaultBackgroundShapeSettings>");
     pcScript.append("<DefaultShapeSettings Type='Circle' Width='8' Height='8'><Properties FillColor='#b2b2b2' FillType='Pattern' PatternType='DiagonalBottomToTop'/><Drilldown URL='' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>");
     pcScript.append("<Range Name='Plandp' LegendText='Cancer plan available (Tribal)' Minimum='1.0' Maximum='1.0'><RangeShapeSettings  Type='Circle' Width='8' Height='8'><MapProperties OverrideFillColor='True' OverrideShapeSettings='True'/><Properties FillColor='#b3a8ee'/></RangeShapeSettings></Range>");
     pcScript.append("<Range Name='NoPlandp' LegendText='Cancer plan in progress (Tribal)' Minimum='No data' Maximum='No data'><RangeShapeSettings  Type='Circle' Width='8' Height='8'><MapProperties OverrideFillColor='True' OverrideShapeSettings='True'/><Properties FillColor='#bfbfbf' FillType='Pattern' PatternType='DiagonalTopToBottom'/></RangeShapeSettings></Range>");
     pcScript.append("<Range Name='Plan' LegendText='Cancer plan available' Minimum='1.0' Maximum='1.0' BackgroundRange='True'><RangeShapeSettings  Type='Rectangle' Width='8' Height='8'><MapProperties OverrideFillColor='True' OverrideShapeSettings='True'/><Properties FillColor='#b3a8ee'/></RangeShapeSettings></Range>");
     pcScript.append("<Range Name='NoPlan' LegendText='Cancer plan in progress' Minimum='No data' Maximum='No data' BackgroundRange='True'><RangeShapeSettings  Type='Rectangle' Width='8' Height='8'><MapProperties OverrideFillColor='True' OverrideShapeSettings='True'/><Properties FillColor='#bfbfbf' FillType='Pattern' PatternType='DiagonalTopToBottom'/></RangeShapeSettings></Range>)");
     pcScript.append("US.addPCXML(<Legend Name='legend' Top='5' Left='213' Width='403' Height='23' ZIndex='56'><Properties RangeSizeForMarkers='True' MinimumFontSize='10.0' ReverseOrder='True' Font='Name:Helvetica; Size:11.0;'/></Legend>)");

     Iterator it = statePlans.iterator();

     if (it.hasNext())
     {
      stateList = new StringBuffer();

      String typeString = "S";
      do
      {
       StatePlanBean rs = (StatePlanBean)it.next();
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
       if (rs.getPlanStatus() == 1 && (typeString.toUpperCase().compareTo(rs.getPlanType().toUpperCase()) != 0))
       {
          stateList.append("<br />");
          typeString = rs.getPlanType();
       }
       //******************************

       //if (count > 0)
       //	stateList.append("<br />");

       if (rs.getPlanStatus() == 1)
       {
       				stateList.append("<br />");
           //create the text link
           stateList.append("<a href='"+ rs.getPlanUrl().trim()+"' class='a1'  title='"+rs.getName().trim());
					 if (rs.getPlanPeriod() != null)
					 { 
					 stateList.append(" (Plan period: "+ rs.getPlanPeriod()+")' target='_blank'>"+rs.getName()+"</a>");
					 }else{
					 stateList.append("' target='_blank'>"+rs.getName()+"</a>");
					 }
					 
           //create the link on the map
           if (rs.getState().equals("PI") || rs.getState().equals("CN") || rs.getState().equals("FD") || rs.getState().equals("SP") || rs.getState().equals("AN"))
           {
	           pcScript.append("US.addPCXML(<MapShapeItem Name='"+rs.getState()+"' Value='1'><ItemShapeSettings  Type='Circle' Diameter='8'><MapProperties OverrideDrilldownSettings='True'/><Drilldown URL='"+rs.getPlanUrl()+"' Target='_blank' FillColor='White' ZoomPercent='120'/></ItemShapeSettings></MapShapeItem>)");
           }else{
	           pcScript.append("US.addPCXML(<MapShapeItem Name='"+rs.getState()+"' Value='1'><ItemShapeSettings><MapProperties OverrideDrilldownSettings='True'/><Drilldown URL='"+rs.getPlanUrl()+"' Target='_blank' FillColor='White' ZoomPercent='120'/></ItemShapeSettings></MapShapeItem>)");
           }
           count++;
       }

      }while (it.hasNext());
     }

     NCIPopChartEmbedder myChart = new NCIPopChartEmbedder();
     myChart.appearanceFile = "apfiles/planet/ccpmap_tribe.pcxml";
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
		<td><p class="banner"><a href="index.html"><img src="images/planet_logo.gif" alt="Cancer Control P.L.A.N.E.T. - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
		<td><a href="index.html"><img src="images/planet_banner_wider.gif" alt="Cancer Control P.L.A.N.E.T. - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
		<td>
			<p>
				<a href="index.html">Home</a><br />
				<a href="contact.html">Contact Us</a><br />
				<a href="http://ccplanetraining.cancer.gov" onclick="javascript:popWindow('http://ccplanetraining.cancer.gov', 'name','725','400','yes'); return false;">On-line Training</a><br />
				<a href="about.html">About This Site</a><br />
				<a href="factsheet.pdf">Fact Sheet (PDF)</a><br />
				<a href="partners.html">P.L.A.N.E.T. Sponsors</a>
			</p>
			
			<!-- AddThis Code -->
            <script type="text/javascript">
            document.writeln('<a class="addthis_button" href="http://addthis.com/bookmark.php?v=250&username=ccplanet">');
            document.writeln('<img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a>');
            </script>

            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js?pub=mashalababy"></script>

            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=ccplanet"></script><script type="text/javascript">
            var addthis_config = {
                services_compact: 'email,print,twitter,ccplanet.cancer.gov,facebook,myspace,digg, more',
                services_custom: [{
                    	name: "Badges",
              	        url: "http://ccplanet.cancer.gov/badges.html",
              	        icon: "http://ccplanet.cancer.gov/images/planet_icon_tiny.gif"}],
              	        data_track_linkback: true,
		 		        ui_508_compliant: true
        
                }
            </script>
		</td>
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
<div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif; font-size : 16px; font-weight: bold;color : #000000;">
<%= pageTitle%>
</div>

<p><div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif; font-size : 12px; color : #000000;">To locate Cancer Control Budgets, go to the <a href="http://ccplanet.cancer.gov/budget/indexOrig.jsp" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif; font-size : 12px;">Budgets</a> page.</div></p>

<p><div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif; font-size : 12px; color : #000000;">
To view, click on map or state name below.  <!-- List shows state name followed by plan period. --></div></p>

</td>
</tr>
<tr>
<td valign='top'>
<%= stateList.toString()%>
<td valign='top'>
<br />
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
	<div align="center">
          <a href="index.html">Home</a>&nbsp;&nbsp;&nbsp;
          <a href="contact.html">Contact Us</a>&nbsp;&nbsp;&nbsp;	<a href="http://ccplanetraining.cancer.gov" onclick="javascript:popWindow('http://ccplanetraining.cancer.gov', 'name','725','400','yes'); return false;">On-line Training</a><br />
          <a href="about.html">About this Site</a>&nbsp;&nbsp;&nbsp;
          <a href="partners.html">Sponsors</a>&nbsp;&nbsp;&nbsp;
          <a href="privacy.html">Privacy Policy</a>&nbsp;&nbsp;&nbsp;
          <a href="disclaimer.html">Disclaimer</a>&nbsp;&nbsp;&nbsp;
          <a href="accessibility.html">Accessibility</a><br />
      </div></td>
  </tr>
</table>
</body></html>
