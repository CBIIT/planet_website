<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>

<%String region = "ALL";
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
String headerText = "";
int topicNum = 0;
int ACS_count = 0;
int ACOS_count = 0;
int CDC_count = 0;
int CIS_count = 0;
int totACS_count = 0;
int totACOS_count = 0;
int totCDC_count = 0;
int totCIS_count = 0;
int numVectors = 0;

if (param != null) {
    region = param.toUpperCase();
}

param = request.getParameter("cctopic");

if (param != null) {
    topic = param.toUpperCase();
}

StringBuffer outString = null;
StringBuffer stateList = null;
Vector partners = null;
Vector partnerCount = null;

QueryBean QBean = new QueryBean();
PartnerBean PBean = new PartnerBean();

topicNum = QBean.getTopicID(topic);

// Find the page title to use based on the topic
if (topic.compareTo("C") != 0) {
topicDesc = QBean.getTopicDescription(topic);
} //end if (topic.compareTo("C") != 0)

String pageTitle = topicDesc + " Partners";
caption = "Cancer Control P.L.A.N.E.T. - " + pageTitle;

if (region.equals("ALL")) {
    //pcScript = "US.addPCXML(<DefaultShapeSettings><Properties FillColor='#B20000'/><Drilldown URL='list.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)";
    partners = QBean.getPartners(topic.toUpperCase());
	stateStatic="the US";
	
	partnerCount = QBean.getCountbyPartner();
	
} else {
    //pcScript = "US.setShapeValues("+region.trim()+",1)US.addPCXML(<DefaultShapeSettings><Drilldown URL='list.jsp?r=%_NAME&cctopic="+topic+"' FillColor='White' ZoomPercent='120'/></DefaultShapeSettings>)@_END";
    partners = QBean.getPartners(topic.toUpperCase(), region);
	partnerCount = QBean.getCountbyPartner(region);

} //end if (region.equals("ALL"))
	
if (partnerCount!=null) {

	Iterator itP = partnerCount.iterator();

	do {
	PBean = (PartnerBean)itP.next();

	ACS_count = PBean.getACS_count();
	ACOS_count = PBean.getACOS_count();
	CDC_count = PBean.getCDC_count();
	CIS_count = PBean.getCIS_count();
	if (ACS_count > 0) {totACS_count ++;}
	if (ACOS_count > 0) {totACOS_count ++;}
	if (CDC_count > 0) {totCDC_count ++;}
	if (CIS_count > 0) {totCIS_count ++;}
	numVectors = numVectors + 1;
	} while (itP.hasNext());
} 

String beginTD = "<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;' align=\"left\">";
String endTD = "</td></tr>";

//added 01/23/06
outString = new StringBuffer("<table border='1' cellspacing='0' cellpadding='5'><tr><td valign='top' colspan='2'>");
//end 01/23/06  

