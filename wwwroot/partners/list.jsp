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
caption = "Cancer Control PLANET - " + pageTitle;

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
	if (ACS_count > 0) {totACS_count = totACS_count + 1;}
	if (ACOS_count > 0) {totACOS_count = totACOS_count + 1;}
	if (CDC_count > 0) {totCDC_count = totCDC_count + 1;}
	if (CIS_count > 0) {totCIS_count = totCIS_count + 1;}
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
		int addedContact = 0;
				
        do { //do once, then loop while (it.hasNext() {
	        PartnerBean rs = (PartnerBean)it.next();
			typeDesc = rs.getTypeDescription();
            if (stateName.compareTo(rs.getStateName().trim()) != 0) { //This is a new state
                if (count > 1) {//We have already displayed our first result
                    outString.append("</table></p>");
				}//end if (count > 1)

                partnerId = rs.getPartnerId();
                partnerString = rs.getPartnerAbbreviation();
                typeString = rs.getType();
                stateName = rs.getStateName();
				typeDesc = rs.getTypeDescription();

				//*******************************************
				//*** Display State Name and Partner Name ***
                //*******************************************
				outString.append("<table border='0' cellspacing='0' cellpadding='0' width='100%'>");
                outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left'><font style='font-family : Arial, Helvetica, Verdana, Geneva,  sans-serif;	font-size : 12px;	font-weight: bold; color : #AA0000;'>"+stateName+"</font><br><br>"+rs.getPartnerName()+endTD);
				//outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;font-weight: bold;color: #000000;' align='left'>"+rs.getPartnerName()+endTD);
                //*******************************************

                //*******************************************
				//*** Display Contact Type ***
                //*******************************************
				// For state and territory contacts we may need to tack on some additional information.
				// outString.append(partnerString + " - " + typeString + " - " + topic + " - " + typeDesc + " - ");
                outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;font-style: normal;' align='left'>");
                outString.append("<u>" + typeDesc);
				if (partnerString.equals("CDC") && !typeString.equals("W")) {
                    if (topic.equals("T")) {
                        outString.append(" Health Department Web Site");
					} else if (topic.equals("P")) {
						outString.append(" Health Department Contact");
						addedContact = 1;
					} else { //Is CDC, and not type W, and not topic T,P
						addedContact = 1;
                        outString.append(" Contact");
					} //end if (topic.equals("T"))
                } //end if (partnerString.equals("CDC") && !typeString.equals("W"))
				
				if (typeDesc.equals("Regional") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}//end if (typeDesc.equals("Regional") && (addedContact != 1))
				
				if (typeDesc.equals("State") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}//end if (typeDesc.equals("State") && (addedContact != 1))
				
                // Close the underlining and the table cell.
                outString.append("</u>"+endTD);
				//*******************************************
            }//end if (stateName.compareTo(rs.getStateName().trim()) != 0)
                
            if (partnerId != rs.getPartnerId()) { //If new partner

                if (count > 1) {
                   outString.append("</table></p>");
				}//end if (count > 1)

                partnerId = rs.getPartnerId();
                partnerString = rs.getPartnerAbbreviation();
                typeString = rs.getType();
				typeDesc = rs.getTypeDescription();
                outString.append("<p><table border='1' cellspacing='0' cellpadding='0' width='100%'>");
                
                outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;color: #000000;' align='left'><b>"+rs.getPartnerName()+"</b><br>");

                //outString.append("<tr><td style='font-family: Arial, Helvetica, Verdana, Geneva, sans-serif;font-size: 12;style: bold;' align='left'>");
                outString.append("<u>" + rs.getTypeDescription());
                
                // For state and territory contacts we may need to tack on some additional information.
				//outString.append(partnerString + " - " + typeString + " - " + topic + " - " + typeDesc + " - ");
                if (partnerString.equals("CDC") && !typeString.equals("W")) {
                    if (topic.equals("T")) {
                        outString.append(" Health Department Web Site");
                    } else if (topic.equals("P")) {
                        outString.append(" Health Department Contact");
						addedContact = 1;
                    } else if (addedContact != 1) {
						outString.append(" Contact");
						addedContact = 1;
					}//end if (topic.equals("T"))
                }//end if (partnerString.equals("CDC") && !typeString.equals("W"))
				
				if (typeDesc.equals("Regional") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}//end if (typeDesc.equals("Regional") && (addedContact != 1))
				
				if (typeDesc.equals("State") && (addedContact != 1)) {
					outString.append(" Contact");
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
                       outString.append(" Health Department Contact");
					   addedContact = 1;
                    } else {
								if (addedContact != 1) {
									outString.append(" Contact");
									addedContact = 1;
								}//end if (addedContact != 1)
					}//end if (topic.compareTo("C") != 0)
                }//end if (partnerString.equals("CDC") && !typeString.equals("W"))

				if (typeDesc.equals("Regional") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}//end if (typeDesc.equals("Regional") && (addedContact != 1))
				
				if (typeDesc.equals("State") && (addedContact != 1)) {
					outString.append(" Contact");
					addedContact = 1;
				}//end if (typeDesc.equals("State") && (addedContact != 1))

                // Close the underlining and the table cell.
                outString.append("</u><br>");
                typeString = rs.getType();
				typeDesc = rs.getTypeDescription();
            }//end if (typeString.compareTo(rs.getType().trim()) != 0)

            if (rs.getContactName() != null && rs.getContactName().compareTo("") != 0) {
                outString.append(beginTD+rs.getContactName().trim());

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
                   outString.append("<a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+"<br>");
                } else {
                    outString.append("Web site:  <a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+"<br>");
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
                   outString.append("<a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+"<br>");
                } else {
                    outString.append("Web site:  <a href=\""+urlStr+"\" target=\"_blank\" class='a1'>"+urlStr+"</a>"+"<br>");
				}//end if (partnerString.equals("CDC") && (topic.equals("T") || topic.equals("B") || topic.equals("V")))
            }//end if (rs.getOrgurl2() != null && rs.getOrgurl2().compareTo("") != 0)

            outString.append(endTD+"<tr><td height='10'>&nbsp;</td></tr>");
			typeDesc = rs.getTypeDescription();
            count ++;
			addedContact = 0;
        } while (it.hasNext());

		outString.append("</table>");
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
		//stateList.append("<table border='0' cellpadding='5' cellspacing='0'><tr><th colspan='2' align='left' valign='top' nowrap>STATES</th><th align='left' valign='top' nowrap>TERRITORIES/TRIBES</th></tr><tr><td valign='top' nowrap>");
        stateList.append("<table border='0' cellpadding='5' cellspacing='0' width='100%'><tr><th colspan='2' align='left' valign='top' width='100%'>States</th></tr><tr><td valign='top' nowrap>");
		String typeString = "S";
        int count= 0;
		
        do {
			StateBean rs = (StateBean)it2.next();
			
			if (region.compareTo(rs.getAbbreviation()) == 0) {
				stateStatic=rs.getName();
			}//end if (region.compareTo(rs.getAbbreviation()) == 0)
				
            if (count == 26) {
                stateList.append("</td><td valign='top' nowrap>");
                //count = 0;
            }//end if (count == 26) 
            if (count == 51) {
              	stateList.append("</td></tr>");
				stateList.append("<tr><th colspan='2'>&nbsp;</th></tr>");
				stateList.append("<tr><th colspan='2' align='left' valign='top'>Territories / Tribes</th></tr><tr><td valign='top' colspan='2'>");
                //count = 0;
            }//end if (count == 51)

			//comment out 01/10/2005
			//if (count == 56) {
            //   stateList.append("</td><td valign='top' colspan='2' bgcolor='#F1F1FD'>");
			// }
            
			//if (typeString.compareTo(rs.getType()) != 0) {
            //    stateList.append("<br />");
            //    typeString = rs.getType();
            //}
			
            
           //comment out 01/10/2005
           //if (count > 0 && count != 26 && count !=51 && count !=56) {
			if (count > 0 && count != 26 && count !=51 ) {
				stateList.append("<br />");
                
             //    if (count > 51){
             //   stateList.append("<br /><br />");
             //   }
            }//end if (count > 0 && count != 26 && count !=51 )
						
			if (region.compareTo(rs.getAbbreviation()) == 0) {
				stateList.append("<font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size : 12px; color : AA0000;'><strong>"+rs.getName().trim()+"</strong></font>");
			} else {
	            stateList.append("<a href='list.jsp?r="+rs.getAbbreviation()+"&cctopic="+topic.toUpperCase()+"' class='a1' title='"+rs.getName().trim()+"'>"+rs.getName()+"</a>");
			}//end if (region.compareTo(rs.getAbbreviation()) == 0)
			count++;
        } while (it2.hasNext());

        stateList.append("<br/><br/></td></tr><tr><td colspan=2><a href='list.jsp?r=ALL&cctopic=" + topic + "' title=\"All states and regions\">View all U.S. Program Partners</a></td></tr></table>");
}//end if (it2.hasNext())
//****************************************************
//*****  END STATE and TERRITORIES/TRIBES LIST   *****
//****************************************************

		pageTitle = pageTitle + " - " + stateStatic;
		
