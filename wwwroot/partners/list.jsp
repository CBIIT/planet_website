<%@ page language="java" contentType="text/html" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.corda.CordaEmbedder" %>
<%@ page import="oracle.jdbc.driver.*" %>
<%
String param;
String region = "all";
String pcScript = "";
String topic = "C";
String htmlString = null;
String caption = null;
String pageTitle = "Cancer Control Partners";
String cdcSubTitle = "State Health Department Contact";
param = request.getParameter("r");
if (param != null)
	region = param;
param = request.getParameter("cctopic");
if (param != null)
   topic = param;
   
if (topic.equalsIgnoreCase("C"))
{
   pageTitle = "Cancer Control Partners";
   caption = "Cancer Control PLANET - Cancer Control Partners";
}
else
{
   pageTitle = "Potential Partners";
   if (topic.equalsIgnoreCase("T"))
   	caption = "Cancer Control PLANET - Tobacco Control Partners";
   else if (topic.equalsIgnoreCase("P"))
   	caption = "Cancer Control PLANET - Physical Activity Partners";
}

String whereString = "";

String URL = "jdbc:oracle:thin:@mooch.nci.nih.gov:1521:mooch920";
String username = "pma_web_user";
String password = "pjc242323";


StringBuffer outString = null;
StringBuffer stateList = null;

