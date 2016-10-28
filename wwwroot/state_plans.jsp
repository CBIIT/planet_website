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
	       
		       //******************************
		       if (rsb.getPlanStatus() == 1)
		       {
					//create the text link
					stateList.append("<a href='"+ rsb.getPlanUrl().trim()+"' title='"+rsb.getName().trim());
					if (rsb.getPlanPeriod() != null)
						stateList.append(" (Plan period: "+ rsb.getPlanPeriod()+")");
					stateList.append("'");
					
					// These two state plans are very large (25Mb/82Mb) and in some cases, Firefox displays, 
					// "the file is damaged and could not be repaired".  One workaround is to right click and save
					// to the hard drive.  This JS displays that and then attempts the download.
					if (rsb.getName().indexOf("Fond Du Lac") > -1)
						stateList.append(" onClick='showDownloadWarning()'");
						
					stateList.append(" target='_blank'>"+rsb.getName()+"</a>");
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
						stateList.append(" (Plan period: "+ rst.getPlanPeriod()+")");
					stateList.append("'");
					
					// These two state plans are very large (25Mb/82Mb) and in some cases, Firefox displays, 
					// "the file is damaged and could not be repaired".  One workaround is to right click and save
					// to the hard drive.  This JS displays that and then attempts the download.
					if (rst.getName().indexOf("Mariana") > -1)
						stateList.append(" onClick='showDownloadWarning()'");
						
					stateList.append(" target='_blank'>"+rst.getName()+"</a>");
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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="styles.css" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet" type="text/css" />
	<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
	<script language="JavaScript" src="popwindow.js" type="text/javascript"></script>
	<script src="toggle.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript" src="javascript/jquery-1.4.2.js"></script>
	<script type="text/javascript" language="javascript" src="javascript/jquery.listen-1.0.3-min.js"></script>
	<script type="text/javascript" language="javascript" src="javascript/addThisListener.js"></script>
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-30179125-1']);
	_gaq.push(['_trackPageview']);

	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
</script>
</head>

<body>

<div id="pageWrapper">
	<div id="skip"><a href="#skipnav">Skip to content</a></div>
	<div id="banner"><a href="index.html"><img src="images/banner.gif" width="1000" height="137" border="0" alt="Cancer Control P.L.A.N.E.T. Plan, Link, Act, Network with Evidence-based Tools" /></a></div>
	<div id="headerTagline">
			<a href="index.html">Links to comprehensive cancer control resources for public health professionals</a>
	</div>
	
	<div id="contentWrapper">
		<div id="topNav">
			<p><a href="index.html">Home</a> | <a href="about.html">About This Site</a> | <a href="faq.html">FAQ</a> | <a href="sponsors.html">Sponsors</a></p></div>

		<a name="skipnav" id="skipnav"></a>
		<div id="content">
			<div style="float: right; width: 400px; margin-bottom: 1em; margin-right: 28px;">
				<!--<a title="External link" href="/cgi-bin/awredir.pl?url=http://apps.nccd.cdc.gov/CCCSearch/Default/Default.aspx" onClick="javascript:popWindow('/cgi-bin/awredir.pl?url=http://apps.nccd.cdc.gov/CCCSearch/Default/Default.aspx'); return false;"><img src="images/binocs.jpg" alt="" border="0" align="absmiddle"><strong>Search Cancer Control Plans</strong><img src="images/Icon_External_Link.png" alt="External link" border="0"></a><br />-->
				<a title="External link" href="http://apps.nccd.cdc.gov/CCCSearch/Default/Default.aspx"><img src="images/binocs.jpg" alt="" border="0" align="absmiddle"><strong>Search Cancer Control Plans</strong><img src="images/Icon_External_Link.png" alt="External link" border="0"></a><br />
				<span style="font-size: 80%;">(<strong>Note:</strong> the link above will take you to CDC's search tool.<br />
				<strong>New users</strong>, please click, "Help for new users" on CDC's Web site to learn how to use the search tool.)</span>
			</div>
			<h2>State, Tribe and Territory Plans<br /><span style="font-size: 60%;">(No link indicates that a cancer control plan is currently not available)</span></h2>

			<table border='0' cellpadding='5' cellspacing='0' width='950'>
				<tr>
					<th colspan='3' align='left' valign='top' nowrap width="550">States</th>
					<th colspan='1' align='left' valign='top' nowrap width="400">Tribes</th>
				</tr>
				<tr>
					<td valign='top' nowrap width="183">
						<a href='state_plans/Alabama_Cancer_Control_Plan.pdf' title='Alabama' target='_blank'>Alabama</a><br />
						<a href='state_plans/Alaska_Cancer_Control_Plan.pdf' title='Alaska (Plan period: 2005-2010)' target='_blank'>Alaska</a><br />
						<a href='state_plans/Arizona_Cancer_Control_Plan.pdf' title='Arizona' target='_blank'>Arizona</a><br />
						<a href='state_plans/Arkansas_Cancer_Control_Plan.pdf' title='Arkansas' target='_blank'>Arkansas</a><br />
						<a href='state_plans/California_Cancer_Control_Plan.pdf' title='California' target='_blank'>California</a><br />
						<a href='state_plans/Colorado_Cancer_Control_Plan.pdf' title='Colorado' target='_blank'>Colorado</a><br />
						<a href='http://ctcancerpartnership.org/plan/plan.list.asp' title='Connecticut' target='_blank'>Connecticut<img border="0" alt="External link" src="images/Icon_External_Link.png" width="12" height="12" /></a><br />
						<a href='state_plans/Delaware_Cancer_Control_Plan.pdf' title='Delaware' target='_blank'>Delaware</a><br />
						<a href='state_plans/District_of_Columbia_Cancer_Control_Plan.pdf' title='District of Columbia' target='_blank'>District of Columbia</a><br />
						<a href='state_plans/Florida_Cancer_Control_Plan.pdf' title='Florida' target='_blank'>Florida</a><br />
						<a href='state_plans/Georgia_Cancer_Control_Plan.pdf' title='Georgia' target='_blank'>Georgia</a><br />
						<a href='state_plans/Hawaii_Cancer_Control_Plan.pdf' title='Hawaii' target='_blank'>Hawaii</a><br />
						<a href='state_plans/Idaho_Cancer_Control_Plan.pdf' title='Idaho' target='_blank'>Idaho</a><br />
						<a style="margin-left: 1em;" href='state_plans/Idaho_Childhood_Cancer_Control_Plan.pdf' title='Childhood cancer' target='_blank'>Childhood cancer</a><br />
						<a href='state_plans/Illinois_Cancer_Control_Plan.pdf' title='Illinois' target='_blank'>Illinois</a><br />
						<a href='state_plans/Indiana_Cancer_Control_Plan.pdf' title='Indiana' target='_blank'>Indiana</a><br />
						<a href='state_plans/Iowa_Cancer_Control_Plan.pdf' title='Iowa' target='_blank'>Iowa</a><br />
						<a href='state_plans/Kansas_Cancer_Control_Plan.pdf' title='Kansas' target='_blank'>Kansas</a><br />
					</td>
					<td valign='top' width="183">
						<a href='state_plans/Kentucky_Cancer_Control_Plan.pdf' title='Kentucky' target='_blank'>Kentucky</a><br />
						<a href='state_plans/Louisiana_Cancer_Control_Plan.pdf' title='Louisiana' target='_blank'>Louisiana</a><br />
						<a href='state_plans/Maine_Cancer_Control_Plan.pdf' title='Maine' target='_blank'>Maine</a><br />
						<a href='state_plans/Maryland_Cancer_Control_Plan.pdf' title='Maryland' target='_blank'>Maryland</a><br />
						<a href='state_plans/Massachusetts_Cancer_Control_Plan.pdf' title='Massachusetts' target='_blank'>Massachusetts</a><br />
						<a href='state_plans/Micihigan_Cancer_Control_Plan.pdf' title='Michigan' target='_blank'>Michigan</a><br />
						<a href='state_plans/Minnesota_Cancer_Control_Plan.pdf' title='Minnesota' target='_blank'>Minnesota</a><br />
						<a href='state_plans/Mississippi_Cancer_Control_Plan.pdf' title='Mississippi' target='_blank'>Mississippi</a><br />
						<a href='state_plans/Missouri_Cancer_Control_Plan.pdf' title='Missouri' target='_blank'>Missouri</a><br />
						<a href='state_plans/Montana_Cancer_Control_Plan.pdf' title='Montana' target='_blank'>Montana</a><br />
						<a href='state_plans/Nebraska_Cancer_Control_Plan.pdf' title='Nebraska' target='_blank'>Nebraska</a><br />
						<a href='state_plans/Nevada_Cancer_Control_Plan.pdf' title='Nevada' target='_blank'>Nevada</a><br />
						<a href='state_plans/New_Hampshire_Cancer_Control_Plan.pdf' title='New Hampshire' target='_blank'>New Hampshire</a><br />
						<a href='state_plans/New_Jersey_Cancer_Control_Plan.pdf' title='New Jersey' target='_blank'>New Jersey</a><br />
						<a href='state_plans/New_Mexico_Cancer_Control_Plan.pdf' title='New Mexico' target='_blank'>New Mexico</a><br />
						<a href='state_plans/New_York_Cancer_Control_Plan.pdf' title='New York' target='_blank'>New York</a><br />
						<a href='state_plans/North_Carolina_Cancer_Control_Plan.pdf' title='North Carolina' target='_blank'>North Carolina</a><br />
					</td>
					<td valign='top' width="183">
						<a href='state_plans/North_Dakota_Cancer_Control_Plan.pdf' title='North Dakota' target='_blank'>North Dakota</a><br />
						<a href='state_plans/Ohio_Cancer_Control_Plan.pdf' title='Ohio' target='_blank'>Ohio</a><br />
						<a href='state_plans/Oklahoma_Cancer_Control_Plan.pdf' title='Oklahoma' target='_blank'>Oklahoma</a><br />
						<a href='state_plans/Oregon_Cancer_Control_Plan.pdf' title='Oregon' target='_blank'>Oregon</a><br />
						<a href='state_plans/Pennsylvania_Cancer_Control_Plan.pdf' title='Pennsylvania' target='_blank'>Pennsylvania</a><br />
						<a href='state_plans/Rhode_Island_Cancer_Control_Plan.pdf' title='Rhode Island' target='_blank'>Rhode Island</a><br />
						<a href='state_plans/South_Carolina_Cancer_Control_Plan.pdf' title='South Carolina' target='_blank'>South Carolina</a><br />
						<a href='state_plans/South_Dakota_Cancer_Control_Plan.pdf' title='South Dakota' target='_blank'>South Dakota</a><br />
						<a href='state_plans/Tennessee_Cancer_Control_Plan.pdf' title='Tennessee' target='_blank'>Tennessee</a><br />
						<a href='state_plans/Texas_Cancer_Control_Plan.pdf' title='Texas' target='_blank'>Texas</a><br />
						<a href='state_plans/Utah_Cancer_Control_Plan.pdf' title='Utah' target='_blank'>Utah</a><br />
						<a href='state_plans/Vermont_Cancer_Control_Plan.pdf' title='Vermont' target='_blank'>Vermont</a><br />
						<a href='state_plans/Virginia_Cancer_Control_Plan.pdf' title='Virginia' target='_blank'>Virginia</a><br />
						<a href='state_plans/Washington_Cancer_Control_Plan.pdf' title='Washington' target='_blank'>Washington</a><br />
						<a href='state_plans/West_Virginia_Cancer_Control_Plan.pdf' title='West Virginia' target='_blank'>West Virginia</a><br />
						<a href='state_plans/Wisconsin_Cancer_Control_Plan.pdf' title='Wisconsin' target='_blank'>Wisconsin</a><br />
						<a href='state_plans/Wyoming_Cancer_Control_Plan.pdf' title='Wyoming' target='_blank'>Wyoming</a><br />
					</td>
					<td valign='top'>
						<a href='state_plans/Alaska_Native_Tribal_Health_Consortium_Cancer_Control_Plan.pdf' title='Alaska Native Tribal Health Consortium' target='_blank'>Alaska Native Tribal Health Consortium</a><br />
						<a href='state_plans/Cherokee_Nation_Cancer_Control_Plan.pdf' title='Cherokee Nation' target='_blank'>Cherokee Nation</a><br />
						<a href='state_plans/Fond_du_Lac_Cancer_Control_Plan.pdf' title='Fond Du Lac Reservation' onClick='showDownloadWarning()' target='_blank'>Fond Du Lac Reservation</a><br />
						<a href='state_plans/Northern_Plains_Native_American_Cancer_Control_Plan.pdf' title='Northern Plains Native American' target='_blank'>Northern Plains Native American</a><br />
						<a href='state_plans/Northwest_Portland_Area_Indian_Health_Board_Cancer_Control_Plan.pdf' title='Northwest Portland Area Indian Health Board' target='_blank'>Northwest Portland Area Indian Health Board</a><br />
						<a href='state_plans/South_Puget_Cancer_Control_Plan.pdf' title='South Puget Intertribal Planning Agency' target='_blank'>South Puget Intertribal Planning Agency</a><br />
						<a href='state_plans/Tohono_O_Odham_Cancer_Control_Plan .pdf' title='Tohono O'Odham Nation' target='_blank'>Tohono O'Odham Nation</a><br /><br />
						<span style="font-weight: bold;">Territories</span><br />
						<a href='state_plans/American_Samoa_Cancer_Control_Plan.pdf' title='American Samoa' target='_blank'>American Samoa</a><br />
						<a href='state_plans/Commonwealth_of_the_Northern_Mariana_Islands_Cancer_Control_Plan.pdf' title='Commonwealth of the Northern Mariana Islands' onClick='showDownloadWarning()' target='_blank'>Commonwealth of the Northern Mariana Islands</a><br />
						<a href='state_plans/Federated_States_of_Micronesia_Cancer_Control_Plan.pdf' title='Federated States of Micronesia (National)' target='_blank'>Federated States of Micronesia (National)</a><br />
						<a style="margin-left: 1em;" href='state_plans/Chuuk_State_Cancer_Control_Plan.pdf' title='Chuuk State' target='_blank'>Chuuk State</a><br />
						<a style="margin-left: 1em;" href='state_plans/Kosrae_Cancer_Control_Plan.pdf' title='Kosrae' target='_blank'>Kosrae</a><br />
						<a style="margin-left: 1em;" href='state_plans/Pohnpei_State_Cancer_Control_Plan.pdf' title='Pohnpei' target='_blank'>Pohnpei</a><br />
						<a style="margin-left: 1em;" href='state_plans/Yap_State_Cancer_Control_Plan.pdf' title='Yap State' target='_blank'>Yap State</a><br />
						<a href='state_plans/Guam_Cancer_Control_Plan.pdf' title='Guam' target='_blank'>Guam</a><br />
						Puerto Rico<br />
						<a href='state_plans/Republic_of_the_Marshall_Islands_Cancer_Control_Plan.pdf' title='Republic of the Marshall Islands' target='_blank'>Republic of the Marshall Islands</a><br />
						<a href='state_plans/Republic_of_Palau_Cancer_Control_Plan.pdf' title='Republic of Palau' target='_blank'>Republic of Palau</a><br />
						<a href='state_plans/Pacific_Regional_Cancer_Control_Plan.pdf' title='U.S. Affiliated Pacific Island Nations (Pacific Regional)' target='_blank'>U.S. Affiliated Pacific Island Nations (Pacific Regional)</a><br />
						Virgin Islands<br />
					</td>
				</tr>
			</table>

		</div>

		<div id="footer">
			<p>
				<a href="index.html">Home</a> | 
				<a href="contact.html">Contact Us</a> | 
				<a href="viewing-files.html">Viewing Files</a> | 
				<a href="http://www.cancer.gov/global/web/policies/page2">Privacy Policy</a> | 
				<a href="disclaimer.html">Disclaimer</a> | 
				<a href="http://www.cancer.gov/global/web/policies/page3">Accessibility</a> |
                <a href="http://www.cancer.gov/global/web/policies/foia">Freedom of Information Act</a>
			</p>
	
                           <p>Content on this page is maintained by the Division of Cancer Control and Population Sciences at the National Cancer Institute.</p>
            <p>
                Cancer Control P.L.A.N.E.T. is not affiliated with Planet Cancer. To visit Planet
                Cancer's site, please go to <a title="External link" href="/cgi-bin/awredir.pl?url=http://www.planetcancer.org" onClick="javascript:popWindow(''); return false;">www.planetcancer.org<img border="0" alt="External link" src="images/Icon_External_Link.png" width="12" height="12" /></a>.</p>
            <br />
				
		
				
			<p style="text-align: center">
				<a href="/cgi-bin/awredir.pl?url=http://www.hhs.gov" target="_blank">
					<img src="images/footer-hhs.gif" alt="Department of Health and Human Services" /></a>
				<a href="/cgi-bin/awredir.pl?url=http://www.usa.gov" target="_blank">
					<img style="margin-left: 12px;" src="images/footer-usa.gif" alt="USA.gov" /></a><br /><br />
			</p>
		</div>
	</div>
</div>
<script language="JavaScript" type="text/javascript" src="/JS/Omniture/WA_DCCPS_PageLoad.js"></script>
</body>
</html>
