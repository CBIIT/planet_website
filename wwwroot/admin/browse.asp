<HTML>
<HEAD><TITLE></TITLE></HEAD>
<BODY>
<!--- #include file="dbutil.asp" --->
	<H1 ALIGN="center">TITLE</H1>
<%
	Dim cmd
	Dim rstContacts
	Dim strProcName
	Dim strName

	strProcName="GetPartners"
' GetStoredProc(strPackage, strProcName, strConnOptions)
	cmd = GetStoredProc("planet_pkg", strProcName)
	cmd.Parameters.Append cmd.CreateParameter("cctopic", adVarChar, adParamInput, 2, "C")

' RunSPReturnRS(ByRef cmd)
	rstContacts = RunSPReturnsRS(cmd)
%>
	<TABLE><TR><TD>
		<!--- Sidebar --->
			Add New Contact<BR>
			Browse All Contacts<BR>
			Back to Home
		</TD><TD>
		<!--- Main Body --->
			<TABLE BORDER=1>
				<TR>
					<TH>Partner Contact</TH><TH>States Represented</TH><TH>Email</TH><TH>Phone</TH><TH>Fax</TH><TH>Address1</TH><TH>City</TH><TH>State</TH><TH>Zip</TH>
<%
	Do While Not rstContacts.EOF
		strName = rstContacts("contact_name")
%>
				</TR><TR>
					<TD><%=strName%></TD><TD></TD><TD><%=rstContacts("email")%></TD><TD><%=rstContacts("phone")%></TD>
					<TD><%=rstContacts("fax")%></TD><TD><%=rstContacts("address1")%></TD><TD><%=rstContacts("city")%></TD>
					<TD><%=rstContacts("address_state")%></TD><TD><%=rstContacts("zip")%></TD>
<%
		rstContacts.MoveNext
	Loop
%>
				</TR>
			</TABLE>
	</TD></TR></TABLE>
</BODY>
</HTML>