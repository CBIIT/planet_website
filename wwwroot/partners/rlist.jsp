<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="gov.nci.planet.QueryBean" %>
<%
String region = "ALL";
String pcScript = "";

int ccTopic = 0;
Integer topic = new Integer(0);
int topicID = -1;
int topicCount = 0;
int cellCount = 0;

String htmlString = null;
String caption = null;
String cdcSubTitle = "State Health Department Contact";
String param = request.getParameter("r");
String stateStatic = "";
String stateName = "";
String topicDesc = "";
String listTitle = "";
Integer topicInt = new Integer(-1);
String researcherText="";
String staticTopic = "";

if (param != null) 
    region = param.toUpperCase();
	
param = request.getParameter("cctopic");
 

if (param != null) 
	ccTopic = Integer.parseInt(param);
	
    topic = new Integer(ccTopic);
    StringBuffer outString = null;
	StringBuffer topicString = null;
    StringBuffer stateList = null;
    ResultSet rs = null;
    QueryBean QBean = new QueryBean();
	
    // Find the page title to use based on the topic 
    String pageTitle = "Cancer Control Researchers";

    if (region.equals("ALL"))
    {
        pcScript = "US.addPCXML(<DefaultShapeSettings><Properties FillColor='#B20000'/><Drilldown URL='rlist.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)";
        rs = QBean.getResearchers(topic);
		stateStatic="the US";
    }
    else
    {
        pcScript = "US.setShapeValues("+region.trim()+",1)US.addPCXML(<DefaultShapeSettings><Drilldown URL='rlist.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)@_END";
        rs = QBean.getResearchers(topic, region);
    }

    String beginTD = "<tr><td style='font-family: Arial,Helvetica;font-size: 12;' align=\"left\">";
    String endTD = "</td></tr>";
	


		outString = new StringBuffer("<table cellspacing='0' cellpadding='5'>");
		topicString = new StringBuffer("<tr><td valign='top' style='font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold; color : #000000;' colspan='2'><a name='top'></a>View by Topic:</td></tr><tr>");
	
    if (rs.next())
    {
        String researcherString = "";
        int researcherId = 0;
        int count = 1;
		
        String typeString = "";
        String typeOutput = "";
		int researcherCount = 0;
			
		if (ccTopic == 0)
			staticTopic = "all topics";
		else
			staticTopic = QBean.getTopicDescription(topic);
			
        do
        {
		
           if (topicID != rs.getInt("topic_id"))
 		       {
			   		topicCount++;
			   		topicID = rs.getInt("topic_id");
					topicInt = new Integer(topicID);
					topicDesc = QBean.getTopicDescription(topicInt);
					QBean.closeStatement();
					
					if (region.compareTo("ALL") == 0) {
						stateName = "US";
						listTitle = "<font style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 14;font-weight: bold;color: #000000;'>Research Partners - </font><font style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 14;font-weight: bold;color: #AA0000;'>US</font>";
					}
					else {
						stateName = rs.getString("state_name");
						listTitle = "<font style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 14;font-weight: bold;color: #000000;'>Research Partners - </font><font style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 14;font-weight: bold;color: #AA0000;'>"+stateName+"</font>";
					}
					
					topicString.append("<td valign='top' style='font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 12;'><a href='#"+topicID+"' style='font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 12;'>"+topicDesc+"</a></td>");						
					
					
					if ((topicCount % 2) == 0)
						topicString.append("</tr><tr>");
						
	                if (count > 1)
	  	               	outString.append("</table></td>");
					
					if (((cellCount % 2) != 0) && (count != 1))
						outString.append("</tr>");
					else {
						outString.append("<td>&nbsp;</td></tr>");
						cellCount++;
						}
												
        	        researcherId = rs.getInt("researcher_id");
            	    researcherString = rs.getString("state_abbreviation");
                	
					
					if (count > 1)
						outString.append("<tr><td colspan='2' style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;color: #000000;' align='left' valign='top'><br /><a href='#top' style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;'>[Top of Page]</a></td></tr>");
					
                	outString.append("<tr><td valign='top' style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 14;font-weight: bold;color: #AA0000;' colspan='2'>");
					
					if (count > 1)
						outString.append("<br />");
					
					outString.append("<a name='"+topicID+"'></a>"+topicDesc+"</td></tr>");
	                outString.append("<tr><td><table border='0' cellspacing='0' cellpadding='0'>");
					outString.append("<tr><td style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left' valign='top'>"+rs.getString("researcher_name")+"  ");
					
					if (rs.getString("degree") != null && rs.getString("degree").compareTo("") != 0)
						outString.append(rs.getString("degree"));
					
					outString.append(endTD);
           		}

            if (researcherId != rs.getInt("researcher_id"))
            {
				topicID = rs.getInt("topic_id");
				topicDesc = QBean.getTopicDescription(topic);
				QBean.closeStatement();
        
		        if (count > 1)
                   outString.append("</table></td>");
				 
				if ((cellCount % 2) != 0)
					outString.append("</tr><tr>");
				
                researcherId = rs.getInt("researcher_id");
                researcherString = rs.getString("state_abbreviation");
                outString.append("<td valign='top'><table border='0' cellspacing='0' cellpadding='0'>");
                outString.append("<tr><td style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left' valign='top'>"+rs.getString("researcher_name")+"  ");
					
					if (rs.getString("degree") != null && rs.getString("degree").compareTo("") != 0)
						outString.append(rs.getString("degree"));
					
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
				
                if (researcherString.equals("CDC") && (topic.equals("1") || topic.equals("4") || topic.equals("5")))
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
				
               if (researcherString.equals("CDC") && (topic.equals("1") || topic.equals("4") || topic.equals("5")))
                {
                   outString.append(beginTD+"<a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
                }
                else
                    outString.append(beginTD+"Web site:  <a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
            }
			
         cellCount++;
	     count ++;       
     } while (rs.next());
	 
	 if ((topicCount % 2) == 1)
	 	topicString.append("<td>&nbsp;</td>");
	
	 outString.append("</table>");
	 
	 if ((cellCount % 2) == 0)
		outString.append("<td>&nbsp;</td>");
		
		outString.append("</tr><tr><td colspan='2' style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;color: #000000;' align='left' valign='top'><a href='#top' style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;'>[Top of Page]</a></td></tr></table></td></tr></table>");
		
}
else {
  listTitle = "No Records Found.";
  topicString = new StringBuffer("<tr><td><font style='family : Verdana, Geneva, Arial, Helvetica, sans-serif;	size : 14px;	weight: bold; color : #000000;'>&nbsp;</font></td></tr>");
  outString = new StringBuffer("<tr><td>&nbsp;</td></tr></table>");
}  //end of if statement

    rs = QBean.getStateList();
    if (rs.next())
    {
        stateList = new StringBuffer();
		stateList.append("<table><tr><td valign='top' nowrap>");
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

            if (count > 0)
                stateList.append("<br />");
			
			if (region.compareTo(rs.getString("abbreviation")) == 0)
				stateList.append("<font style='font-family : Arial, Verdana, Geneva, Helvetica, sans-serif;	font-size : 12px; color : AA0000;'>"+rs.getString("name").trim()+"</font>");
			else
	            stateList.append("<a href='rlist.jsp?r="+rs.getString("abbreviation")+"&cctopic="+topic+"' class='a1' title='"+rs.getString("name").trim()+"'>"+rs.getString("name")+"</a>");
			
            count++;
        } while (rs.next());
        stateList.append("</td></tr><tr><td colspan=2><a href='rlist.jsp?r=ALL&cctopic=" + topic + "' title=\"All states and regions\">View All U.S. Researchers by topic area</a></td></tr></table>");
    }
	pageTitle = pageTitle + " - " + stateStatic;
	
		if (stateStatic.compareTo("the US") == 0) {
			stateStatic = "All States";
			researcherText="Research Partners for <font style='font-family : Arial, Verdana, Geneva, Helvetica, sans-serif; font-weight : bold; 	font-size : 18px; color : AA0000;'>"+staticTopic+"</font>";	
		}
		else
			researcherText="Research Partners in <font style='font-family : Arial, Verdana, Geneva, Helvetica, sans-serif; font-weight : bold; 	font-size : 18px; color : AA0000;'>"+stateStatic+"</font>";
					
    QBean.close();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title><%= pageTitle%></title>
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

<table bgcolor="white" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td valign="top" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif; font-size : 20px;	font-weight: bold; color : #000000;" colspan="2" nowrap><%= researcherText%></td>
	<td valign="top" align="right"><strong><a href="list.jsp?r=<%= region%>&cctopic=C">View Program Partners in <%= stateStatic%></a></strong></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td valign="top" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: color : #000000;" nowrap><%= stateList.toString()%></td>

	<td valign="top" colspan="2"><table><%= topicString.toString()%></table><br><br><%= outString.toString()%></td>

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
