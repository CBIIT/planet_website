<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<%
    StringBuffer stateList = null;
    String topic = "C";
    String param = null;
    String htmlString = null;
    String caption = null;
    String pageTitle = "";

    param = request.getParameter("cctopic");
    if (param != null)
        // The database expects the topic to be an uppercase character.
        // Uppercase it here so we don't have to uppercase it every time
        // we use it.
        topic = param.toUpperCase();
  
    QueryBean QBean = new QueryBean();
    // Find the page title to use based on the topic
    String topicTitle = QBean.getTopicDescription(topic);
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
        stateList.append("<table border='0' cellpadding='5' cellspacing='0' width='100%'><tr><th colspan='3' align='left' valign='top' nowrap>States</th><th colspan='1' align='left' valign='top' nowrap>Tribes</th></tr><tr colspan='4' align='left' valign='top'><td><p><a href='http://cancercontrolplanet.cancer.gov/partners/list.jsp?r=ALL&cctopic=C' alt='View all U.S. Program Partners'>View all U.S. Program Partners</a></p></td></tr><tr><td valign='top' nowrap>");

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
           stateList.append("\n<a href='list.jsp?r="+rs.getAbbreviation()+"&cctopic="+topic+"'>"+rs.getName()+"</a>");
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
			stateList.append("\n<a href='list.jsp?r="+rsb.getAbbreviation()+"&cctopic="+topic+"'>"+rsb.getName()+"</a>");
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
			stateList.append("\n<a href='list.jsp?r="+rst.getAbbreviation()+"&cctopic="+topic+"'>"+rst.getName()+"</a>");
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
<title>Cancer Control P.L.A.N.E.T. - Program Partners in Cancer Control</title>
<script language="JavaScript" src="../popwindow.js" type="text/javascript"></script>
<link href="../styles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bgcolor="White">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p class="banner"><a href="../index.html"><img src="../images/planet_logo.gif" alt="Cancer Control P.L.A.N.E.T. - Plan, Link, Act, Network with Evidence-based Tools" width="169" height="87" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>    <td><a href="../index.html"><img src="../images/planet_banner_wider.gif" alt="Cancer Control P.L.A.N.E.T. - Links to comprehensive cancer control resources for public health professionals" width="500" height="82" border="0"></a></td>
<td><p><a href="../index.html">Home</a><br>
        <a href="../contact.html">Contact Us</a><br>
        <a href="/cgi-bin/awredir.pl?url=http://secure.mmgct.com/planettraining/" onClick="javascript:popWindow('/cgi-bin/awredir.pl?url=http://secure.mmgct.com/planettraining/', 'name','725','400','yes'); return false;">On-line Training</a><br />
	    <a href="../about.html">About This Site</a><br>
        <a href="../factsheet.pdf">Fact Sheet (PDF)</a><br>
        <a href="../partners.html">Sponsors</a><br />
        <a href="../faq.html">FAQ</a></p></td>
  </tr>
	<tr>
    <td colspan="3">
      <hr size="1" noshade>
	</td>

  </tr>
  
  <!--tr>
    <td colspan="3" id="breadcrumbs"><a href="../index.html">Home</a> &gt; Program Partners in Cancer Control</td>
  </tr-->
</table>

<table summary="Links to potential partner list" bgcolor="white" border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td align="left" colspan="3">
	<h3>Program Partners in Cancer Control</h3>
	
    <p>To locate research partners in your state or region go to the <a href="researcher.jsp?cctopic=0">Research Partners</a> page.</p>
	</td>
</tr>
<tr>
	<td valign='top' colspan="2"><%= stateList.toString()%><br /></td>
</tr>
 <tr>
	<td valign='top' colspan="2"><p>The list of program partners is compiled from organizaitons involved as National Partners for Comprehensive Cancer Control (American Cancer Society, Centers for Disease Control and Prevention, and Commission on Cancer).  State/Regional field staff from these organizations have been trained on how to use the Cancer Control P.L.A.N.E.T. web portal and are resources for comprehensive cancer control planning and implementation.  Contacts are updated annually.</p></td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><hr size="1" noshade>
	<div align="center">
          <p><a href="../index.html">Home</a>&nbsp;&nbsp;&nbsp;
              <a href="../contact.html">Contact Us</a>&nbsp;&nbsp;&nbsp;
              <a href="../about.html">About this Site</a>&nbsp;&nbsp;&nbsp;
              <a href="../partners.html">Sponsors</a>&nbsp;&nbsp;&nbsp;
              <a href="../privacy.html">Privacy Policy</a>&nbsp;&nbsp;&nbsp;
              <a href="../disclaimer.html">Disclaimer</a>&nbsp;&nbsp;&nbsp;
            <a href="../accessibility.html">Accessibility</a></p>
	</div>
    </td>
  </tr>
</table>
</body></html>
