<%@ page language="java" contentType="text/html" %>
<%

response.setStatus(301);
response.setHeader( "Location", "https://cancercontrolplanet.cancer.gov/" );


%>
<html>
<head>
<title>Page Not Available</title>

</head>

<body>
    <%
        response.setStatus(301);
        response.setHeader("Location", "https://cancercontrolplanet.cancer.gov/");

    %>
</body>
</html>