if (partners!=null) { //We have partners
   	Iterator it = partners.iterator();
    outString = new StringBuffer();
    String partnerString = "";
    int partnerId = 0;
    int count = 1;
    String typeString = "";
    String typeOutput = "";
	int addedContact = 0; //We added "Contact" already if = 1
	int stateCount = 0; //num of states displayed so far
	int numPartnersDisplayed = 1; //num of displayed partners for the state

	outString.append("<table border='0' cellspacing='2' cellpadding='2' width='100%'>");
    outString.append("<tr><td valign='top' width='50%' style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;' align='left'>");
	outString.append("<table border='0' cellspacing='0' cellpadding='0' width='100%'>");//Column 1 Table
    outString.append("<tr><td valign='top' style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;' align='left'>");

    do { //do once, then loop while (it.hasNext() {
    	PartnerBean rs = (PartnerBean)it.next(); //Advance to next partner record
		typeDesc = rs.getTypeDescription();
		partnerString = rs.getPartnerAbbreviation();
                
		//outString.append("Partnerstring="+partnerString+" topic="+topic+"<BR>");
		//if (!partnerString.equals("CDC") || (partnerString.equals("CDC") && (topic.equals("C") || topic.equals("B") || topic.equals("V") || topic.equals("R") || topic.equals("I")))) {// Only show Partner name if not CDC, or if CDC and C,B,V,R,I(C=All, Breast, cerV., coloRectal, or Idm)

			if (stateName.compareTo(rs.getStateName().trim()) != 0) { //This is a new state
				stateCount ++; //increment the state count

				if (stateCount == 33) //We have displayed half of the states, switch to 2nd column
					outString.append(endTD+"</table></td><td valign='top' width='50%'><table border='0' cellspacing='0' cellpadding='0' width='100%'><tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;' align='left'>");//Column 2 Table

                if (count > 1) {//We have already displayed our first result
                    outString.append("</p>");
				}//end if (count > 1)

                partnerId = rs.getPartnerId();
                typeString = rs.getType();
                stateName = rs.getStateName();
				typeDesc = rs.getTypeDescription();

				//*******************************************
				//*** Display State Name and Partner Name ***
                //*******************************************
				outString.append(endTD+"<tr><td style='font-size: 12;color:#AA0000;'><b><font color=' #AA0000'>"+stateName+"</font></b><br><br>"+endTD);//Show State
				outString.append(beginTD+"<b>"+rs.getPartnerName()+"</b><br>"); //Show Partner
                //*******************************************

                //*******************************************
				//*** Display Contact Type ***
                //*******************************************
				// For state and territory contacts we may need to tack on some additional information.
				// outString.append(partnerString + " - " + typeString + " - " + topic + " - " + typeDesc + " - ");
                //outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;font-style: normal;' align='left'>");
                outString.append("<u>" + typeDesc);
				if (partnerString.equals("CDC") && !typeString.equals("W")) {
                    if (topic.equals("T")) {
                        outString.append(" Health Department Web Site");
					} else if (topic.equals("P")) {
						outString.append(" Health Department Contact(s)");
						addedContact = 1;
					} else { //Is CDC, and not type W, and not topic T,P
						addedContact = 1;
                        outString.append(" Contact(s)");
					} //end if (topic.equals("T"))
                } //end if (partnerString.equals("CDC") && !typeString.equals("W"))

				if (typeDesc.equals("Regional") && (addedContact != 1)) {
					outString.append(" Contact(s)");
					addedContact = 1;
				}//end if (typeDesc.equals("Regional") && (addedContact != 1))

				if (typeDesc.equals("State") && (addedContact != 1)) {
					outString.append(" Contact(s)");
					addedContact = 1;
				}//end if (typeDesc.equals("State") && (addedContact != 1))

                // Close the underlining and the table cell.
                outString.append("</u>"+"<br>");
				//*******************************************
            }//end if (stateName.compareTo(rs.getStateName().trim()) != 0)

            if (partnerId != rs.getPartnerId()) { //If new partner
				numPartnersDisplayed ++;
                if (count > 1) {
                   outString.append("</p>");
				}//end if (count > 1)

				if (!region.equals("ALL") && numPartnersDisplayed == 3) { //We have displayed two partners (state view only), switch to 2nd column
					outString.append(endTD+"</table></td><td valign='top' width='50%'><table border='0' cellspacing='0' cellpadding='0' width='100%'><tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;' align='left'>");//Column 2 Table
				}

                partnerId = rs.getPartnerId();
                partnerString = rs.getPartnerAbbreviation();
                typeString = rs.getType();
				typeDesc = rs.getTypeDescription();
                outString.append("<p style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;color: #000000;' align='left'>");
                //<table border='1' cellspacing='0' cellpadding='0' width='100%'>"
                //outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;color: #000000;' align='left'><b>"+rs.getPartnerName()+"</b><br>");
				outString.append("<b>"+rs.getPartnerName()+"</b><br>");

                //outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;style: bold;' align='left'>");
                outString.append("<u>" + rs.getTypeDescription());

                // For state and territory contacts we may need to tack on some additional information.
				//outString.append(partnerString + " - " + typeString + " - " + topic + " - " + typeDesc + " - ");
                if (partnerString.equals("CDC") && !typeString.equals("W")) {
                    if (topic.equals("T")) {
                        outString.append(" Health Department Web Site");
                    } else if (topic.equals("P")) {
                        outString.append(" Health Department Contact(s)");
						addedContact = 1;
                    } else if (addedContact != 1) {
						outString.append(" Contact(s)");
						addedContact = 1;
					}//end if (topic.equals("T"))
                }//end if (partnerString.equals("CDC") && !typeString.equals("W"))

				if (typeDesc.equals("Regional") && (addedContact != 1)) {
					outString.append(" Contact(s)");
					addedContact = 1;
				}//end if (typeDesc.equals("Regional") && (addedContact != 1))

				if (typeDesc.equals("State") && (addedContact != 1)) {
					outString.append(" Contact(s)");
					addedContact = 1;
				}//if (typeDesc.equals("State") && (addedContact != 1))

                // Close the underlining and the table cell.
                outString.append("</u>" + "<br>");
            }//end if (partnerId != rs.getPartnerId())

            if (typeString.compareTo(rs.getType().trim()) != 0) {
				typeDesc = rs.getTypeDescription();
                outString.append("<br>");
                outString.append("<u>" + rs.getTypeDescription());
				//outString.append(partnerString + " - " + typeString + " - " + topic + " - " + typeDesc + " - ");

                if (partnerString.equals("CDC") && !typeString.equals("W")) {
                    if (topic.compareTo("C") != 0) {
                       outString.append(" Health Department Contact(s)");
					   addedContact = 1;
                    } else {
						if (addedContact != 1) {
							outString.append(" Contact(s)");
							addedContact = 1;
						}//end if (addedContact != 1)
					}//end if (topic.compareTo("C") != 0)
                }//end if (partnerString.equals("CDC") && !typeString.equals("W"))

				if (typeDesc.equals("Regional") && (addedContact != 1)) {
					outString.append(" Contact(s)");
					addedContact = 1;
				}//end if (typeDesc.equals("Regional") && (addedContact != 1))

				if (typeDesc.equals("State") && (addedContact != 1)) {
					outString.append(" Contact(s)");
					addedContact = 1;
				}//end if (typeDesc.equals("State") && (addedContact != 1))

                // Close the underlining and the table cell.
                outString.append("</u><br>");
                typeString = rs.getType();
				typeDesc = rs.getTypeDescription();
            }//end if (typeString.compareTo(rs.getType().trim()) != 0)

            if (rs.getRegion() != null && rs.getRegion().compareTo("") != 0)
                outString.append("<i>"+rs.getRegion().trim()+"</i><br>");

            if (rs.getContactName() != null && rs.getContactName().compareTo("") != 0) {
				outString.append(rs.getContactName().trim());

                if (rs.getDegree() != null && rs.getDegree().compareTo("") != 0) {
                    outString.append(", "+rs.getDegree());
				}// end if (rs.getDegree() != null && rs.getDegree().compareTo("") != 0)
                outString.append("<br>");
            }//end if (rs.getContactName() != null && rs.getContactName().compareTo("") != 0)

            if (rs.getTitle() != null && rs.getTitle().compareTo("") != 0)
                outString.append(rs.getTitle().trim()+"<br>");

            if (rs.getOrg1() != null && rs.getOrg1().compareTo("") != 0)
                outString.append(rs.getOrg1().trim()+"<br>");

            if (rs.getOrg2() != null && rs.getOrg2().compareTo("") != 0)
                outString.append(rs.getOrg2().trim()+"<br>");

            if (rs.getAddress1() != null && rs.getAddress1().compareTo("") != 0)
                outString.append(rs.getAddress1().trim()+"<br>");

            if (rs.getAddress2() != null && rs.getAddress2().compareTo("") != 0)
                outString.append(rs.getAddress2().trim()+"<br>");

            if (rs.getCity() != null && rs.getCity().compareTo("") != 0)
                outString.append(rs.getCity().trim()+", "+rs.getAddressState()+" "+rs.getZip().trim()+"<br>");

            if (rs.getPhone() != null && rs.getPhone().compareTo("") != 0)
                    outString.append("Phone:  "+rs.getPhone().trim()+"<br>");

            if (rs.getFax() != null && rs.getFax().compareTo("") != 0)
                    outString.append("Fax:  "+rs.getFax().trim()+"<br>");

            if (rs.getCell() != null && rs.getCell().compareTo("") != 0)
                    outString.append("Cell:  "+rs.getCell().trim()+"<br>");

            if (rs.getEmail() != null && rs.getEmail().compareTo("") != 0) {
                String emailStr = rs.getEmail().trim();
                outString.append("Email:  <a href=\"mailto:"+emailStr+"\" class='a1'>"+emailStr+"</a>"+"<br>");
            }

			//*** Organization URL #1 **********
            if (rs.getOrgurl() != null && rs.getOrgurl().compareTo("") != 0) {
                String urlStr = "";
                if (rs.getOrgurl().indexOf("http://") < 0) {
                    urlStr = "http://"+rs.getOrgurl().trim();
                } else {
                    urlStr = rs.getOrgurl().trim();
				}//end if (rs.getOrgurl().indexOf("http://") < 0)

                // Don't display "Web site:" field header for tobacco, breast cancer, and cervical cancer contacts.
                if (partnerString.equals("CDC") && (topic.equals("T") || topic.equals("B") || topic.equals("V"))) {
                   outString.append("<a href=\"/cgi-bin/awredir.pl?url="+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+"<br>");
                } else {
                    outString.append("Web site:  <a href=\"/cgi-bin/awredir.pl?url="+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+"<br>");
				}//end if (partnerString.equals("CDC") && (topic.equals("T") || topic.equals("B") || topic.equals("V")))
			}//end if (rs.getOrgurl() != null && rs.getOrgurl().compareTo("") != 0)

            //*** Organization URL #2 **********
            if (rs.getOrgurl2() != null && rs.getOrgurl2().compareTo("") != 0) {
                String urlStr = "";
                if (rs.getOrgurl2().indexOf("http://") < 0) {
                    urlStr = "http://"+rs.getOrgurl2().trim();
				} else {
                    urlStr = rs.getOrgurl2().trim();
				}//end (rs.getOrgurl2().indexOf("http://") < 0)

                // Don't display Web site: field header for tobacco, breast cancer, and cervical cancer contacts.
                if (partnerString.equals("CDC") && (topic.equals("T") || topic.equals("B") || topic.equals("V"))) {
                   outString.append("<a href=\"/cgi-bin/awredir.pl?url="+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+"<br>");
                } else {
                    outString.append("Web site:  <a href=\"/cgi-bin/awredir.pl?url="+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+"<br>");
				}//end if (partnerString.equals("CDC") && (topic.equals("T") || topic.equals("B") || topic.equals("V")))
            }//end if (rs.getOrgurl2() != null && rs.getOrgurl2().compareTo("") != 0)

            outString.append("<br><br>");
			typeDesc = rs.getTypeDescription();
            count ++;
			addedContact = 0;
			
		//} //end if !(partnerString.equals("CDC") && (topic.equals("B") || topic.equals("V") .....

    } while (it.hasNext());

	outString.append(endTD+"</table>"+endTD+"</table>");
	//added 01/23/06
    outString.append("</td></tr></table>");
}
else { //No partners returned!
	outString = new StringBuffer();
	outString.append("No records found.");
}//end if (partners!=null)

