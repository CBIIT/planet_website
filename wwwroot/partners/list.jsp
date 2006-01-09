<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>

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
String partnerText = "";
String typeDesc = "";
int topicNum = 0;

if (param != null)
    region = param.toUpperCase();
	
param = request.getParameter("cctopic");

if (param != null)
    topic = param.toUpperCase();

StringBuffer outString = null;
StringBuffer stateList = null;
Vector partners = null;
QueryBean QBean = new QueryBean();
topicNum = QBean.getTopicID(topic);

	
    // Find the page title to use based on the topic
	if (topic.compareTo("C") != 0)
		topicDesc = QBean.getTopicDescription(topic);

    String pageTitle = topicDesc + " Partners";
    caption = "Cancer Control PLANET - " + pageTitle;

    if (region.equals("ALL"))
    {
        pcScript = "US.addPCXML(<DefaultShapeSettings><Properties FillColor='#B20000'/><Drilldown URL='list.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)";
        partners = QBean.getPartners(topic.toUpperCase());
		stateStatic="the US";
    }
    else
    {
        pcScript = "US.setShapeValues("+region.trim()+",1)US.addPCXML(<DefaultShapeSettings><Drilldown URL='list.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)@_END";
        partners = QBean.getPartners(topic.toUpperCase(), region);
    }

    String beginTD = "<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;' align=\"left\">";
    String endTD = "</td></tr>";
    
    
    if (partners!=null)
    {
    	Iterator it = partners.iterator();
	    outString = new StringBuffer();
        String partnerString = "";
        int partnerId = 0;
        int count = 1;
        String typeString = "";
        String typeOutput = "";
		int addedContact = 0;
				
        do
        {
	        PartnerBean rs = (PartnerBean)it.next();
			typeDesc = rs.getTypeDescription();
            if (stateName.compareTo(rs.getStateName().trim()) != 0)
            {
                if (count > 1)
                    outString.append("</table></p>");

                partnerId = rs.getPartnerId();
                partnerString = rs.getPartnerAbbreviation();
                typeString = rs.getType();
                stateName = rs.getStateName();
				typeDesc = rs.getTypeDescription();
                outString.append("<table border='0' cellspacing='0' cellpadding='0' width='100%'>");
                outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left'><font style='font-family : Arial, Helvetica, Verdana, Geneva,  sans-serif;	font-size : 12px;	font-weight: bold; color : #AA0000;'>"+stateName+"</font><br><br>"+rs.getPartnerName()+endTD);

                outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;font-style: normal;' align='left'>");
                outString.append("<u>" + typeDesc);
                
                // For state and territory contacts we may need to tack on some additional information.
				// outString.append(partnerString + " - " + typeString + " - " + topic + " - " + typeDesc + " - ");
                if (partnerString.equals("CDC") && !typeString.equals("W"))
                {
                    if (topic.equals("T"))
                        outString.append(" Health Department Web Site");
                    else
                        if (topic.equals("P"))
                            outString.append(" Health Department Contact");
                        else {
								addedContact = 1;
                            	outString.append(" Contact");
						}
                }

				if (typeDesc.equals("Regional") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}
				
				if (typeDesc.equals("State") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}
				
                // Close the underlining and the table cell.
                outString.append("</u>"+endTD);
            }

            if (partnerId != rs.getPartnerId())
            {

                if (count > 1)
                   outString.append("</table></p>");

                partnerId = rs.getPartnerId();
                partnerString = rs.getPartnerAbbreviation();
                typeString = rs.getType();
				typeDesc = rs.getTypeDescription();
                outString.append("<p><table border='0' cellspacing='0' cellpadding='0' width='10%'>");
                
                outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left'>"+rs.getPartnerName()+endTD);
                //outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;fon align='left'>"+rs.getPartnerName()+endTD);

                outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;style: bold;' align='left'>");
                outString.append("<u>" + rs.getTypeDescription());
                
                // For state and territory contacts we may need to tack on some additional information.
				//outString.append(partnerString + " - " + typeString + " - " + topic + " - " + typeDesc + " - ");
                if (partnerString.equals("CDC") && !typeString.equals("W"))
                {
                    if (topic.equals("T"))
                        outString.append(" Health Department Web Site");
                    else
                        if (topic.equals("P"))
                            outString.append(" Health Department Contact");
                        else {
								if (addedContact != 1) {
                            		outString.append(" Contact");
									addedContact = 1;
								}
							}
                }
				if (typeDesc.equals("Regional") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}
				
				if (typeDesc.equals("State") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}
                // Close the underlining and the table cell.
                outString.append("</u>" + endTD);
            }

            if (typeString.compareTo(rs.getType().trim()) != 0)
            {
				typeDesc = rs.getTypeDescription();
                outString.append("<tr><td height='20'>&nbsp;</td></tr>");
                outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;font-style: normal;' align='left'>");
                outString.append("<u>" + rs.getTypeDescription());
				//outString.append(partnerString + " - " + typeString + " - " + topic + " - " + typeDesc + " - ");
				
                if (partnerString.equals("CDC") && !typeString.equals("W"))
                {
                    if (topic.compareTo("C") != 0)
                       outString.append(" Health Department Contact");
                    else {
								if (addedContact != 1) {
                            		outString.append(" Contact");
									addedContact = 1;
								}
							}
                }

				if (typeDesc.equals("Regional") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}
				
				if (typeDesc.equals("State") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}

                // Close the underlining and the table cell.
                outString.append("</u>" + endTD);
                typeString = rs.getType();
				typeDesc = rs.getTypeDescription();
            }

            if (rs.getContactName() != null && rs.getContactName().compareTo("") != 0)
            {
                outString.append(beginTD+rs.getContactName().trim());

                if (rs.getDegree() != null && rs.getDegree().compareTo("") != 0)
                    outString.append(", "+rs.getDegree());

                outString.append(endTD);
            }
            if (rs.getTitle() != null && rs.getTitle().compareTo("") != 0)
                outString.append(beginTD+rs.getTitle().trim()+endTD);

            if (rs.getOrg1() != null && rs.getOrg1().compareTo("") != 0)
                outString.append(beginTD+rs.getOrg1().trim()+endTD);

            if (rs.getOrg2() != null && rs.getOrg2().compareTo("") != 0)
                outString.append(beginTD+rs.getOrg2().trim()+endTD);

            if (rs.getAddress1() != null && rs.getAddress1().compareTo("") != 0)
                outString.append(beginTD+rs.getAddress1().trim()+endTD);

            if (rs.getAddress2() != null && rs.getAddress2().compareTo("") != 0)
                outString.append(beginTD+rs.getAddress2().trim()+endTD);

            if (rs.getCity() != null && rs.getCity().compareTo("") != 0)
                outString.append(beginTD+rs.getCity().trim()+", "+rs.getAddressState()+" "+rs.getZip().trim()+endTD);

            if (rs.getPhone() != null && rs.getPhone().compareTo("") != 0)
                    outString.append(beginTD+"Phone:  "+rs.getPhone().trim()+endTD);

            if (rs.getFax() != null && rs.getFax().compareTo("") != 0)
                    outString.append(beginTD+"Fax:  "+rs.getFax().trim()+endTD);

            if (rs.getCell() != null && rs.getCell().compareTo("") != 0)
                    outString.append(beginTD+"Cell:  "+rs.getCell().trim()+endTD);

            if (rs.getEmail() != null && rs.getEmail().compareTo("") != 0)
            {
                String emailStr = rs.getEmail().trim();
                outString.append(beginTD+"Email:  <a href=\"mailto:"+emailStr+"\" class='a1'>"+emailStr+"</a>"+endTD);
            }

            if (rs.getOrgurl() != null && rs.getOrgurl().compareTo("") != 0)
            {
                String urlStr = "";
                if (rs.getOrgurl().indexOf("http://") < 0)
                    urlStr = "http://"+rs.getOrgurl().trim();
                else
                    urlStr = rs.getOrgurl().trim();

                // Don't display Web site: field header for tobacco, breast cancer, and cervical cancer contacts.
                if (partnerString.equals("CDC") && (topic.equals("T") || topic.equals("B") || topic.equals("V")))
                {
                   outString.append(beginTD+"<a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
                }
                else
                    outString.append(beginTD+"Web site:  <a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
            }

            if (rs.getOrgurl2() != null && rs.getOrgurl2().compareTo("") != 0)
            {
                String urlStr = "";
                if (rs.getOrgurl2().indexOf("http://") < 0)
                    urlStr = "http://"+rs.getOrgurl2().trim();
                else
                    urlStr = rs.getOrgurl2().trim();

                // Don't display Web site: field header for tobacco, breast cancer, and cervical cancer contacts.
                if (partnerString.equals("CDC") && (topic.equals("T") || topic.equals("B") || topic.equals("V")))
                {
                   outString.append(beginTD+"<a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
                }
                else
                    outString.append(beginTD+"Web site:  <a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
            }

            outString.append("<tr><td height='10'>&nbsp;</td></tr>");
			typeDesc = rs.getTypeDescription();
            count ++;
			addedContact = 0;
        } while (it.hasNext());

		outString.append("</table>");
    } //end of if statement
	else {
		outString = new StringBuffer();
		outString.append("No records found.");
	}

    Vector states = QBean.getStateList();
    
    Iterator it2 = states.iterator();
	
    if (it2.hasNext())
    {
        stateList = new StringBuffer();
		//stateList.append("<table border='0' cellpadding='5' cellspacing='0'><tr><th colspan='2' align='left' valign='top' nowrap>STATES</th><th align='left' valign='top' nowrap>TERRITORIES/TRIBES</th></tr><tr><td valign='top' nowrap>");
        stateList.append("<table border='0' cellpadding='5' cellspacing='0'><tr><th colspan='2' align='left' valign='top' width='100%'>STATES</th></tr><tr><td valign='top' nowrap>");
		String typeString = "S";
        int count= 0;
		
        do
        {
			StateBean rs = (StateBean)it2.next();
			
			if (region.compareTo(rs.getAbbreviation()) == 0)
				stateStatic=rs.getName();
				
            if (count == 26) {
                stateList.append("</td><td valign='top' nowrap>");
                //count = 0;
            }
            if (count == 51) {
              	stateList.append("</td></tr>");
				stateList.append("<tr><th colspan='2'>&nbsp;</th></tr>");
				stateList.append("<tr><th colspan='2' align='left' valign='top' bgcolor='#F1F1FD'>TERRITORIES/TRIBES</th></tr><tr><td valign='top' bgcolor='#F1F1FD'>");
                //count = 0;
            }
			
			if (count == 56) {
                stateList.append("</td><td valign='top' bgcolor='#F1F1FD'>");
				//count = 0;
            }
            
			//if (typeString.compareTo(rs.getType()) != 0) {
            //    stateList.append("<br />");
            //    typeString = rs.getType();
            //}
			
            if (count > 0 && count != 26 && count !=51 && count !=56) {
                stateList.append("<br />");
                
             //if (count > 0 && count != 26 && count !=51 && count !=56)
               if (count > 51){
                stateList.append("<br /><br />");
                }
            }
						
			if (region.compareTo(rs.getAbbreviation()) == 0)
				stateList.append("<font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size : 12px; color : AA0000;'><strong>"+rs.getName().trim()+"</strong></font>");
			else
	            stateList.append("<a href='list.jsp?r="+rs.getAbbreviation()+"&cctopic="+topic.toUpperCase()+"' class='a1' title='"+rs.getName().trim()+"'>"+rs.getName()+"</a>");			
            
			count++;
        } while (it2.hasNext());

        stateList.append("</td></tr><tr><td colspan=2><a href='list.jsp?r=ALL&cctopic=" + topic + "' title=\"All states and regions\">View All U.S. Partners</a></td></tr></table>");
    }

		pageTitle = pageTitle + " - " + stateStatic;
		
		if (stateStatic.compareTo("the US") == 0) {
			stateStatic = "All States";

		if (topicDesc.compareTo("") != 0)
			partnerText=topicDesc+" and Other Program Partners - <font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size : 20px;	font-weight: bold; color : #AA0000;'>All States</font>";	
		else
			partnerText="Program Partners - <font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 20px; font-weight: bold; color : #AA0000;'>All States</font>";
		}
		else
				if (topicDesc.compareTo("") != 0)
					partnerText=topicDesc+" and Other Program Partners - <font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 20px; font-weight: bold; color : #AA0000;'>"+stateStatic+"</font>";
				else
					partnerText="Program Partners - <font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 20px; font-weight: bold; color : #AA0000;'>"+stateStatic+"</font>";

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
<link href="../styles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bgcolor="White">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p class="banner"><a href="../index.html"><img src="../images/planet_logo.gif" alt="Cancer Control PLANET - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>    <td><a href="../index.html"><img src="../images/planet_banner_wider.gif" alt="Cancer Control PLANET - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
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
<!-- <table bgcolor="white" border="0" cellpadding="0" cellspacing="0">
<tr>
<td valign='top'>
<table bgcolor='white' border='0' cellpadding="5" cellspacing="0">
<tr>
<td valign="top" colspan="3" style="font-family : Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 14px;	font-weight: bold; color: #000000;">View Program Partners in another state / territory:</td>
</tr>
<tr>
<td valign='top'>
< stateList.toString()%>
</td>
</tr>
</table>
</td>
<td width="2" valign='top'>&nbsp;</td>
<td valign='top'><table><tr><td>< outString.toString()%></td></tr></table></td>

<td valign="top" colspan="3" style="font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 14px;	font-weight: bold; color: #000000;" align="right"><a href="rlist.jsp?r=< region%>&cctopic=0">View Research Partners in < stateStatic%></a>
< htmlString%><br>
<a href="javascript:window.close()">Close Window</a>

</td>

</tr>
</table>
</table> -->

<table bgcolor="white" border="1" cellpadding="0" cellspacing="0">
<tr>
<td valign="top" align="left" colspan="3"><div style="font-family : Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 20px; font-weight: bold; color: #000000;"><%= partnerText%></div><br>
<p>To locate research partners in <%= stateStatic%> go to the  <a href="rlist.jsp?r=<%= region%>&cctopic=<%= topicNum%>">research partners</a> page.</p>

</td>
<td valign="top" style="font-family : Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 14px; font-weight: bold; color: #000000;" align="right" colspan="2">&nbsp;</td>
</tr>
<tr>
<td colspan="5">&nbsp;</td>
</tr>
<tr>
<td valign="top" width="28%" bgcolor="#F1F1FD"><%= stateList.toString()%></td>
<td valign="top" width="1%">&nbsp;</td>
<td valign="top" width="30%"><%= outString.toString()%></td>
<td valign="top" width="1%">&nbsp;</td>
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
</body></html>
