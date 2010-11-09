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
		stateList.append("<table border='0' cellpadding='5' cellspacing='0' width='100%'><tr><th colspan='3' align='left' valign='top' nowrap>States</th><th colspan='1' align='left' valign='top' nowrap>Tribes</th></tr><tr><td valign='top' nowrap>");

		do
		{
			StatePlanBean rs = (StatePlanBean)it.next();
			
			if (rs.getPlanType().equals("S"))
			{
			
			   //the following lines are used to create can be added back in when the list gets over 27 states
			   //*******************************
			   if (count == 17)
			   {
			    stateList.append("</td><td valign='top'>");
			    //count = 0;
			   }
				if (count == 34)
			   {
			    stateList.append("</td><td valign='top'>");
			    //count = 0;
			   }
			   if (count == 51)
			   {
			    stateList.append("</td><td valign='top'>");
			    //count = 0;
			   }
	       
		       //******************************
		       if (rs.getPlanStatus() == 1)
		       {
					//create the text link
					stateList.append("<a href='"+ rs.getPlanUrl().trim()+"' title='"+rs.getName().trim());
		
					if (rs.getPlanPeriod() != null)
					{ 
						stateList.append(" (Plan period: "+ rs.getPlanPeriod()+")' target='_blank'>"+rs.getName()+"</a>");
					}else{
						stateList.append("' target='_blank'>"+rs.getName()+"</a>");
					}
		
					stateList.append("<br />");
		
					//Idaho_Childhood_Cancer_Control_Plan.pdf
					if (rs.getName().equals("Idaho"))
					{
						stateList.append("&nbsp;&nbsp;&nbsp;");
						stateList.append("<a href='state_plans/Idaho_Childhood_Cancer_Control_Plan.pdf' title='Childhood cancer' target='_blank'>Childhood cancer</a>");
						stateList.append("<br />");
					}
					
					count++;
		       }
			}
		}while (it.hasNext());

		//Tribes
		Iterator itb = statePlans.iterator();
		stateList.append("</td><td valign='top'>");
      	do
		{
			StatePlanBean rsb = (StatePlanBean)itb.next();
			
			if (rsb.getPlanType().equals("B"))
			{
			   //stateList.append("</td><td valign='top'>");
	       
		       //******************************
		       if (rsb.getPlanStatus() == 1)
		       {
					//create the text link
					stateList.append("<a href='"+ rsb.getPlanUrl().trim()+"' title='"+rsb.getName().trim());
					
					if (rsb.getPlanPeriod() != null)
					{ 
						stateList.append(" (Plan period: "+ rsb.getPlanPeriod()+")' target='_blank'>"+rsb.getName()+"</a>");
					}else{
						stateList.append("' target='_blank'>"+rsb.getName()+"</a>");
					}
		       }
		       
		       //******************************
		       if (rsb.getPlanStatus() != 1)
		       {
					//create the text link
					stateList.append(rsb.getName().trim());
		       }
		       
		       stateList.append("<br />");
				
				count++;
			}
		}while (itb.hasNext());
      
		//Territories
		stateList.append("<br /><table border='0' cellpadding='0' cellspacing='0' width='100%'><tr><th colspan='1' align='left' valign='top' nowrap>Territories</th></tr></table>");
		
       	Iterator itt = statePlans.iterator();
		
      	do
		{
			StatePlanBean rst = (StatePlanBean)itt.next();
			
			if (rst.getPlanType().equals("T"))
			{
			   //stateList.append("</td><td valign='top'>");

		    	//indent
				if (rst.getName().equals("Chuuk State") || rst.getName().equals("Kosrae") || rst.getName().equals("Pohnpei") || rst.getName().equals("Yap State"))
				{
					stateList.append("&nbsp;&nbsp;&nbsp;");
				}
	       
		       //******************************
		       if (rst.getPlanStatus() == 1)
		       {
					//create the text link
					stateList.append("<a href='"+ rst.getPlanUrl().trim()+"' title='"+rst.getName().trim());
					
					if (rst.getPlanPeriod() != null)
					{ 
						stateList.append(" (Plan period: "+ rst.getPlanPeriod()+")' target='_blank'>"+rst.getName()+"</a>");
					}else{
						stateList.append("' target='_blank'>"+rst.getName()+"</a>");
					}
		       }
		       
		       //******************************
		       if (rst.getPlanStatus() != 1)
		       {
					//create the text link
					stateList.append(rst.getName().trim());
		       }
		       
		       stateList.append("<br />");
				
				count++;
			}
		}while (itt.hasNext());
       	
		stateList.append("</td></tr></table>");
     }
