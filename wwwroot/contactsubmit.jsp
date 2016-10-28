<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.*" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.CaptchaValidator" %>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<!doctype html>
<html>
<head>
<title>Cancer Control P.L.A.N.E.T. - Contact Us</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="js/tipsy.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="js/jquery.tipsy.js"></script>
<script src="js/jquery.listen-1.0.3-min.js"></script>
<script src="js/addThisListener.js"></script>
<script src="js/validate.js"></script>
<script type='text/javascript'>
        $(function () {
            $('.infoBubble').tipsy({ gravity: 'w', fade: 'true' });
        });
</script>
</head>

<body>
<div class="container">
	<div><a class="sr-only sr-only-focusable" href="#content">Skip to main content</a></div>
    <header class="banner">
    	<a href="index.html"><img src="images/banner.gif" width="1000" height="137" border="0" alt="Cancer Control P.L.A.N.E.T. Plan, Link, Act, Network with Evidence-based Tools" /></a>
    	<div class="headerTagline">
			<a href="index.html">Links to Comprehensive Cancer Control Resources for Public Health Professionals</a>
		</div> <!-- close headerTagline -->
	</header> <!-- close banner -->
    <nav class="topnav">
		<a href="index.html">Home</a> | <a href="about.html">About This Site</a> | <a href="faq.html">FAQ</a> | <a href="sponsors.html">Sponsors</a> | <a href="contact.html" class="active">Contact Us</a>
	</nav> <!-- close topnav -->
	
    <div class="clearfix" id="content" tabindex="-1">
    <div class="wrapper">
    	
    		<!-- AddThis Code -->
            <script type="text/javascript">
            document.writeln('<a class="addthis_button" href="http://addthis.com/bookmark.php?v=250&username=ccplanet">');
            document.writeln('<img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a>');
            </script>

            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=ccplanet"></script><script type="text/javascript">
            var addthis_config = {
                services_compact: 'email,print,twitter,ccplanet.cancer.gov,facebook,myspace,digg, more',
                services_custom: [{
                    	name: "Badges",
              	        url: "http://ccplanet.cancer.gov/badges.html",
              	        icon: "http://ccplanet.cancer.gov/images/planet_icon_tiny.gif"}],
              	        data_track_linkback: true,
		 		        ui_508_compliant: true
                }
            </script>
    	
        <h1>Contact Us</h1>
        
        <p>Your comments, questions, and suggestions are appreciated.</p>
		
        <p>For general cancer information, please visit <a href="/cgi-bin/awredir.pl?url=http://www.cancer.gov" target="_blank">cancer.gov<img src="images/Icon_External_Link.png" alt="External link" class="external-link" width="12" height="12"></a>.</p>
        
        <p>You may also provide feedback here on the Cancer Control P.L.A.N.E.T.</p>
        
        <p>Thank you for providing this information. Below is the information you provided.</font></p>	
			<%
				String feedback = request.getParameter("feedback");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String captcha_response =  request.getParameter("g-recaptcha-response");
				
				CaptchaValidator cv = new CaptchaValidator();
				Boolean validCaptcha = cv.getPlanetRecaptchaResponse(captcha_response);
			
				if (!validCaptcha){%>
					
				<p>Please enter your comments through the <a href="contact.html">contact page</a>. Make sure to complete the CAPTCHA prior to submission</p>
				<%}
				else if (feedback == null || feedback.equals(""))
				{
			%>
					<p>No information entered &#8212; please enter your comments with an email on the <a href="contact.html">contact page</a>.</p>
			<%
				}
				else if (email == null || email.equals("")) {
			%>
					<p>No information entered &#8212; please enter your comments with an email on the <a href="contact.html">contact page</a>.</p>
			<%    	
				}
				else
				{
        	%>
    	
        <p>Comments:</p>
        <%=feedback%>
        
        <p>Email:</p>
    	<%=email%>
        
        <p>Phone:</p>
        <%=phone%>
        	
            <%
				try{
					// Write feedback to database.
					QueryBean QBean = new QueryBean();
					QBean.saveFeedback(feedback, email, phone);
					//QBean.close();
						} catch (Exception e) {
							response.sendRedirect(response.encodeRedirectURL("contact.html?" + e.getMessage()));
						}
					}
			%>
    </div> <!-- close wrapper -->
    </div> <!-- close content -->
    
    <footer>
    <hr>
    <div class="bottomnav">
        <a href="index.html">Home</a> | 
        <a href="contact.html" class="active">Contact Us</a> | 
        <a href="viewing-files.html">Viewing Files</a> | 
        <a href="http://www.cancer.gov/global/web/policies/page2" target="_blank">Privacy Policy</a> | 
        <a href="disclaimer.html">Disclaimer</a> | 
        <a href="http://www.cancer.gov/global/web/policies/page3" target="_blank">Accessibility</a> |
        <a href="http://www.cancer.gov/global/web/policies/foia" target="_blank">Freedom of Information Act</a>
    </div> <!-- close bottomnav -->
    
    <div>Content on this page is maintained by the <a href="/cgi-bin/awredir.pl?url=http://cancercontrol.cancer.gov" target="_blank">Division of Cancer Control and Population Sciences at the National Cancer Institute<img src="images/Icon_External_Link.png" width="12" height="12" alt="External link"  class="external-link"></a>.</div>
    
    <div>Cancer Control P.L.A.N.E.T. is not affiliated with Planet Cancer. To visit Planet Cancer's site, please go to <a title="External link" href="/cgi-bin/awredir.pl?url=http://myplanet.planetcancer.org/" target="_blank">www.planetcancer.org<img src="images/Icon_External_Link.png" width="12" height="12" alt="External link"  class="external-link"></a>.</div>
	
	<div class="footer-logos">
    	<a href="/cgi-bin/awredir.pl?url=http://www.hhs.gov" target="_blank"><img src="images/hhs-logo.jpg" height="55" alt="Department of Health and Human Services"></a>
		<div class="footer-logo-usagov">
        	<a href="/cgi-bin/awredir.pl?url=http://www.usa.gov" target="_blank"><img src="images/usagov-logo.jpg" height="35" alt="USA.gov"></a>
        </div>
    </div>
    </footer> <!-- close footer -->
    
</div> <!-- close container -->

<script language="JavaScript" type="text/javascript" src="/JS/Omniture/WA_DCCPS_PageLoad.js"></script>

<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-30179125-1']);
	_gaq.push(['_trackPageview']);

	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
</script>
</body>
</html>