if (region.compareTo("all") != 0)
{
    
  
    pcScript = "US.setShapeValues("+region.trim()+",1)US.addPCXML(<DefaultShapeSettings><Drilldown URL='list.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)@_END";
    whereString = " AND region = '" + region + "' and region IS NOT NULL AND cctopic IN (NULL,'"+topic.toUpperCase()+"') AND ps.abbreviation = '"+ region + "'";
}
else
{
//change the next line so the drilldown url points to your application server    
    pcScript = "US.addPCXML(<DefaultShapeSettings><Properties FillColor='#B20000'/><Drilldown URL='list.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)";

	whereString = " AND region IS NOT NULL AND cctopic IN (NULL,'"+topic.toUpperCase()+"')";
}

    DriverManager.registerDriver(new OracleDriver());
    Connection con = DriverManager.getConnection(URL, username, password);
    Statement stmt = con.createStatement();
    String theQuery = "SELECT region, p.abbreviation partner, pc.type, contact, pc.name contact_name, " +
                        "degree, title, org1, org2, orgurl, address1, address2, city, " +
                        "pc.state, zip, phone, fax, cell, email, p.name partner_name, ps.name state_name " +
                      "FROM dccps.cc_partners p, dccps.cc_partner_contacts pc, dccps.cc_partner_states ps  " +
                      "WHERE p.id = pc.partner_id " +
                        "AND pc.region = ps.abbreviation " +
                        "AND pc.type <> 'N' " +
                        "AND (cctopic IS NULL OR cctopic = '" + topic.toUpperCase() + "') " +
                        whereString +
                      " ORDER BY ps.name, p.abbreviation, pc.type, contact";

    ResultSet rs = stmt.executeQuery(theQuery);
    String beginTD = "<tr><td style='font-family: Arial,Helvetica;font-size: 12;' align=\"left\">";
    String endTD = "</td></tr>";

    if (rs.next())
    {
        outString = new StringBuffer();
        String partnerString = "";
        String stateName = "";
        int count = 1;
        String typeString = "";

        do
        {
            if (stateName.compareTo(rs.getString("state_name").trim()) != 0)
            {
                if (count > 1)
                    outString.append("</table></p>");
                partnerString = rs.getString("partner");
                typeString = rs.getString("type");
                stateName = rs.getString("state_name");
                outString.append("<p><font style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 14;font-weight: bold;color: #000000;'>"+pageTitle+" - </font><font style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 14;font-weight: bold;color: #AA0000;'>"+stateName.trim()+"</font></p>");
                outString.append("<p><table border='0' cellspacing='0' cellpadding='0' width='100%'>");
                outString.append("<tr><td style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left'>"+rs.getString("partner_name")+endTD);

                outString.append("<tr><td style='font-family: Arial, Helvetica, sans-serif;font-size: 12;font-style: normal;' align='left'>");
                if (rs.getString("type").equals("R"))
                    outString.append("<u>Regional Contact<u/>"+endTD);
                else
                    if (rs.getString("type").equals("B"))
                        outString.append("<u>Tribal Contact<u/>"+endTD);
                    else
                    {
                        if (partnerString.equals("CDC"))
                        {
                            if (rs.getString("type").equals("T"))
                                outString.append("<u>Territorial");
                            else
                                outString.append("<u>State");
                            if (topic.equals("T"))
                                outString.append(" Health Department Web Site</u>"+endTD);
                            else
                                if (topic.equals("P"))
                                    outString.append(" Health Department Contact</u>"+endTD);
                                else
                                    outString.append(" Contact</u>"+endTD);
                        }
                        else
                            outString.append("<u>State Contact</u>"+endTD);
                    }
                    typeString = rs.getString("type");
            }
            if (partnerString.compareTo(rs.getString("partner").trim()) != 0)
            {
                if (count > 1)
                   outString.append("</table></p>");
                partnerString = rs.getString("partner");
                typeString = rs.getString("type");
                outString.append("<p><table border='0' cellspacing='0' cellpadding='0' width='100%'>");
                outString.append("<tr><td style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left'>"+rs.getString("partner_name")+endTD);
		
                outString.append("<tr><td style='font-family: Arial, Helvetica, sans-serif;font-size: 12;style: bold;' align='left'>");
                if (rs.getString("type").equals("R"))
                    outString.append("<u>Regional Contact<u/>"+endTD);
                else
                    if(rs.getString("type").equals("B"))
                        outString.append("<u>Tribal Contact<u/>"+endTD);
                    else
                    {
                        if (partnerString.equals("CDC"))
                        {
                            if (rs.getString("type").equals("T"))
                               outString.append("<u>Territorial");
                            else
                               outString.append("<u>State");
                            if (topic.equals("T"))
                               outString.append(" Health Department Web Site</u>"+endTD);
                            else if (topic.equals("P"))
                               outString.append(" Health Department Contact</u>"+endTD);
                            else
                               outString.append(" Contact</u>"+endTD);
                        }
                        else
                            outString.append("<u>State Contact</u>"+endTD);
                    }
                    typeString = rs.getString("type");
            }
            if (typeString.compareTo(rs.getString("type").trim()) != 0)
            {
                outString.append("<tr><td height='20'>&nbsp;</td></tr>");
                outString.append("<tr><td style='font-family: Arial,Helvetica;font-size: 12;font-style: normal;' align='left'>");
                if (rs.getString("type").equals("R"))
                    outString.append("<u>Regional Contact</u>"+endTD);
                else
                {
                    if (partnerString.equals("CDC") && topic.compareTo("C") != 0)
                    {
                       outString.append("<u>State Health Department Contact</u>"+endTD);
                    }
                    else
                       outString.append("<u>State Contact</u>"+endTD);
                }
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
                outString.append(beginTD+rs.getString("city").trim()+", "+rs.getString("state")+" "+rs.getString("zip").trim()+endTD);
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
                if (partnerString.equals("CDC") && topic.equals("T"))
                {
                   outString.append(beginTD+"<a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
                }
                else
                    outString.append(beginTD+"Web site:  <a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
            }
            outString.append("<tr><td height='10'>&nbsp;</td></tr>");
		
            count ++;
        } while (rs.next());	
    } //end of if statement
     
    theQuery = "SELECT type, abbreviation, name " +
               "FROM dccps.cc_partner_states " +
               "ORDER BY type, name";
    rs = stmt.executeQuery(theQuery);
    if (rs.next())
    {
        stateList = new StringBuffer();
        String typeString = "S";
        int count= 0;
        do
        {
            if (count > 27)
            {
                stateList.append("</td><td valign='top'>");
                count = 0;
            }
            if (typeString.compareTo(rs.getString("type")) != 0)
            {
                stateList.append("<br />");
                typeString = rs.getString("type");
            }
            if (count > 0)
                stateList.append("<br />");
            stateList.append("<a href='list.jsp?r="+rs.getString("abbreviation")+"&cctopic="+topic.toUpperCase()+"' class='a1' title='"+rs.getString("name").trim()+"'>"+rs.getString("abbreviation")+"</a>");
            count++;
        } while (rs.next());
        stateList.append("<br /><br /><a href='list.jsp?r=all&cctopic="+topic.toUpperCase()+"' title=\"All states and regions\">All</a>");
    }
     
    CordaEmbedder myChart = new CordaEmbedder();
    myChart.appearanceFile = "apfiles/ccp/ccpmap_small.pcxml";

    myChart.externalServerAddress = "http://procyon.cit.nih.gov:2001";
    myChart.internalCommPortAddress = "http://procyon.cit.nih.gov:2002";

    myChart.pcScript = pcScript;
    myChart.height = 360;
    myChart.width = 505;
    myChart.imageType = "FLASH";
    myChart.fallback = "STRICT";
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
    <td><p class="banner"><a href="../index.html"><img src="images/planet_logo.gif" alt="Cancer Control PLANET - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
    <td><a href="../index.html"><img src="images/planet_banner2.gif" alt="Cancer Control PLANET - Links to resources for cancer control planning" width="369" height="82" border="0"></a></td>
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
<table bgcolor="white" border="0" cellpadding="0" cellspacing="0">
<tr>
<td valign='top'><table><tr><td><%= outString.toString()%></table></td></tr></table></td>
<td width="2" valign='top'>&nbsp;</td>
<td valign='top'>
<table bgcolor='white' border='0' cellpadding="5" cellspacing="0">
<tr>
<td valign="top" colspan="3" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;">View another state / territory</td>
</tr>
<tr>
<td valign='top'>
<%= stateList.toString()%>
</td>
<td valign='top'>
<%= htmlString%>
</td>
</tr>
</table>
</td>
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
