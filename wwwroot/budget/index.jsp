<%@ page language="java" contentType="text/html" %>
<!-- %@ page import="com.corda.CordaEmbedder" %  -->
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Cancer Control P.L.A.N.E.T. - State, Tribe and Territory Implementation Budgets</title>
	<link href="../styles.css" rel="stylesheet" type="text/css" />
	<link href="http://fonts.googleapis.com/css?family=Cabin" rel="stylesheet" type="text/css" />
	<script src="../Scripts/swfobject_modified.js" type="text/javascript"></script>
	<script language="JavaScript" src="../popwindow.js" type="text/javascript"></script>
	<script src="../toggle.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript" src="../javascript/jquery-1.4.2.js"></script>
	<script type="text/javascript" language="javascript" src="../javascript/jquery.listen-1.0.3-min.js"></script>
	<script type="text/javascript" language="javascript" src="../javascript/addThisListener.js"></script>
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
			<p>To locate Cancer Control Plans go to the <a href="../state_plans.jsp">Plans</a> page.</p>
			
			<div style="position: relative; float: left; width: 130px;">
				<p style="font-weight: bold;">States</p>
				<p>
					<a href="./budget_files/Delaware_Cancer_Control_Budget.pdf" class="a1" target="_blank">Delaware</a><br />
					<a href="./budget_files/Iowa Comprehensive Cancer Control Budget.xls" class="a1" target="_blank">Iowa</a><br />
					<a href="./budget_files/NH.zip" class="a1" target="_blank">New Hampshire</a><br />
					<a href="./budget_files/Wyoming Comprehensive Cancer Control Budget.pdf" class="a1" target="_blank">Wyoming</a>
				</p>
			</div>
			<div style="position: relative; float: right; width: 850px;">
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

		<div id="footer"><p><a href="../index.html">Home</a> | <a href="../contact.html">Contact Us</a> | <a href="../viewing-files.html">Viewing Files</a> | <a href="../privacy.html">Privacy Policy</a> | <a href="../disclaimer.html">Disclaimer</a> | <a href="../accessibility.html">Accessibility</a></p><br /></div>
	</div>
</div>
<!--  HF (6/3/08) CR #41097 
<script type="text/javascript" src="ieupdate.js"></script>
 -->
</body>
</html>
