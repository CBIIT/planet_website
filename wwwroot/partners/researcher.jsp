<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<%
    StringBuffer stateList = null;
	int topic = 0;
	Integer ccTopic = new Integer(0);
    String param = null;
	String htmlString = null;
    String caption = null;
    String pageTitle = "";

    param = request.getParameter("cctopic");

    if (param != null)
       topic = Integer.parseInt(param);
		ccTopic = new Integer(topic);

    QueryBean QBean = new QueryBean();
    // Find the page title to use based on the topic
    String topicTitle = QBean.getTopicDescription(ccTopic);
    pageTitle = "Locate " + topicTitle + " Partners in Your State or Region";
    caption = "Cancer Control P.L.A.N.E.T. - " + topicTitle;

    String typeString = "S";

    Vector states = QBean.getStateList();
    Iterator it2 = states.iterator();

    if (it2.hasNext())
    {
	
        stateList = new StringBuffer();
        int count= 0;
		//stateList.append("<tr><th colspan='2' align='left' valign='top' nowrap bgcolor='#F1F1FD'>STATES</th><th align='left' valign='top' bgcolor='#F1F1FD' nowrap>TERRITORIES/TRIBES</th></tr><tr><td valign='top' bgcolor='#F1F1FD' nowrap>");
        stateList.append("<table border='0' cellpadding='5' cellspacing='0' width='100%'><tr><th colspan='3' align='left' valign='top' nowrap>States</th><th colspan='1' align='left' valign='top' nowrap>Tribes</th></tr><tr colspan='4' align='left' valign='top'><td><p><a href='http://cancercontrolplanet.cancer.gov/partners/rlist.jsp?r=ALL&cctopic=0' alt='View all U.S. Research Partners'>View all U.S. Research Partners</a></p></td></tr><tr><td valign='top' nowrap>");

        do
        {
           StateBean rs = (StateBean)it2.next();
		   
		   if (rs.getType().equals("S"))
		   {
		      if (count == 17) {
                stateList.append("</td><td valign='top' nowrap>");
                //count = 0;
            }
			
			 if (count == 34) {
                stateList.append("</td><td valign='top' nowrap>");
                //count = 0;
            }
			
             /*if (count == 51) {
              	stateList.append("</td></tr>");
				stateList.append("<tr><th colspan='1' align='left' valign='top' nowrap>Territories / Tribes</th></tr><tr><td colspan='2' valign='top' nowrap>");
                //count = 0;
            }*/
			
			 if (count == 51) {
                stateList.append("</td><td valign='top' nowrap>");
                //count = 0;
            }
			
			/*if (count == 56) {
                stateList.append("</td><td valign='top' bgcolor='#F1F1FD' nowrap>");
				//count = 0;
            }*/
			
			//if (count > 0 && count != 17 && count != 34 && count !=51  && count !=56)
			if (count > 0 && count != 17 && count != 34 && count !=51 )
                stateList.append("<br />");
				
			//if (count > 0 && count != 17 && count != 34 && count !=51 ) {
             //  stateList.append("<br />");
           /* comment out 10/26/2005
		   
		   if (count > 18)
           {
               stateList.append("</td><td valign='bottom' bgcolor='F1F1FD'>");
               count = 0;
           }
           if (typeString.compareTo(rs.getType()) != 0)
           {
               stateList.append("<br />");
               typeString = rs.getType();
           } */
           stateList.append("\n<a href='rlist.jsp?r="+rs.getAbbreviation()+"&cctopic="+topic+"'>"+rs.getName()+"</a>");
           count++;
           }
      } while (it2.hasNext());
    
    //Tribes
    Iterator itb = states.iterator();
    stateList.append("</td><td valign='top'>");
    
    do
    {
		StateBean rsb = (StateBean)itb.next();
		
		if (rsb.getType().equals("B"))
		{
			stateList.append("\n<a href='rlist.jsp?r="+rsb.getAbbreviation()+"&cctopic="+topic+"'>"+rsb.getName()+"</a>");
			stateList.append("<br />");
			count++;
		}
	} while (itb.hasNext());
	
    //Territories
    Iterator itt = states.iterator();
    stateList.append("<br /><table border='0' cellpadding='0' cellspacing='0' width='100%'><tr><th colspan='1' align='left' valign='top' nowrap>Territories</th></tr></table>");
    
    do
	{
		StateBean rst = (StateBean)itt.next();
		
		if (rst.getType().equals("T"))
		{
			stateList.append("\n<a href='rlist.jsp?r="+rst.getAbbreviation()+"&cctopic="+topic+"'>"+rst.getName()+"</a>");
			stateList.append("<br />");
			count++;
		}
	} while (itt.hasNext());
    
	stateList.append("</td></tr></table>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Cancer Control P.L.A.N.E.T. - Research Partners in Cancer Control</title>
<link href="../styles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bgcolor="White">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p class="banner"><a href="../index.html"><img src="../images/planet_logo.gif" alt="Cancer Control P.L.A.N.E.T. - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
    <td><a href="../index.html"><img src="../images/planet_banner_wider.gif" alt="Cancer Control P.L.A.N.E.T. - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
    <td><p><a href="../index.html">Home</a><br />
        <a href="../contact.html">Contact Us</a><br />
        <a href="/cgi-bin/awredir.pl?url=http://ccplanetraining.cancer.gov" onClick="javascript:popWindow('/cgi-bin/awredir.pl?url=http://ccplanetraining.cancer.gov', 'name','925','600','yes'); return false;"></a><br />
		<a href="../about.html">About This Site</a><br />
        <a href="../factsheet.pdf">Fact Sheet (PDF)</a><br />

        <a href="../partners.html">Sponsors</a></p></td>
  </tr>
  <tr>
    <td colspan="3" id="breadcrumbs"><a href="index.html">Home</a> &gt; Research Partners in Cancer Control</td>
  </tr>
</table>

<table summary="Links to potential partner list" bgcolor="white" border="0" cellpadding="5" cellspacing="0">
<tr>
	<td align="left" colspan="3">
	<h3><img src="../images/planet_step2.gif" alt="Step 2" align="absmiddle">&nbsp;Research Partners in Cancer Control</h3>

    <p>To locate program partners in your state or region go to the <a href="index.jsp?cctopic=0">Program Partners</a> page.</p>
	</td>
</tr>
<tr>
	<td valign='top' colspan="2"><%= stateList.toString()%><br /></td>
</tr>
<tr>
    <td colspan="3">The list of research partners was compiled based on those individuals who had received a grant during the fiscal year period from 1998-2006 and who have permitted their contact information to be listed as a resource for comprehensive cancer control planning and implementation within their state, tribe, or territory.</td>
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
      </div>
    </td>
  </tr>
</table>
</body></html>
