<%@ page language="java" contentType="text/html" %>
<%@ page session="true" %>
<%@ page import="java.net.*"%>

<% 
	String file =  request.getParameter("articleURL"); 
	String title = request.getParameter("title"); 

	
	if (request.getParameter("articleURL") != null){
			file =  request.getParameter("articleURL"); 
	} else {  
		file = (String)session.getAttribute("articleURL") ;
	}


	/*if (request.getParameter("articleURL") != null) {
	
		URL reconstructedURL = new URL(request.getScheme(), 
										request.getServerName(), 
										request.getServerPort(), 
										file); 
	}*/
	
	
%>
   <!-- session articleURL:  <= session.getAttribute("articleURL")%><br />
	Querystring: <= file%><br />
	title: <= title %><br />
	session articleURL:  <= session.getAttribute("articleURL")%><br />-->
	<!--reconstructed URL: <= reconstructedURL.toString()%><br />-->
 <!--  Server Name: <%= request.getServerName()%><br />
  	Server Port: <%= request.getServerPort()%> <br />  
  	Context Path(): <%= request.getContextPath()%> <br />  
    session Context Path(): <%= session.getAttribute("contextpath")%><br />  -->
       
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Cancer Control P.L.A.N.E.T.: Share Cancer Control P.L.A.N.E.T. with a Friend</title>

<link href="styles-baseline.css" rel="stylesheet" type="text/css" />
<link href="styles-2-column.css" rel="stylesheet" type="text/css" />
<script src="scripts.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="/fsrscripts/triggerParams.js"></script> 
<script type="text/javascript" src="/fsrscripts/stdLauncher.js"></script>
<script type="text/javascript" src="javascript/validate.js"></script>
<script type="text/javascript" src="javascript/toggle.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function validateInput()
{  		
	if (document.form1.friendemail.value.length > 0) {
	
		var emailPattern = new RegExp("[\\w-\\.]+@(?!acme-hack)([\\w-]+\\.)+[\\w-]{2,4}$");
	
		  	if (!document.form1.friendemail.value.match(emailPattern)) {
		    	window.alert("Please enter a valid e-mail address.");
				 document.form1.friendemail.focus();
				return false;
			}
	} else {
		window.alert("Please enter recipient's e-mail address.");
		document.form1.friendemail.focus();
		return false;
	}
	 
	  
 	if (document.form1.myemail.value.length > 0) {
		    var emailPattern = new RegExp("[\\w-\\.]+@(?!acme-hack)([\\w-]+\\.)+[\\w-]{2,4}$");
	
		  	if (!document.form1.myemail.value.match(emailPattern)) {
		    	window.alert("Please enter a valid e-mail address.");
				 document.form1.myemail.focus();
				return false;
			}
						
			var commaPos = document.form1.myemail.value.indexOf(",");
			var semiPos = document.form1.myemail.value.indexOf(";");
	
			if (commaPos != -1 || semiPos != -1) {
				window.alert("Please only enter your own e-mail address.");
				document.form1.myemail.focus();
				return false;
			}
	
	} else {
		window.alert("Please enter your e-mail address.");
		document.form1.myemail.focus();
		return false;
	}
	
	
	if (document.form1.personalMessage.value.length > 0) {
      	var sqlInjectionPattern = new RegExp("\\w*((\\%27)|(\\'))((\\%6F)|o|(\\%4F))((\\%72)|r|(\\%52))");
   		var crossSiteScriptingPattern = new RegExp("((\\%3C)|<)(.|\\n)*?((\\%3E)|>)");
   	
   		if (document.form1.personalMessage.value.match(sqlInjectionPattern)) {
				window.alert("Please remove any special characters such as '<' and '>'.");
				return false;
	  	}
      	else if (document.form1.personalMessage.value.match(sqlInjectionPattern)) {
			window.alert("Please remove any special characters such as '<' and '>'.");
			return false;
	  	}
	  	else if (document.form1.personalMessage.value.match(crossSiteScriptingPattern)) {
			window.alert("Please remove any special characters such as '<' and '>'.");
			return false;
	  }
	  
}
  
}
 //-->
</script>
</head>

<body>
<form name="form1" action="email_message.jsp" method="post" onSubmit="return validateInput();">
<div id="content">
<table width="752" border="0" cellpadding="6" cellspacing="0">
<tr>
    	<td valign="top" align="left">Do you know someone who might be interested in Cancer Control P.L.A.N.E.T.? Share this link by e-mail, and let them know about Cancer Control P.L.A.N.E.T.
        </td>
  <tr>
  <tr>
    	<td valign="top" align="left">&nbsp;&nbsp;
        </td>
  <tr>
  <tr>
    	<td valign="top" align="left">
    	<label for="friendemail"><strong>*Recipient's e-mail address: </strong><br />
           <input type="text" name="friendemail" id="friendemail" size="30"></label>
           <br /><font size="-1">(please separate multiple addresses with commas) </font>
           <input type="hidden" name="title" id="title" value="<%= title%>"></td>
  </tr>
  <tr>
        <td valign="top" align="left">
      		<label for="myemail"><strong>*Your e-mail address: </strong><br />
            <input type="text" name="myemail" id="myemail" size="30"></label>
             <input type="hidden" name="articleURL" id="articleURL" value="<%= file %>">
         </td>

  </tr>
  <tr>
        <td valign="top" align="left">
      		<label for="personalMessage"><strong>Add a personal message:</strong> (optional) <br />
            <textarea name="personalMessage" id="personalMessage" rows="8" cols="50"></textarea></label>
          </td>

  </tr>
  <tr>
   	 	<td valign="top" align="left">&nbsp;
  </tr>
 
  <tr>
        <td valign="top" align="left">
      		 <input type="submit" name="Submit" value="Send"><br /><br />
       
</td>
 <tr>
        <td valign="top" align="left">Note: Your information will not be saved or stored.</td>
  </tr>
        
  </tr>
</table>
</div>
</form>


</body>
</html>