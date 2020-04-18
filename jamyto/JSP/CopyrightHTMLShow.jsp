<%@ page contentType="text/html; charset=UTF-8" import="atmarkit.CopyrightHTML" %>
<%
// オリジナルクラスを使用する
CopyrightHTML copyright = new CopyrightHTML();
copyright.year = "2001";
copyright.mail = "taro@java.server.pages";
copyright.name = "JSP 太郎";
 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>オリジナルクラスを使用する</title>
</head>
<body>
<p>-- オリジナルクラスを使用する --</p>
<p>
<hr>
標準的な著作権表示<br>
<%= copyright.getNormalHTML() %>
<hr>
短い著作権表示<br>
<%= copyright.getShortHTML() %>
<hr>
</p>
</body>
</html>