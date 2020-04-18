<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8"/>
<title>誕生月の送信結果</title>
</head>
<body>

<%
  // これをつけないと文字化けする
  request.setCharacterEncoding("utf-8");

    // Urlのパラメータの場合も同じようにして受け取れる
  String strAns = request.getParameter("birthMonth");
  out.println("誕生月は" + strAns + "月ですね");
  %>
  <BR>
  <%
  // Urlのパラメータの場合も同じようにして受け取れる
String strRem =  request.getParameter("remark");
out.println(strRem);
%>


</body>
</html>