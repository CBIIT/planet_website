<%@ page language="java" contentType="text/html" %>
<!-- %@ page import="com.corda.CordaEmbedder" %  -->
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>


<html>
<head>
<title>State, Tribe and Territory Implementation Budgets</title>
<link href="../styles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bgcolor="White">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p class="banner"><a href="../index.html"><img src="../images/planet_logo.gif" alt="Cancer Control P.L.A.N.E.T. - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>    <td><a href="../index.html"><img src="../images/planet_banner_wider.gif" alt="Cancer Control P.L.A.N.E.T. - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
<td><p><a href="../index.html">Home</a><br>
		<a href="../contact.html">Contact Us</a><br>
		<a href="/cgi-bin/awredir.pl?url=http://ccplanetraining.cancer.gov" onClick="javascript:popWindow('/cgi-bin/awredir.pl?url=http://ccplanetraining.cancer.gov', 'name','925','600','yes'); return false;">On-line Training</a><br />
	    <a href="../about.html">About This Site</a><br>
        <a href="../factsheet.pdf">Fact Sheet (PDF)</a><br>
        <a href="../partners.html">Sponsors</a></p></td>
  </tr>
  <tr>
    <td colspan="3" id="breadcrumbs"><a href="../index.html">Home</a> &gt; State, Tribe and Territory Implementation Budgets</td>
  </tr>
  <tr>
    <td colspan="3" id="breadcrumbs2">&nbsp;</td>
  </tr>
</table>

<div STYLE="display: block; position: relative; left: 5px">

<table summary="Links to province cancer control plans" bgcolor="white" border="0" cellpadding="5" cellspacing="0">
<tr>
<td align="left" colspan="3">
<div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif; font-size : 16px; font-weight: bold;color : #000000;">
<img src="../images/planet_step5.gif" alt="Step 5" align="absmiddle">&nbsp;State, Tribe and Territory Implementation Budgets</div>

<p><div style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif; font-size : 12px; color : #000000;">
To view, click on map or state name below.
<p>To locate Cancer Control Plans go to the  <a href="../state_plans.jsp">Plans</a> page.</p>

</div>

</td>
</tr>
<tr>
<td valign='top'><table border='0' cellpadding='5' cellspacing='0' width='100%'><tr><th colspan='2' align='left' valign='top' nowrap>States</th></tr><tr><td valign='top' nowrap style='font-family:Arial, Helvetica, Verdana, Geneva, sans-serif;font-size:12px;'>

<a href="./budget_files/Delaware_Cancer_Control_Budget.pdf" class="a1" target="_blank">Delaware</a><br />
<a href="./budget_files/Iowa Comprehensive Cancer Control Budget.xls" class="a1" target="_blank">Iowa</a><br />
<a href="./budget_files/NH.zip" class="a1" target="_blank">New Hampshire</a><br />
<a href="./budget_files/Wyoming Comprehensive Cancer Control Budget.pdf" class="a1" target="_blank">Wyoming</a></td></tr>
</table><br />
</td>
	<td valign='top'>
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
	      htmlString += theChart.getEmbeddingHTML();
        
    }
    catch(Exception exc)
    {
     //System.out.println(exc.toString());
     htmlString = "<p><FONT style=\"font-face: Arial, Helvetica;font-size: 18;font-style: bold;color: #000000;\">An error occured retrieving the image</FONT></p>";
    }
%>
<%= htmlString%>
</td>
</tr>
</table>
</div>

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
<!--  HF (6/3/08) CR #41097 
<script type="text/javascript" src="ieupdate.js"></script>
 -->
</body></html>

