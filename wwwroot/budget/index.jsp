<%@ page language="java" contentType="text/html" %>
<!-- %@ page import="com.corda.CordaEmbedder" %  -->
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Cancer Control P.L.A.N.E.T. - State, Tribe and Territory Implementation Budgets</title>
	<!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-NXZ8842');</script>
	<!-- End Google Tag Manager -->
	<link href="../css/styles-2.css" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet" type="text/css" />
	<script src="../js/swfobject_modified.js" type="text/javascript"></script>
	<script language="JavaScript" src="../js/popwindow.js" type="text/javascript"></script>
	<script src="../js/toggle.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript" src="../js/jquery-1.4.2.js"></script>
	<script type="text/javascript" language="javascript" src="../js/jquery.listen-1.0.3-min.js"></script>
	<script type="text/javascript" language="javascript" src="../js/addThisListener.js"></script>
</head>

<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NXZ8842"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<div id="pageWrapper">
	<div id="skip"><a href="#skipnav">Skip to content</a></div>
	<div id="banner"><a href="../index.html"><img src="../images/banner.gif" width="1000" height="137" border="0" alt="Cancer Control P.L.A.N.E.T. Plan, Link, Act, Network with Evidence-based Tools" /></a></div>

	<div id="headerTagline">
			<a href="../index.html">Links to comprehensive cancer control resources for public health professionals</a>
		</div>
		<div id="contentWrapper">
		<div id="topNav">
			<p><a href="../index.html">Home</a> | <a href="../about.html">About This Site</a> | <a href="../faq.html">FAQ</a> | <a href="../sponsors.html">Sponsors</a></p></div>

		<a name="skipnav" id="skipnav"></a>
		<div id="content">
			<h2>State, Tribe and Territory Implementation Budgets</h2>

			<p>To view, click on map or state name below.</p>
			<p>To locate Cancer Control Plans go to the <a title="External link" href="http://www.cdc.gov/cancer/ncccp/ccc_plans.htm" onClick="javascript:popWindow('http://www.cdc.gov/cancer/ncccp/ccc_plans.htm', 'name','925','600','yes'); return false;">plans<img src="../images/Icon_External_Link.png" alt="External link" width="12" height="12" border="0"></a> page.</p>
			
			<div style="position: relative; float: left; width: 150px;">
				<p style="font-weight: bold;">States</p>
				<p>
					<a href="./budget_files/Delaware_Cancer_Control_Budget.pdf" class="a1" target="_blank">Delaware</a><br />
					<a href="./budget_files/Iowa Comprehensive Cancer Control Budget.xls" class="a1" target="_blank">Iowa</a><br />
					<a href="./budget_files/NH.zip" class="a1" target="_blank">New Hampshire</a><br />
					<a href="./budget_files/Wyoming Comprehensive Cancer Control Budget.pdf" class="a1" target="_blank">Wyoming</a>
				</p>
			</div>
			<div style="position: relative; float: right; width: 840px;">
				<%  
					String htmlString = "";
					StringBuffer pcScript = new StringBuffer();

					// HF (10/26/07) CR #40359 - reenable DE. 
					//  String[] entity = {"IA","NH","WY"};
					//  String[] docs = {"Iowa Comprehensive Cancer Control Budget.xls", "NH.zip", "Wyoming Comprehensive Cancer Control Budget.pdf"};
					String[] entity = {"DE", "IA","NH","WY"};
					String[] docs = {"Delaware_Cancer_Control_Budget.pdf", "Iowa Comprehensive Cancer Control Budget.xls", "NH.zip", "Wyoming Comprehensive Cancer Control Budget.pdf"};
					String[] prefix = {"", "redirectIE6.jsp?", "", ""};
					//    String[] prefix = {"", "indexOrig.jsp?", "", ""};

					try
					{
					for (int i=0; i<entity.length; i++)
					{
					// HF (6/22/07) CR #39949 - changed link from absolute URL (./budget_files/) to relative (./budget_files).
					//    		pcScript.append("US_" + entity[i] + ".SetValue(1)US_" + entity[i] + ".AddPCXML(<ItemShapeSettings><MapProperties OverrideDrilldownSettings='True'/><Drilldown URL='" + prefix[i] + "./budget_files/" + docs[i] + "' Target='_blank' FillColor='White' ZoomPercent='110'/></ItemShapeSettings>)");
					pcScript.append("US_" + entity[i] + ".SetValue(1)US_" + entity[i] + ".AddPCXML(<ItemShapeSettings><MapProperties OverrideDrilldownSettings='True'/><Drilldown URL='" + prefix[i] + "./budget_files/" + docs[i] + "' Target='_self' FillColor='White' ZoomPercent='110'/></ItemShapeSettings>)");
					}

					// CordaEmbedder theChart = new CordaEmbedder();		// HF (6/22/07) CR #39949 - replaced CordaEmbedder with our derived class, NCIPopChartEmbedder.
					NCIPopChartEmbedder theChart = new NCIPopChartEmbedder();

					theChart.appearanceFile = "apfiles/planet/US_planet_budget.pcxml";	// HF (6/22/07) CR #39949 - Adjusted to point to the planet directory on the Corda server (spica).
					theChart.height=449;
					theChart.width=629;

					//change the following to hit your optimap server/commport or redirector/clustermonitor address
					// HF (6/22/07) CR #39949 	theChart.externalServerAddress = "http://procyon.cit.nih.gov:2001";
					// HF (6/22/07) CR #39949         theChart.internalCommPortAddress = "http://procyon.cit.nih.gov:2002";
					//theChart.isPostRequest = true;
					// HF (6/22/07) CR #39949        theChart.externalServerAddress = "http://127.0.0.1:2001";
					//theChart.externalServerAddress = "http://192.168.2.8:8080/corda/server/";
					// HF (6/22/07) CR #39949         theChart.internalCommPortAddress = "http://127.0.0.1:2002";

					theChart.userAgent = request.getHeader("USER-AGENT");
					theChart.pcScript = pcScript.toString();
					theChart.returnDescriptiveLink = false;
					theChart.extraCTSCommands = "@_NOJSPOPUP";
					theChart.imageType = "FLASH";		// HF (6/22/07) CR #39949 - per Eric Luke, change outputType to imageType (former causes unresolved exception).
					theChart.addObjectParamTag("allowScriptAccess", "sameDomain");
					htmlString += theChart.getEmbeddingHTML();

					}
					catch(Exception exc)
					{
					//System.out.println(exc.toString());
					htmlString = "<p><FONT style=\"font-face: Arial, Helvetica;font-size: 18;font-style: bold;color: #000000;\">An error occured retrieving the image</FONT></p>";
					}
				%>
				<%= htmlString%>
			</div>
		</div>

		<div id="footer">
			<p>
				<a href="../index.html">Home</a> | 
				<a href="../contact.html">Contact Us</a> | 
				<a href="../viewing-files.html">Viewing Files</a> | 
				<a href="http://www.cancer.gov/global/web/policies/page2">Privacy Policy</a> | 
				<a href="../disclaimer.html">Disclaimer</a> | 
				<a href="http://www.cancer.gov/global/web/policies/page3">Accessibility</a> |
                <a href="http://www.cancer.gov/global/web/policies/foia">Freedom of Information Act</a>
			</p>
	
                           <p>Content on this page is maintained by the Division of Cancer Control and Population Sciences at the National Cancer Institute.</p>
            <p>
                Cancer Control P.L.A.N.E.T. is not affiliated with Planet Cancer. To visit Planet
                Cancer's site, please go to <a title="External link" href="http://www.planetcancer.org" onClick="javascript:popWindow(''); return false;">www.planetcancer.org<img border="0" alt="External link" src="images/Icon_External_Link.png" width="12" height="12" /></a>.</p>
            <br />
				
		
				
			<p style="text-align: center">
				<a href="http://www.hhs.gov" target="_blank">
					<img src="../images/footer-hhs.gif" alt="Department of Health and Human Services" /></a>
				<a href="http://www.usa.gov" target="_blank">
					<img style="margin-left: 12px;" src="../images/footer-usa.gif" alt="USA.gov" /></a><br /><br />
			</p>
		</div>
	</div>
</div>
<!--  HF (6/3/08) CR #41097 
<script type="text/javascript" src="ieupdate.js"></script>
 -->
 <script language="JavaScript" type="text/javascript" src="https://static.cancer.gov/webanalytics/WA_DCCPS_PageLoad.js"></script>
</body>
</html>
