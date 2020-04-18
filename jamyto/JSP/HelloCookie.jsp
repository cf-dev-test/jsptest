<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
 String email = "";
 String name = "";
 String email2 = "";
 String name2= "";

 // あってもなくても動く
 // request.setCharacterEncoding("utf-8");

 Cookie[] cks = request.getCookies();

 
 if(cks != null){
        for(int ck=0; ck<cks.length; ck++){
                if(cks[ck].getName().equals("email")){
                        email = URLDecoder.decode(cks[ck].getValue(),"utf-8");
                }
                else if(cks[ck].getName().equals("name")){
                        name =  URLDecoder.decode(cks[ck].getValue(),"utf-8");
                }
                else if(cks[ck].getName().equals("email2")){
                        email2=cks[ck].getValue();
                }
                else if(cks[ck].getName().equals("name2")){
                        name2=cks[ck].getValue();
                }
        }
 }
%>
 
<!DOCTYPE html>
<html>
        <head>
                <title>Hello Cookie</title>
        </head>
        <body>
                <form method="POST" action="HelloCookie2.jsp">
                        <ul>
                                <li>
                                        <label for="email">E-mail address:</label>
                                        <input type="text" name="email" size="40" value="<%=email %>" />
                                </li>
                                <li>
                                        <label for="name">Name:</label>
                                        <input type="text" name="name" size="40" value="<%=name %>" />
                                </li>
                                <li>
                                        <input id="button" type="submit" value="Send" />
                                </li>
                                <li>
                                        <%=email2 %>
                                </li>
                                <li>
                                        <%=name2 %>
                                </li>
                        </ul>
                </form>
        </body>
</html>