//****************************************************
//*****  SHOW STATE and TERRITORIES/TRIBES LIST  *****
//****************************************************
Vector states = QBean.getStateList();
Iterator it2 = states.iterator();

if (it2.hasNext()) {
        stateList = new StringBuffer();
        stateList.append("<table border='0' cellpadding='5' cellspacing='0' width='100%'><tr><th colspan='2' align='left' valign='top' width='100%'>States</th></tr><tr><td colspan=2><a href='list.jsp?r=ALL&cctopic=" + topic + "' title=\"All states and regions\">View all U.S. Program Partners</a></td></tr><tr><td valign='top' nowrap>");
		String typeString = "S";
        int count= 0;
        
        do {
			StateBean rs = (StateBean)it2.next();
			
			if (rs.getType().equals("S"))
			{
				if (region.compareTo(rs.getAbbreviation()) == 0) {
					stateStatic=rs.getName();
				}
	
	            if (count == 26) {
	                stateList.append("</td><td valign='top' nowrap>");
	            }
	            
	            if (count == 51) {
	              	stateList.append("</td></tr>");
					stateList.append("<tr><th colspan='2'>&nbsp;</th></tr>");
	            }

				if (count > 0 && count != 26 && count !=51 ) {
					stateList.append("<br />");
	            }
	
				if (region.compareTo(rs.getAbbreviation()) == 0) {
					stateList.append("<font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 12; color : AA0000;'><strong>&gt;&gt;"+rs.getName().trim()+"&lt;&lt;</strong></font>");
				} else {
		            stateList.append("<a href='list.jsp?r="+rs.getAbbreviation()+"&cctopic="+topic.toUpperCase()+"' class='a1' title='"+rs.getName().trim()+"'>"+rs.getName()+"</a>");
				}
				
				count++;
			}
        } while (it2.hasNext());

		stateList.append("<tr><th colspan='2' align='left' valign='top' width='100%'>Tribes</th></tr>");

		//Tribes
    	Iterator itb = states.iterator();
    	stateList.append("</td><td valign='top' colspan='2'>");

        do {
			StateBean rsb = (StateBean)itb.next();
			
			if (rsb.getType().equals("B"))
			{
				if (region.compareTo(rsb.getAbbreviation()) == 0) {
					stateStatic=rsb.getName();
				}
				
				if (region.compareTo(rsb.getAbbreviation()) == 0) {
					stateList.append("<font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 12; color : AA0000;'><strong>&gt;&gt;"+rsb.getName().trim()+"&lt;&lt;</strong></font>");
				} else {
		            stateList.append("<a href='list.jsp?r="+rsb.getAbbreviation()+"&cctopic="+topic.toUpperCase()+"' class='a1' title='"+rsb.getName().trim()+"'>"+rsb.getName()+"</a>");
				}
				
              	stateList.append("<br />");
				
				count++;
			}
        } while (itb.hasNext());
		
		stateList.append("<tr><th colspan='2' align='left' valign='top' width='100%'>Territories</th></tr>");
		
		//Territories
    	Iterator itt = states.iterator();
    	stateList.append("</td><td valign='top' colspan='2'>");

        do {
			StateBean rst = (StateBean)itt.next();
			
			if (rst.getType().equals("T"))
			{
				if (region.compareTo(rst.getAbbreviation()) == 0) {
					stateStatic=rst.getName();
				}
				
				if (region.compareTo(rst.getAbbreviation()) == 0) {
					stateList.append("<font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 12; color : AA0000;'><strong>&gt;&gt;"+rst.getName().trim()+"&lt;&lt;</strong></font>");
				} else {
		            stateList.append("<a href='list.jsp?r="+rst.getAbbreviation()+"&cctopic="+topic.toUpperCase()+"' class='a1' title='"+rst.getName().trim()+"'>"+rst.getName()+"</a>");
				}
				
              	stateList.append("<br />");
				
				count++;
			}
        } while (itt.hasNext());

        //stateList.append("<br/><br/></td></tr><tr><td colspan=2><a href='list.jsp?r=ALL&cctopic=" + topic + "' title=\"All states and regions\">View all U.S. Program Partners</a></td></tr></table>");
        stateList.append("</td></tr></table>");
}//end if (it2.hasNext())
//****************************************************
//*****  END STATE and TERRITORIES/TRIBES LIST   *****
//****************************************************

		pageTitle = pageTitle + " - " + stateStatic;

