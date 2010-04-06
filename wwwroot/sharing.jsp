<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.*"%>

<%  
	String strurl;
	String title = "";
	String facebook_url;
	String linkedin_url;
	String myspace_url;
	String digg_url;
	String delicious_url;
	String stumble_url;
	String twitter_url;
	String pageTitle = "";//this is the title for the function "sending the page to a friend
	
	
	//strurl ="http://qshi.s156.eatj.com/Hints_phase_2/landing.jsp?t=" + request.getParameter("t");
	//strurl = "http://shiq.s156.eatj.com/hints_phase_2/";
	//strurl ="http://localhost:8080/planet/";
	//strurl ="parsley.cit.nih.gov:8080/planet/"; //staging - parlsey
	strurl ="http://parsley.cit.nih.gov/planet/";
	//strurl ="http://ccplanet.cancer.gov/"; //Live link
	   if  (request.getServletPath().equals("/briefs.jsp")) {
			title="HINTS: HINTS Resources and Materials";
			pageTitle  = title;
			strurl += "briefs.jsp" ; 
		} 
		
		if  (request.getServletPath().equals("/index.jsp")) {
			title="Cancer Control - P.L.A.N.E.T.";
			pageTitle  = title;
			strurl += "index.jsp";
		} 
%>	

	<!--title: <%= title %><br /><br />-->
	<%	title = URLEncoder.encode(title); //removed comment on 10/14/2009 %>
	<!--encoded stitle: <%= title %>-->
<%	//strurl = URLEncoder.encode(strurl); 
	
	//facebook   
	facebook_url = "javascript:MM_openBrWindow('http://www.facebook.com/sharer.php?u=" + strurl + "&t=" + title + "','triggers','location=yes, scrollbars=yes,resizable=yes,width=600,height=545')";
	
	//Digg
	digg_url= "javascript:MM_openBrWindow('http://digg.com/submit?url=" + strurl +  "&title=" + title + "','triggers','location=yes, scrollbars=yes,resizable=yes,width=600,height=545')";
		 
	//stumble	 
	stumble_url = "javascript:MM_openBrWindow('http://www.stumbleupon.com/submit?url=" + strurl +  "&title=" + title + "','triggers','location=yes, scrollbars=yes,resizable=yes,width=600,height=545')";
		 
	//Delicious
	delicious_url = "javascript:MM_openBrWindow('http://delicious.com/save?url=" + URLEncoder.encode(strurl) +  "&amp;title=" + title + "','triggers','location=yes, scrollbars=yes,resizable=yes,width=600,height=545')";
		
	//Linkedin
	linkedin_url = "javascript:MM_openBrWindow('http://www.linkedin.com/shareArticle?mini=true&ro=true&url=" + strurl +  "&title=" + title + "','triggers','location=yes, scrollbars=yes,resizable=yes,width=600,height=545')";
			
	//Myspace
	myspace_url= "javascript:MM_openBrWindow('http://www.myspace.com/Modules/PostTo/Pages/?t=" + title  +  "&c=" + strurl  + "&u=&l= " + "','triggers','location=yes, scrollbars=yes,resizable=yes,width=600,height=545')";
	
	
	twitter_url= "javascript:MM_openBrWindow('http://twitter.com/home?status=" + title + " - " +  strurl+ "','triggers','location=yes, scrollbars=yes,resizable=yes,width=600,height=545')";
 %>
 

 <div class="box" onmouseover="ShowShareBox('sharing'); return false;">
     <img src="images/openshareicon-16x16.jpg"  alt="Share this page" width="16" height="16" border="0" align="texttop" />&nbsp;Share this page<%--referrer page: <%= request.getServletPath()%>--%>

<div id="sharing" onMouseOut="HideShareBox('sharing'); return false;" style="display:none">
<%--<p> strurl: <%=  strurl%><br /><br /> </p>--%>
<table width="200" border="0" cellspacing="0" cellpadding="0" style="margin-left: 18px; font-size: .9em;">
 <tr>
    <td width="18" style="padding: 1px;">&nbsp; </td>
    <td width="82" style="padding: 1px;"></td>
    <td width="18" style="padding: 1px;"></td>
    <td width="82" align="right" valign="top" style="padding: 1px;">
       	<img src="images/x.gif" alt="Close the window" width="10" height="10" 
        	border="1" align="texttop" onclick="HideShareBox('sharing'); return false;"/></td>
  </tr>
  <tr>
    <td width="18" style="padding: 1px;"><img src="images/sharing-icon-facebook.gif" alt="" width="18" height="18" /></td>
    <td width="82" style="padding: 1px;"><a href="<%= facebook_url %>">Facebook</a></td>
    <td width="18" style="padding: 1px;"><img src="images/sharing-icon-twitter.gif" alt="" width="18" height="18" /></td>
    <td width="82" style="padding: 1px;"><a href="<%= twitter_url %>">Twitter</a></td>
  </tr>
  <tr>
    <td style="padding: 1px;"><img src="images/sharing-icon-stumble.gif" alt="" width="18" height="18" /></td>
    <td style="padding: 1px;"><a href="<%= stumble_url %>">StumbleUpon</a></td>
    <td style="padding: 1px;"><img src="images/sharing-icon-digg.gif" alt="" width="18" height="18" /></td>
    <td style="padding: 1px;"><a href="<%= digg_url%>">Digg</a></td>
  </tr>
  <tr>
    <td style="padding: 1px;"><img src="images/sharing-icon-linkedin.gif" alt="" width="18" height="18" /></td>
    <td style="padding: 1px;"><a href="<%= linkedin_url %>">LinkedIn</a>&nbsp;</td>
    <td style="padding: 1px;"><img src="images/sharing-icon-del.gif" alt="" width="18" height="18" /></td>
    <td style="padding: 1px;"><a href="<%= delicious_url %>">Delicious</a></td>
  </tr>
  <% 	 
	 String file = request.getServletPath(); 
     file = file.replace("/", "");
	 //file = "\'" + file + "\'";
 
									
	/*session.setAttribute("articleURL", request.getServletPath());
	session.setAttribute("contextpath", request.getContextPath());	*/				
									
%>
  <!--session Servlet Path: <%= session.getAttribute("articleURL")%><br>
		Servlet Path: <%= request.getServletPath()%><br>
        Context Path: <%= request.getContextPath() %><br>
  	    session Context Pat <%= session.getAttribute("contextpath")%>-->
  <!--  pageTitle: <%= pageTitle%>-->
  <tr>
    <td valign="bottom" style="padding: 1px;" ><img src="images/icons_email.gif" alt="" width="18" height="18" /></td>
    <td style="padding: 1px;" valign="bottom" colspan="3"><a href="javascript:popUpWindow('send_to_friend.jsp?articleURL=<%= file%>&title=<%= pageTitle%>', 50,50,810,525);">E-mail to a friend</a>&nbsp;</td>
  </tr>
</table>
</div>
</div>  
<br />

<script language="JavaScript" type="text/JavaScript">
<!--

var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
  if(popUpWin)
  {
    if(!popUpWin.closed) popUpWin.close();
  }
  popUpWin = open(URLStr, 'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menub ar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width='+width+',height='+height+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

//-->
</script>     
         

