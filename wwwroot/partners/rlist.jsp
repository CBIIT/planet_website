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

String htmlString = null;
String caption = null;
String cdcSubTitle = "State Health Department Contact";
String param = request.getParameter("r");
String stateStatic = "";
String stateName = "";
String topicDesc = "";
Integer topicInt = new Integer(-1);

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
	


		outString = new StringBuffer("<table bgcolor='white' border='0' cellpadding='5' cellspacing='0'><tr><td valign='top' style='font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: color : #000000;' width='50%' valign='top'>");
		topicString = new StringBuffer("<a name='top'></a>");
	
    if (rs.next())
    {
        String researcherString = "";
        int researcherId = 0;
        int count = 1;
		
        String typeString = "";
        String typeOutput = "";
		int researcherCount = 0;
			
        do
        {
		
           if (topicID != rs.getInt("topic_id"))
 		       {
			   		topicCount++;
			   		topicID = rs.getInt("topic_id");
					topicInt = new Integer(topicID);
					topicDesc = QBean.getTopicDescription(topicInt);
					topicString.append("<td valign='top'><a href='#"+topicID+"'>"+topicDesc+"</a></td>");						
					
					if ((topicCount % 2) == 0)
						topicString.append("</tr><tr>");
						
	                if (count > 1)
    	               	outString.append("</table></p>");
				
        	        researcherId = rs.getInt("researcher_id");
            	    researcherString = rs.getString("state_abbreviation");
                	stateName = rs.getString("state_name");
					
					if (count > 1)
						outString.append("<p></font><a href='#top'>[Top of Page]</a></p>");
					
                	outString.append("<p><font style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 14;font-weight: bold;color: #000000;'><font style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 14;font-weight: bold;color: #AA0000;'><a name='"+topicID+"'></a>"+topicDesc+"</font></p>");
	                outString.append("<p><table border='0' cellspacing='0' cellpadding='0'>");
					outString.append("<tr><td style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left' valign='top'>"+rs.getString("researcher_name")+"  "+rs.getString("degree")+endTD);
           		}
		   

            if (researcherId != rs.getInt("researcher_id"))
            {
				topicID = rs.getInt("topic_id");
				topicDesc = QBean.getTopicDescription(topic);
        
		        if (count > 1)
                   outString.append("</table></p>");
				   
                researcherId = rs.getInt("researcher_id");
                researcherString = rs.getString("state_abbreviation");
                outString.append("<p><table border='0' cellspacing='0' cellpadding='0'>");
                outString.append("<tr><td style='font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left' valign='top'>"+rs.getString("researcher_name")+"  "+rs.getString("degree")+endTD);
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

	     count ++;       
     } while (rs.next());
	 
	 if ((topicCount % 2) == 1)
	 	topicString.append("<td>nbsp;</td>");
		
	 outString.append("</table><p></font><a href='#top'>[Top of Page]</a></p></td></tr></table>");
}
else {
  topicString = new StringBuffer("No Records Found.");
  outString = new StringBuffer("&nbsp;</td><td valign='top' style='font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-size : 14px;	font-weight: bold;'>&nbsp;");
}  //end of if statement

    rs = QBean.getStateList();
    if (rs.next())
    {
        stateList = new StringBuffer();
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
				stateList.append("<font style='font-family : Arial, Verdana, Geneva, Helvetica, sans-serif;	font-size : 12px; color : FF0000;'>"+rs.getString("name").trim()+"</font>");
			else
	            stateList.append("<a href='rlist.jsp?r="+rs.getString("abbreviation")+"&cctopic="+topic+"' class='a1' title='"+rs.getString("name").trim()+"'>"+rs.getString("name")+"</a>");
				
            count++;
        } while (rs.next());
        stateList.append("</td></tr><tr><td colspan=2><a href='rlist.jsp?r=ALL&cctopic=" + topic + "' title=\"All states and regions\">View All U.S. Researchers by topic area</a>");
    }
	pageTitle = pageTitle + " - " + stateStatic;		
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
	<td valign="top" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-serif;	font-				    
			size : 14px;	font-weight: bold; color : #000000;" width="30%" rowspan="2">View another state / territory<br />		
				<table bgcolor='white' border='0' cellpadding="5" cellspacing="0">
					<tr>
						<td valign="top" style="font-family : Verdana, Geneva, Arial, Helvetica, sans-
						serif;	font-size : 14px;	font-weight: color : #000000;" nowrap><%= 
						stateList.toString()%>
						</td>
					</tr>
				</table>
	</td>
	<td width="5%" rowspan="2">&nbsp;</td>
	<td valign="top" width="60%" align="right" colspan="2"><a href="list.jsp?r=<%= region%>&cctopic=C">View Program Partners in <%= stateStatic%></a></td>
</tr>
<tr>
	<td valign="top">
		<table bgcolor='white' border='0' cellpadding="5" cellspacing="0">
		<tr>
			<%= topicString.toString()%>
		</tr>
		</table>
	</td>
	<td valign="top"><br><br><%= outString.toString()%></td>
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