//****************** Page Header/Title ****************
		if (stateStatic.compareTo("the US") == 0) {
			stateStatic = "All States";

			headerText = "<p>If you need assistance in identifying cancer survivorship programs and resources, please contact any of the partners listed for your state.</p>";

			if (topicDesc.compareTo("") != 0)
				partnerText=topicDesc+" and Other Program Partners - <font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size : 20px;	font-weight: bold; color : #AA0000;'>All States</font>";	
			else
				partnerText="Program Partners - <font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 20px; font-weight: bold; color : #AA0000;'>All States</font>";
		} else {
			headerText = "<p>If you need assistance in identifying cancer survivorship programs and resources, please contact any of the partners listed on this page.</p>";
			
			if (topicDesc.compareTo("") != 0) {
				partnerText=topicDesc+" and Other Program Partners - <font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 20px; font-weight: bold; color : #AA0000;'>"+stateStatic+"</font>";
			} else {
				partnerText="Program Partners - <font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 20px; font-weight: bold; color : #AA0000;'>"+stateStatic+"</font>";
			}
		}
//*****************************************************

//NCIPopChartEmbedder myChart = new NCIPopChartEmbedder();
//myChart.appearanceFile = "apfiles/planet/ccpmap_small.pcxml";
//myChart.pcScript = pcScript;
//myChart.height = 360;
//myChart.width = 505;
//myChart.imageType = "FLASH";
//myChart.fallback = "STRICT";
//myChart.returnDescriptiveLink = false;
//myChart.userAgent = request.getHeader("USER-AGENT");
//htmlString = myChart.getEmbeddingHTML();%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title><%= caption%></title>
<link href="../styles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bgcolor="White">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p class="banner"><a href="../index.html"><img src="../images/planet_logo.gif" alt="Cancer Control P.L.A.N.E.T. - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>    <td><a href="../index.html"><img src="../images/planet_banner_wider.gif" alt="Cancer Control P.L.A.N.E.T. - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
<td><p><a href="../index.html">Home</a><br>
        <a href="../contact.html">Contact Us</a><br>
		<a href="/cgi-bin/awredir.pl?url=http://ccplanetraining.cancer.gov" onClick="javascript:popWindow('/cgi-bin/awredir.pl?url=http://ccplanetraining.cancer.gov', 'name','925','600','yes'); return false;">On-line Training</a><br />
 	    <a href="about.html">About This Site</a><br>
        <a href="../factsheet.pdf">Fact Sheet (PDF)</a><br>
        <a href="../partners.html">Sponsors</a></p></td>
  </tr>
  <tr>
    <td colspan="3" id="breadcrumbs"><a href="index.html">Home</a> &gt; Program Partners in Cancer Control &gt; <%= stateStatic %></td>
  </tr>
