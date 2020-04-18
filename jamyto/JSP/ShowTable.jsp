<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE HTML PUBLIC 
<html>
<head>
<title>JSPサンプル</title>
<STYLE TYPE="text/css">
TABLE{
	border-collapse:collapse
}
TD {
	width:80px;
	text-align:center;
	border-style:solid;
	border-width:1px;
}
</STYLE>
</head>
<body>
	<%
	out.println(new java.util.Date());
	%>

<TABLE>
<% for(int i=1;i<=9;i++) { %>
	<TR>
		<% for(int j=1;j<=9;j++) { %>
			<TD><%=i*j%></TD>
		<% } %>
	</TR>
<% } %>
</TABLE>
</body>
</html>