//****************** Page Header/Title ****************
		if (stateStatic.compareTo("the US") == 0) {
			stateStatic = "All States";

			if (topicDesc.compareTo("") != 0)
				partnerText=topicDesc+" and Other Program Partners - <font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size : 20px;	font-weight: bold; color : #AA0000;'>All States</font>";	
			else
				partnerText="Program Partners - <font style='font-family : Arial, Helvetica, Verdana, Geneva, sans-serif;	font-size: 20px; font-weight: bold; color : #AA0000;'>All States</font>";
		} else {
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
<script type="text/javascript" src="/fsrscripts/triggerParams.js"></script> 
<script type="text/javascript" src="/fsrscripts/stdLauncher.js"></script>
<script type="text/javascript">Poll();</script>
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

<table bgcolor="white" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td valign="top" align="left" colspan="3"><div style="font-family : Arial, Helvetica, Verdana, Geneva, sans-serif; font-size: 20px; font-weight: bold; color: #000000;"><%= partnerText%></div><br>
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
	<td valign="top" width="70%"><%= ACS_count %>,<%= ACOS_count%>,<%= CDC_count%>,<%= CIS_count%><BR>
	<%= totACS_count %>,<%= totACOS_count%>,<%= totCDC_count%>,<%= totCIS_count%>; <%= numVectors%><BR>
	<%= outString.toString()%></td>
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
