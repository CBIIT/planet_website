<!-- #include virtual="/grants/adovbs.asp" -->
<%
Const ConnString = "DSN=pmap"
Const SchemaName = "dccps."
Const GrantsPerPage = 100

' Returns a command object ready to have its parameters added.
' Input: strPkgName - name of package
'        strProcName - name of stored procedure to run.
' Returns: ADODB.Command object, already opened.
' Note: L. Tsao 06.22.2004 CR# 15591 - Caller is responsible
'		for closing DB connection when no longer needed and
'		setting the returned command object to Nothing.
Function GetCommand(strProcName, strConnOptions)
    Dim conn
    Dim cmd
    Dim strConnString
    Dim strSchema

    Set conn = Server.CreateObject("ADODB.Connection")
    Set cmd = Server.CreateObject("ADODB.Command")

    conn.Open ConnString & strConnOptions
    cmd.ActiveConnection = conn
    cmd.CommandType = adCmdStoredProc
    cmd.CommandText = SchemaName & "PMAWeb_Pkg." & strProcName

    Set GetCommand = cmd
End Function

' Returns a command object ready to have its parameters added.
' Input: strPackage - name of package
'        strProcName - name of stored procedure to run.
'        strConnOptions -
' Returns: ADODB.Command object, already opened.
' Note: L. Tsao 06.22.2004 CR# 15591 - Caller is responsible
'		for closing DB connection when no longer needed and
'		setting the returned command object to Nothing.
Function GetStoredProc(strPackage, strProcName, strConnOptions)
	Dim conn
    Dim cmd

    Set conn = Server.CreateObject("ADODB.Connection")
    Set cmd = Server.CreateObject("ADODB.Command")

    conn.Open ConnString & strConnOptions
    cmd.ActiveConnection = conn
    cmd.CommandType = adCmdStoredProc
    cmd.CommandText = SchemaName & strPackage & "." & strProcName

    Set GetStoredProc = cmd
End Function

' Runs a stored procedure and returns its recordset return value.
Function RunSPReturnRS(ByRef cmd)
    Dim rs
    Set rs = Server.CreateObject("ADODB.Recordset")

    ' Execute the query for readonly
    rs.CursorLocation = adUseClient

    rs.Open cmd, , adOpenForwardOnly, adLockReadOnly

	' L. Tsao 06.22.2004 CR# 15591 - Caller should dispose of command
    '  								 object.  Do not do this here.
    '								 Recordset must remain connected.
    ' Disconnect the recordset
    'Set cmd.ActiveConnection = Nothing
    'Set cmd = Nothing

    ' We can't disconnect the recordset in ChiliSoft! ASP for some reason - it produces an error.
    ' Set rs.ActiveConnection = Nothing

    ' Return the resultant recordset
    Set RunSPReturnRS = rs
End Function

' Runs a stored procedure and returns its integer return value.
Function RunSPReturnInt(cmd)
    Dim param

    Set param = cmd.CreateParameter("output", adNumeric, adParamOutput, 4)
    cmd.Parameters.Append param

    cmd.Execute
    RunSPReturnInt = CInt(param.value)
    Set param = Nothing

	' L. Tsao 06.22.2004 CR# 15591 - Caller should dispose of command
    '  								 object.  Do not do this here.
    ' Disconnect the command
    'Set cmd.ActiveConnection = Nothing
    'Set cmd = Nothing
End Function

' Runs a stored procedure and returns its character return value.
Function RunSPReturnVarchar(cmd, length)
    Dim param

    Set param = cmd.CreateParameter("output", adVarChar, adParamOutput, length)
    cmd.Parameters.Append param
    cmd.Execute
    RunSPReturnVarchar = CStr(param.value)
    Set param = Nothing

	' L. Tsao 06.22.2004 CR# 15591 - Caller should dispose of command
    '  								 object.  Do not do this here.
     ' Disconnect the command
    'Set cmd.ActiveConnection = Nothing
    'Set cmd = Nothing
End Function

'***********************************************************************
' Name:     ProperCase
' Author:   L. Tsao
' Date:     06.22.2004
' Purpose:  Converts the given string to proper case.
' Input:    strParam - string to be converted
' Output:	a copy of the string formatted to proper case
' Notes:	CR# 9235
'***********************************************************************
Function ProperCase(strParam)

	Dim strIn, strSpace, strFwdSlash, strHyphen, strDelim, strTemp
	Dim lTemp
	Dim sTemp
	Dim intParseChar, intWordIter, intNumDelims

	strIn = LCase(strParam)
	strSpace = " "
	strFwdSlash = "/"
	strHyphen = "-"
	intNumDelims = 3	'number of delimiters we process

	If Len(strIn) Then
		'change string to proper case
		intParseChar = 1
		For intParseChar = 1 to intNumDelims
			Select Case intParseChar
				Case 1
					strDelim = strSpace
				Case 2
					strDelim = strFwdSlash
				Case intNumDelims
					strDelim = strHyphen
			End Select

			sTemp = Split(strIn, strDelim)
			lTemp = UBound(sTemp)

			For intWordIter = 0 To lTemp
				strTemp = strTemp & UCase(Left(sTemp(intWordIter), 1)) & Mid(sTemp(intWordIter), 2) & strDelim
			Next

			'set for next iteration
			strIn = strTemp
			strTemp = ""
		Next

		'trim extra delimiters from end
		strIn = Left(strIn, (Len(strIn)-intNumDelims))
	End If

	ProperCase = strIn

End Function

' This implements the StrConv function from Visual Basic.
' Right now only vbProperCase is implemented, because that's
' all I need right now.
Function StrConv(strIn, format)
    if format <> vbProperCase then
    	Response.write "Unknown format"
    	Response.End
    end if

    dim SpacePos
    dim strOut

    SpacePos = InStr(1, strIn, " ")
    Do While SpacePos <> 0
    	' Move the next word into the out string, and remove it from the in string.
    	strOut = strOut & UCase(Left(strIn, 1)) & LCase(Mid(strIn, 2, SpacePos - 1)) & " "
    	' Response.write "strOut is: " & strOut & "<BR>" & vbcrlf
    	strIn = Right(strIn, Len(strIn) - SpacePos)
    	SpacePos = InStr(1, strIn, " ")
    Loop

    ' Copy the last part of the string
    strOut = strOut & UCase(Left(strIn, 1)) & LCase(Mid(strIn, 2, Len(strIn) - 1))
    StrConv = strOut
End Function

Function Nz(varIn)
    If IsNull(varIn) Then
    	Nz = vbNullString
    Else
    	Nz = varIn
    End If
End Function

' Displays an error message and ends the web page
Function ShowError(strMsg)
    Response.write strMsg
    Response.write "</body></html>" & vbcrlf
    Response.End
End Function
%>