<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%
String region = "ALL";
String pcScript = "";
String topic = "C";
String htmlString = null;
String caption = null;
String cdcSubTitle = "State Health Department Contact";
String param = request.getParameter("r");
String stateName = "";
String stateStatic = "";
String topicDesc = "";


if (param != null)
    region = param.toUpperCase();
	
param = request.getParameter("cctopic");
if (param != null)
    topic = param.toUpperCase();
    StringBuffer outString = null;
    StringBuffer stateList = null;
    ResultSet rs = null;
    QueryBean QBean = new QueryBean();

    // Find the page title to use based on the topic
    String pageTitle = QBean.getTopicDescription(topic) + " Partners";
    caption = "Cancer Control PLANET - " + pageTitle;

    if (region.equals("ALL"))
    {
        pcScript = "US.addPCXML(<DefaultShapeSettings><Properties FillColor='#B20000'/><Drilldown URL='list.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)";
        rs = QBean.getPartners(topic.toUpperCase());
		stateStatic="the US";
    }
    else
    {
        pcScript = "US.setShapeValues("+region.trim()+",1)US.addPCXML(<DefaultShapeSettings><Drilldown URL='list.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)@_END";
        rs = QBean.getPartners(topic.toUpperCase(), region);
    }

    String beginTD = "<tr><td style='font-family: Arial,Helvetica;font-size: 12;' align=\"left\">";
    String endTD = "</td></tr>";

    if (rs.next())
    {
        outString = new StringBuffer();
        String partnerString = "";
        int partnerId = 0;
        
        int count = 1;
        String typeString = "";
        String typeOutput = "";
		
		
        do
        {
            if (stateName.compareTo(rs.getString("state_name").trim()) != 0)
            {
                if (count > 1)
                    outString.append("</table></p>");
                partnerId = rs.getInt("partner_id");
                partnerString = rs.getString("partner_abbreviation");
                typeString = rs.getString("type");
                stateName = rs.getString("state_name");
                outString.append("<table border='0' cellspacing='0' cellpadding='0' width='100%'>");
                outString.append("<tr><td style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left'>"+rs.getString("partner_name")+endTD);

                outString.append("<tr><td style='font-family: Arial, Helvetica, sans-serif;font-size: 12;font-style: normal;' align='left'>");
                outString.append("<u>" + rs.getString("type_description"));
                
                // For state and territory contacts we may need to tack on some additional information.
                if (partnerString.equals("CDC") && !typeString.equals("W"))
                {
                    if (topic.equals("T"))
                        outString.append(" Health Department Web Site");
                    else
                        if (topic.equals("P"))
                            outString.append(" Health Department Contact");
                        else
                            outString.append(" Contact");
                }

                // Close the underlining and the table cell.
                outString.append("</u>"+endTD);
            }

            if (partnerId != rs.getInt("partner_id"))
            {
                if (count > 1)
                   outString.append("</table></p>");
                partnerId = rs.getInt("partner_id");
                partnerString = rs.getString("partner_abbreviation");
                typeString = rs.getString("type");
                outString.append("<p><table border='0' cellspacing='0' cellpadding='0' width='100%'>");
                outString.append("<tr><td style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left'>"+rs.getString("partner_name")+endTD);

                outString.append("<tr><td style='font-family: Arial, Helvetica, sans-serif;font-size: 12;style: bold;' align='left'>");
                outString.append("<u>" + rs.getString("type_description"));
                
                // For state and territory contacts we may need to tack on some additional information.
                if (partnerString.equals("CDC") && !typeString.equals("W"))
                {
                    if (topic.equals("T"))
                        outString.append(" Health Department Web Site");
                    else
                        if (topic.equals("P"))
                            outString.append(" Health Department Contact");
                        else
                            outString.append(" Contact");
                }

                // Close the underlining and the table cell.
                outString.append("</u>" + endTD);
            }

            if (typeString.compareTo(rs.getString("type").trim()) != 0)
            {
                outString.append("<tr><td height='20'>&nbsp;</td></tr>");
                outString.append("<tr><td style='font-family: Arial,Helvetica;font-size: 12;font-style: normal;' align='left'>");
                outString.append("<u>" + rs.getString("type_description"));
                if (partnerString.equals("CDC") && !typeString.equals("W"))
                {
                    if (topic.compareTo("C") != 0)
                       outString.append(" Health Department Contact");
                    else
                       outString.append(" Contact");
                }

                // Close the underlining and the table cell.
                outString.append("</u>" + endTD);
                typeString = rs.getString("type");
            }

            if (rs.getString("contact_name") != null && rs.getString("contact_name").compareTo("") != 0)
            {
                outString.append(beginTD+rs.getString("contact_name").trim());

                if (rs.getString("degree") != null && rs.getString("degree").compareTo("") != 0)
                    outString.append(", "+rs.getString("degree"));
                outString.append(endTD);
            }
            if (rs.getString("title") != null && rs.getString("title").compareTo("") != 0)
                outString.append(beginTD+rs.getString("title").trim()+endTD);
            if (rs.getString("org1") != null && rs.getString("org1").compareTo("") != 0)
                outString.append(beginTD+rs.getString("org1").trim()+endTD);
            if (rs.getString("org2") != null && rs.getString("org2").compareTo("") != 0)
                outString.append(beginTD+rs.getString("org2").trim()+endTD);
            if (rs.getString("address1") != null && rs.getString("address1").compareTo("") != 0)
                outString.append(beginTD+rs.getString("address1").trim()+endTD);
            if (rs.getString("address2") != null && rs.getString("address2").compareTo("") != 0)
                outString.append(beginTD+rs.getString("address2").trim()+endTD);
            if (rs.getString("city") != null && rs.getString("city").compareTo("") != 0)
                outString.append(beginTD+rs.getString("city").trim()+", "+rs.getString("address_state")+" "+rs.getString("zip").trim()+endTD);
            if (rs.getString("phone") != null && rs.getString("phone").compareTo("") != 0)
                    outString.append(beginTD+"Phone:  "+rs.getString("phone").trim()+endTD);
            if (rs.getString("fax") != null && rs.getString("fax").compareTo("") != 0)
                    outString.append(beginTD+"Fax:  "+rs.getString("fax").trim()+endTD);
            if (rs.getString("cell") != null && rs.getString("cell").compareTo("") != 0)
                    outString.append(beginTD+"Cell:  "+rs.getString("cell").trim()+endTD);
            if (rs.getString("email") != null && rs.getString("email").compareTo("") != 0)
            {
                String emailStr = rs.getString("email").trim();
                outString.append(beginTD+"Email:  <a href=\"mailto:"+emailStr+"\" class='a1'>"+emailStr+"</a>"+endTD);
            }
            if (rs.getString("orgurl") != null && rs.getString("orgurl").compareTo("") != 0)
            {
                String urlStr = "";
                if (rs.getString("orgurl").indexOf("http://") < 0)
                    urlStr = "http://"+rs.getString("orgurl").trim();
                else
                    urlStr = rs.getString("orgurl").trim();

                // Don't display Web site: field header for tobacco, breast cancer, and cervical cancer contacts.
                if (partnerString.equals("CDC") && (topic.equals("T") || topic.equals("B") || topic.equals("V")))
                {
                   outString.append(beginTD+"<a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
                }
                else
                    outString.append(beginTD+"Web site:  <a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
            }
            if (rs.getString("orgurl2") != null && rs.getString("orgurl").compareTo("") != 0)
            {
                String urlStr = "";
                if (rs.getString("orgurl2").indexOf("http://") < 0)
                    urlStr = "http://"+rs.getString("orgurl2").trim();
                else
                    urlStr = rs.getString("orgurl2").trim();

                // Don't display Web site: field header for tobacco, breast cancer, and cervical cancer contacts.
                if (partnerString.equals("CDC") && (topic.equals("T") || topic.equals("B") || topic.equals("V")))
                {
                   outString.append(beginTD+"<a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
                }
                else
                    outString.append(beginTD+"Web site:  <a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
            }
            outString.append("<tr><td height='10'>&nbsp;</td></tr>");

            count ++;
        } while (rs.next());
		outString.append("</table>");
    } //end of if statement
	else {
		outString = new StringBuffer();
		outString.append("No records found.");
	}

    rs = QBean.getStateList();
    if (rs.next())
    {
        stateList = new StringBuffer();
		stateList.append("<table bgcolor='white' border='0' cellpadding='5' cellspacing='0'><tr><td valign='top' nowrap>");
        String typeString = "S";
        int count= 0;


		
        do
        {
	
			
			if (region.compareTo(rs.getString("abbreviation")) == 0)
				stateStatic=rs.getString("name");
				
            if (count > 27)
            {
                stateList.append("</td><td valign='top' nowrap>");
                count = 0;
            }
            
			if (typeString.compareTo(rs.getString("type")) != 0)
            {
                stateList.append("<br />");
                typeString = rs.getString("type");
            }
			
            if (count > 0)
                stateList.append("<br />");
			
			if (region.compareTo(rs.getString("abbreviation")) == 0)
				stateList.append("<font style='font-family : Arial, Verdana, Geneva, Helvetica, sans-serif;	font-size : 12px; color : FF0000;'>"+rs.getString("name").trim()+"</font>");
			else
	            stateList.append("<a href='list.jsp?r="+rs.getString("abbreviation")+"&cctopic="+topic.toUpperCase()+"' class='a1' title='"+rs.getString("name").trim()+"'>"+rs.getString("name")+"</a>");			
            
			count++;
        } while (rs.next());
        stateList.append("</td></tr><tr><td colspan=2><a href='list.jsp?r=ALL&cctopic=" + topic + "' title=\"All states and regions\">View All U.S. Partners</a></td></tr></table>");
    }


		pageTitle = pageTitle + " - " + stateStatic;
		
		if (stateStatic.compareTo("the US") == 0)
			stateStatic = "All States";
			
    QBean.close();

    NCIPopChartEmbedder myChart = new NCIPopChartEmbedder();
    myChart.appearanceFile = "apfiles/planet/ccpmap_small.pcxml";
    myChart.pcScript = pcScript;
    myChart.height = 360;
    myChart.width = 505;
    myChart.imageType = "FLASH";
    myChart.fallback = "STRICT";
    myChart.returnDescriptiveLink = false;
    myChart.userAgent = request.getHeader("USER-AGENT");
    htmlString = myChart.getEmbeddingHTML();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title><%= caption%></title>
<link href="styles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bgcolor="White">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p class="banner"><a href="../index.html"><img src="../images/planet_logo.gif" alt="Cancer Control PLANET - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
    <td><a href="../index.html"><img src="../images/planet_banner2.gif" alt="Cancer Control PLANET - Links to resources for cancer control planning" width="369" height="82" border="0"></a></td>
    <td><p><a href="../index.html">Home</a><br>
        <a href="../contact.html">Contact Us</a><br>
        <a href="../about.html">About this Site</a><br>
        <a href="../partners.html">PLANET Sponsors</a></p></td>
  </tr>
    <tr>
    <td colspan="3">
      <hr size="1" noshade>
	</td>
  </tr>
</table>
<!-- <table bgcolor="white" border="0" cellpadding="0" cellspacing="0">
<tr>
<td valign='top'>
<table bgcolor='white' border='0' cellpadding="5" cellspacing="0">
<tr>
<td valign="top" colspan="3" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;">View Program Partners in another state / territory:</td>
</tr>
<tr>
<td valign='top' nowrap>
< stateList.toString()%>
</td>
</tr>
</table>
</td>
<td width="2" valign='top'>&nbsp;</td>
<td valign='top'><table><tr><td>< outString.toString()%></td></tr></table></td>


<td valign="top" colspan="3" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;" align="right"><a href="rlist.jsp?r=< region%>&cctopic=0">View Research Partners in < stateStatic%></a>
< htmlString%><br>
<a href="javascript:window.close()">Close Window</a>

</td>

</tr>
</table>
</table> -->

<table bgcolor="white" border="0" cellpadding="0" cellspacing="0">
<tr>
<td valign="top" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 18px;	font-weight: bold; color : #000000;" align="left" colspan="3">Program Partners in <%= stateStatic%> for <%= topicDesc%></td>
<td valign="top" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;" align="right" colspan="2"><a href="rlist.jsp?r=<%= region%>&cctopic=0">View Research Partners in <%= stateStatic%></a></td>
</tr>
<tr>
<td colspan="5">&nbsp;</td>
</tr>
<tr>
<td valign="top" width="25%"><%= stateList.toString()%></td>
<td valign="top" width="5%">&nbsp;</td>
<td valign="top" width="25%"><font style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #FF0000;"><div align="center"><%= stateStatic%></div></font><br><br><%= outString.toString()%></td>
<td valign="top" width="5%">&nbsp;</td>
<td valign="top" width="40%"><%= htmlString%></td>
</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><hr size="1" noshade>
	<div align="center"><a href="../index.html">Home</a>&nbsp;&nbsp;&nbsp; <a href="../contact.html">Contact Us</a>&nbsp;&nbsp;&nbsp;
    <a href="../about.html">About this Site</a>&nbsp;&nbsp;&nbsp;
        <a href="../partners.html">PLANET Sponsors</a>&nbsp;&nbsp;&nbsp; <a href="../privacy.html">Privacy
        Policy</a>&nbsp;&nbsp;&nbsp; <a href="../disclaimer.html">Disclaimer</a>&nbsp;&nbsp;&nbsp; <a href="../accessibility.html">Accessibility</a><br>
      </div></td>
  </tr>
</table>
</body>
</html>
