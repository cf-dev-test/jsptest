<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
        <head>
                <title>Hello Cookie</title>
        </head>
        <body>
                <%
                
                request.setCharacterEncoding("utf-8");
                
                Cookie ck1 = new Cookie("email", URLEncoder.encode(request.getParameter("email"),"utf-8"));
                Cookie ck2 = new Cookie("name", URLEncoder.encode(request.getParameter("name"),"utf-8"));
                ck1.setMaxAge(60*60*24*180);
                ck2.setMaxAge(60*60*24*180);
                
                Cookie ck1_2 = new Cookie("email2",request.getParameter("email"));
                Cookie ck2_2 = new Cookie("name2", request.getParameter("name"));
                ck1_2.setMaxAge(60*60*24*180);
                ck2_2.setMaxAge(60*60*24*180);

                try{
                        response.addCookie(ck1);
                        response.addCookie(ck2);
                        response.addCookie(ck1_2);
                        response.addCookie(ck2_2);
                }catch(IllegalArgumentException e){
                        out.print(" : Some information was not saved to Cookie because illegal character such as ',' was used"+"</br>");
                        out.print("Please use characters which are in ASCII");
                        e.printStackTrace();
                }
                %>
                Cookie is saved
        </body>
</html>