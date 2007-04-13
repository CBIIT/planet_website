<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>

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
String topicLet = "C";

if (param != null) 
    region = param.toUpperCase();
	
param = request.getParameter("cctopic");
 

if (param != null) 
	ccTopic = Integer.parseInt(param);
	
    topic = new Integer(ccTopic);
    StringBuffer outString = null;
	StringBuffer topicString = null;
    StringBuffer stateList = null;
    Vector researchers = null;
    QueryBean QBean = new QueryBean();
	
	topicLet = QBean.getTopicID(topic);
	
    // Find the page title to use based on the topic 
    String pageTitle = "Cancer Control Researchers";

    if (region.equals("ALL"))
    {
        pcScript = "US.addPCXML(<DefaultShapeSettings><Properties FillColor='#B20000'/><Drilldown URL='rlist.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)";
        researchers = QBean.getResearchers(topic);
		stateStatic="the US";
    }
    else
    {
        pcScript = "US.setShapeValues("+region.trim()+",1)US.addPCXML(<DefaultShapeSettings><Drilldown URL='rlist.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)@_END";
        researchers = QBean.getResearchers(topic, region);
    }

    String beginTD = "<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 12;' align=\"left\">";
    String endTD = "</td></tr>";
	

		//outString = new StringBuffer("<table border='0' cellspacing='0' cellpadding='5'>");
        outString = new StringBuffer("<table border='0' cellspacing='0' cellpadding='5'><tr><td style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size : 12;'>Research Partners are listed in alphabetical order by state<br><br></td></tr>");
		topicString = new StringBuffer("<tr><td valign='top' style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 14px; font-weight: bold; color : #000000;' colspan='2'><a name='top'></a>View by Topic:</td></tr><tr><td valign='top' style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size : 12;'>");
	
    if (researchers!=null)
    {
    	Iterator it = researchers.iterator();
	
        String researcherString = "";
        int researcherId = 0;
        int count = 1;
		
        String typeString = "";
        String typeOutput = "";
		int researcherCount = 0;
			
		if (ccTopic == 0)
			staticTopic = "all states, all topics";
		else
			staticTopic = QBean.getTopicDescription(topic);
			
        do
        {
		   ResearcherBean rs = (ResearcherBean) it.next();
           if (topicID != rs.getTopicId())
 		       {
			   		topicCount++;
			   		topicID = rs.getTopicId();
					topicInt = new Integer(topicID);
					topicDesc = QBean.getTopicDescription(topicInt);

					if (region.compareTo("ALL") == 0) {
						stateName = "US";
						listTitle = "<font style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 14;font-weight: bold;color: #000000;'>Research Partners - </font><font style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 14;font-weight: bold;color: #AA0000;'>US</font>";
					}
					else {
						stateName = rs.getStateName();
						listTitle = "<font style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 14;font-weight: bold;color: #000000;'>Research Partners - </font><font style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 14;font-weight: bold;color: #AA0000;'>"+stateName+"</font>";
					}
					
					topicString.append("<li><a href='#"+topicID+"' style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size : 12;'>"+topicDesc+"</a></li>");						
					
					//if ((topicCount % 2) == 0)
						//topicString.append("</tr><tr>");
						
	                if (count > 1)
	  	               	outString.append("</table></td>");
					
					if (((cellCount % 2) != 0) && (count != 1))
						outString.append("</tr>");
					else {
						outString.append("<td>&nbsp;</td></tr>");
						cellCount++;
						}
												
        	        researcherId = rs.getResearcherId();
            	    researcherString = rs.getStateAbbreviation();
					
					if (count > 1)
						outString.append("<tr><td colspan='2' style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 12;color: #000000;' align='left' valign='top'><br /><a href='#top' style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 12;'>[Top of Page]</a></td></tr>");
					
                	outString.append("<tr><td valign='top' style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 14;font-weight: bold;color: #AA0000;' colspan='2'>");
					
					if (count > 1)
						outString.append("<br />");
					
					outString.append("<a name='"+topicID+"'></a>"+topicDesc+"</td></tr>");
	                outString.append("<tr><td><table border='0' cellspacing='0' cellpadding='0'>");
					outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 12;font-weight: bold;color: #000000;' align='left' valign='top'>"+rs.getResearcherName());
					
					if (rs.getDegree() != null && rs.getDegree().compareTo("") != 0)
						outString.append(", "+rs.getDegree());
					
					outString.append(endTD);
           		}

            if (researcherId != rs.getResearcherId())
            {
				topicID = rs.getTopicId();
				topicDesc = QBean.getTopicDescription(topic);
        
		        if (count > 1)
                   outString.append("</table></td>");
				 
				if ((cellCount % 2) != 0)
					outString.append("</tr><tr>");
				
                researcherId = rs.getResearcherId();
                researcherString = rs.getStateAbbreviation();
                outString.append("<td valign='top'><table border='0' cellspacing='0' cellpadding='0'>");
                outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 12;font-weight: bold;color: #000000;' align='left' valign='top'>"+rs.getResearcherName());
					
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
                outString.append(beginTD+rs.getCity().trim()+", ");
            if (rs.getAddressState() != null && rs.getAddressState().compareTo("") != 0)                
                outString.append( rs.getAddressState() +" ");
            if (rs.getZip() != null && rs.getZip().compareTo("") != 0)                
                outString.append( rs.getZip().trim() +endTD);

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
				
                if (researcherString.equals("CDC") && (topic.equals("1") || topic.equals("4") || topic.equals("5")))
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

               if (researcherString.equals("CDC") && (topic.equals("1") || topic.equals("4") || topic.equals("5")))
                {
                   outString.append(beginTD+"<a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
                }
                else
                    outString.append(beginTD+"Web site:  <a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+endTD);
            }

	         cellCount++;
		     count ++;    

           //01/25/06 
		  //outString.append("count: "+count+" cellcount: "+cellCount);  
	     } while (it.hasNext());

		 topicString.append("</td></tr>");
	 	 outString.append("</table>");

	 	 if ((cellCount % 2) == 0)
		 outString.append("<td>&nbsp;</td>");

		 outString.append("</tr><tr><td colspan='2' style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 12px;color: #000000;' align='left' valign='top'><a href='#top' style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 12px;'>[Top of Page]</a></td></tr></table></td></tr></table>");
	}
	else {
	  listTitle = "No Records Found.";

	  topicString = new StringBuffer("");
	  outString = new StringBuffer("<table><tr><td>&nbsp;</td></tr></table>");
	}  //end of if statement

    Vector states = QBean.getStateList();

    Iterator it2 = states.iterator();

    if (it2.hasNext())
    {
        stateList = new StringBuffer();
		//stateList.append("<table border='1' cellpadding='5' cellspacing='0'><tr><th colspan='2' align='left' valign='top' nowrap>STATES</th><th align='left' valign='top' nowrap>TERRITORIES/TRIBES</th></tr><tr><td valign='top' nowrap>");
        stateList.append("<table border='0' cellpadding='5' cellspacing='0' width='100%'><tr><th colspan='2' align='left' valign='top' nowrap>States</th></tr><tr><td valign='top' nowrap>");

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
				stateList.append("<tr><th colspan='2' align='left' valign='top' nowrap>Territories / Tribes</th></tr><tr><td colspan='2' valign='top'  nowrap>");
                //count = 0;
            }
			
			//if (count == 56) {
            //    stateList.append("</td><td valign='top' nowrap>");
				//count = 0;
           // }
			
			
			//commented out 01/19/06
			//if (count > 0 && count != 26 && count !=51 && count !=56)
              //  stateList.append("<br />");
              if (count > 0 && count != 26 && count !=51 ) {
               stateList.append("<br />");
                
             //    if (count > 51){
             //   stateList.append("<br /><br />");
             //   }
            }
        

			if (region.compareTo(rs.getAbbreviation()) == 0)
				stateList.append("<font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	color : AA0000; font-size: 12px;'><strong>"+rs.getName().trim()+"</strong></font>");
			else
	            stateList.append("<a href='rlist.jsp?r="+rs.getAbbreviation()+"&cctopic="+topic+"' class='a1' title='"+rs.getName().trim()+"'>"+rs.getName()+"</a>");

            count++;
        } while (it2.hasNext());
        stateList.append("</td></tr><tr><td colspan=3><a href='rlist.jsp?r=ALL&cctopic=" + topic + "' title=\"All states and regions\">View All U.S. Researchers by topic area</a></td></tr></table>");
    }
	pageTitle = pageTitle + " - " + stateStatic;
	
		/* if (stateStatic.compareTo("the US") == 0) {
			//stateStatic = "All States, all topics";
			//researcherText="Research Partners - <font style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 20px; font-weight: bold; color: #AA0000;'>"+staticTopic+"</font>";
		}
		else
			researcherText="Research Partners for <font style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-weight: bold; 	font-size: 20px; color: AA0000;'>"+staticTopic+"</font> in <font style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-weight: bold; font-size: 20px; color: AA0000;'>"+stateStatic+"</font>"; */

     if (stateStatic.compareTo("the US") == 0) {
			stateStatic = "All States, all topics ";
			researcherText="Research Partners - <font style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 20px; font-weight: bold; color: #AA0000;'>"+staticTopic+"</font>";
		}
		else
			researcherText="Research Partners - <font style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-weight: bold; font-size: 20px; color: AA0000;'>"+stateStatic+"<font style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-weight: bold; 	font-size: 20px; color: AA0000;'>, all topics </font></font>";

	if (topicString.length() == 0) {
  		topicString = new StringBuffer("<tr><td><font style='family: Arial, Helvetica, Verdana, Geneva, sans-serif;	size: 14px; weight: bold; color: #000000;'>Research partners not currently available in "+stateStatic+".</font></td></tr>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title><%= pageTitle%></title>
<link href="../styles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bgcolor="White">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p class="banner"><a href="../index.html"><img src="../images/planet_logo.gif" alt="Cancer Control P.L.A.N.E.T. - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
    <td><a href="../index.html"><img src="../images/planet_banner_wider.gif" alt="Cancer Control P.L.A.N.E.T. - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
    <td><p><a href="../index.html">Home</a><br>
        <a href="../contact.html">Contact Us</a><br>
		<a href="http://ccplanetraining.cancer.gov" onclick="javascript:popWindow('http://ccplanetraining.cancer.gov', 'name','725','400','yes'); return false;">On-line Training</a><br />
		<a href="..about.html">About This Site</a><br>
        <a href="../factsheet.pdf">Fact Sheet (PDF)</a><br>
        <a href="../partners.html">Sponsors</a></p></td>
  </tr>
  <tr>
    <td colspan="3"><hr size="1" noshade></td>
  </tr>
</table>

<table bgcolor="white" border="0" cellpadding="0" cellspacing="0" width="100%">
   <tr>
	<td valign="top" colspan="2"><div  style="font-family: Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 20px; font-weight: bold; color: #000000;"><%= researcherText%></div><br>
	<p>To locate program partners in <%= stateStatic%> go to the <a href="list.jsp?r=<%= region%>&cctopic=<%= topicLet%>">Program Partners</a> page.</td>
	<td valign="top" align="right">&nbsp;</td>
  </tr>
</table>

<table bgcolor="white" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
	<td colspan="3">&nbsp;</td>
  </tr>
  <tr>
	<td width="28%" valign="top" style="font-family : Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 14px; font-weight: color : #000000;" nowrap>
		<%= stateList.toString()%></td>
   <td valign="top" width="2%">&nbsp;</td>
	<td valign="top" align="left" width="70%">
		<table cellspacing="5"><%= topicString.toString()%></table><%= outString.toString()%></td>
  </tr>
</table>

<table width="100%" border="0" cellpadding="5" cellspacing="0">
  <tr>
	<td colspan="3">The list of research partners was compiled based on those individuals who had received a grant during the fiscal year period from 1998-2003 and who have permitted their contact information to be listed as a resource for comprehensive cancer control planning and implementation within their state.</td>
  </tr>
</table>

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
    </div></td>
  </tr>
</table>
</body></html>