</table>

<table bgcolor="white" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td valign="top" align="left" colspan="3"><div style="font-family : Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 20px; font-weight: bold; color: #000000;"><img src="../images/planet_step2.gif" alt="Step 2" align="absmiddle">&nbsp;<%= partnerText%></div><br>
		<%= headerText %>
		<p>To locate research partners in <%= stateStatic%> go to the  <a href="rlist.jsp?r=<%= region%>&cctopic=<%= topicNum%>">Research Partners</a> page.</p>
	</td>
	<td valign="top" style="font-family : Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 14px; font-weight: bold; color: #000000;" align="right" colspan="2">&nbsp;</td>
</tr>
<tr>
	<td colspan="3">&nbsp;</td>
</tr>
<tr>
	<td valign="top" width="28%"><%= stateList.toString()%></td>
	<td valign="top" width="2%">&nbsp;</td>
	<td valign="top" width="70%"><!--- < %= ACS_count %>,< %= ACOS_count%>,< %= CDC_count%>,< %= CIS_count%><BR>
	< %= totACS_count %>,< %= totACOS_count%>,< %= totCDC_count%>,< %= totCIS_count%>; < %= numVectors%><BR> --->
	<%= outString.toString()%></td>
</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><hr size="1" noshade>
	<div align="center"><a href="../index.html">Home</a>&nbsp;&nbsp;&nbsp; <a href="../contact.html">Contact Us</a>&nbsp;&nbsp;&nbsp;
    <a href="../about.html">About this Site</a>&nbsp;&nbsp;&nbsp;
        <a href="../partners.html">Sponsors</a>&nbsp;&nbsp;&nbsp; <a href="../privacy.html">Privacy
        Policy</a>&nbsp;&nbsp;&nbsp; <a href="../disclaimer.html">Disclaimer</a>&nbsp;&nbsp;&nbsp; <a href="../accessibility.html">Accessibility</a><br>
      </div></td>
  </tr>
</table>
</body></html>
