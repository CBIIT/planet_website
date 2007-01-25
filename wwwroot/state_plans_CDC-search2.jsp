<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="gov.nci.corda.NCIPopChartEmbedder" %>
<%@ page import="gov.nci.planet.QueryBean" %>
<%@ page import="gov.nci.planet.bean.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<%

string strkeyword;

strkeyword = req.getParamerter("txtKeyword");


response.sendRedirect("http://broadband.ngcits.com/cccsearch/Default.aspx?PageID=7&KW=" + strkeyword + "&FLG=ALL&");

%>
<html>
<head>
<title></title>
<link href="styles.css" rel="stylesheet" type="text/css">

</head>
<body topmargin="0" leftmargin="0" bgcolor="White">

</body></html>
