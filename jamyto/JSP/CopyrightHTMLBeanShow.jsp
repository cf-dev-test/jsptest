<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="copyright" class="atmarkit.CopyrightHTMLBean" />
<jsp:setProperty name="copyright" property="year" value="2001" />
<jsp:setProperty name="copyright" property="mail" value="taro@java.server.pages" />
<jsp:setProperty name="copyright" property="name" value="JSP 太郎" />
<%
// オリジナルBeanを使用する
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>オリジナルBeanを使用する</title>
</head>
<body>
<p>-- オリジナルBeanを使用する --</p>
<p>
<hr>
標準的な著作権表示<br>
<jsp:getProperty name="copyright" property="normalHTML" />
<hr>
短い著作権表示<br>
<jsp:getProperty name="copyright" property="shortHTML" />
<hr>
</p>
</body>
</html>