%>
<html>
<head>
<title><%= caption%></title>
<link href="styles.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="popwindow.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" src="javascript/jquery-1.4.2.js"></script>
<script type="text/javascript" language="javascript" src="javascript/jquery.listen-1.0.3-min.js"></script>
<script type="text/javascript" language="javascript" src="javascript/addThisListener.js"></script>
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
				<a href="/cgi-bin/awredir.pl?url=http://ccplanettraining.cancer.gov/" onClick="javascript:popWindow('/cgi-bin/awredir.pl?url=http://ccplanettraining.cancer.gov/', 'name','925','600','yes'); return false;">On-line Training</a><br />
				<a href="about.html">About This Site</a><br />
				<a href="factsheet.pdf">Fact Sheet (PDF)</a><br />
				<a href="partners.html">P.L.A.N.E.T. Sponsors</a><br />
				<a href="faq.html">FAQ</a>
			</p>
			
			<!-- AddThis Code -->
            <script type="text/javascript">
            document.writeln('<a class="addthis_button" href="http://addthis.com/bookmark.php?v=250&username=ccplanet">');
            document.writeln('<img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a>');
            </script>

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
    <td colspan="3" id="breadcrumbs"><a href="index.html">Home</a> &gt; State, Tribe and Territory Plans</td>
  </tr>
</table>
<table summary="Links to state cancer control plans" bgcolor="white" border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
<td align="left" colspan="2">
<p><div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif; font-size : 16px; font-weight: bold;color : #000000;"><table align="right" width="400" border="0" cellpadding="0" cellspacing="0">
<tr>
<td><a href="http://apps.nccd.cdc.gov/CCCSearch/Default/Default.aspx" title="External link" onClick="javascript:popWindow('http://apps.nccd.cdc.gov/CCCSearch/Default/Default.aspx'); return false;"><img src="images/binocs.jpg" alt="" border="0" align="absmiddle"><strong>Search Cancer Control Plans</strong><img src="images/Icon_External_Link.png" alt="External link" border="0"></a><br />
  <span class="small">  (<strong>Note:</strong> the link above will take you to CDC's search tool.  <strong><br />
  New users</strong>, please click, "Help for new users" on CDC's Web site to learn how to use the search tool.)</span></td>
</tr>
</table><img src="images/planet_step5.gif" alt="Step 5" align="absmiddle">&nbsp;<%= pageTitle%></div></p>

<p><div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif; font-size : 14px; font-weight: bold;color : #000000;">(No link indicates that a cancer control plan is currently not available)</div></p>
</td>
</tr>
<tr>
<td valign='top'>
<%= stateList.toString()%>
</td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><hr size="1" noshade>
	<div align="center">
          <p><a href="index.html">Home</a>&nbsp;&nbsp;&nbsp;
              <a href="contact.html">Contact Us</a>&nbsp;&nbsp;&nbsp;
              <a href="about.html">About this Site</a>&nbsp;&nbsp;&nbsp;
              <a href="partners.html">Sponsors</a>&nbsp;&nbsp;&nbsp;
              <a href="privacy.html">Privacy Policy</a>&nbsp;&nbsp;&nbsp;
              <a href="disclaimer.html">Disclaimer</a>&nbsp;&nbsp;&nbsp;
            <a href="accessibility.html">Accessibility</a></p>
          <p><span class="sponsors">Links to non-Federal organizations  found at this site are provided solely as a service to our users. <br />
These links  do not constitute an endorsement of these organizations or their programs by  the Federal Government, and none should be inferred. <br />
The Federal Government is  not responsible for the content of the individual organization Web pages found  at these links.</span><br />
              </p>
	</div>
    </td>
  </tr>
</table>
</body></html>
