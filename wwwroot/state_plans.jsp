﻿<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<%

response.setStatus(301);
response.setHeader( "Location", "https://cancercontrolplanet.cancer.gov/" );


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
		  <h2>State, Tribe and Territory Plans<br />
		    <span style="font-size: 60%;">(No longer available)</span></h2>
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
 <script language="JavaScript" type="text/javascript" src="https://static.cancer.gov/webanalytics/WA_DCCPS_PageLoad.js"></script>
</body>
</html>
