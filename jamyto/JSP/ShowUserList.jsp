<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*"%>
<% 
    Class.forName("com.mysql.cj.jdbc.Driver");
    String strConn="jdbc:mysql://localhost/bbs?serverTimezone=JST";
    Connection conn=DriverManager.getConnection(strConn, "BBS_USER", "BBS_USER");
    Statement stmt=conn.createStatement();
    String strSql ="SELECT * FROM user";
    ResultSet rs=stmt.executeQuery(strSql);
%>
<HTML>
    <HEAD>
        <meta charset="UTF-8"/>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    </HEAD>
    <body>
        <div class="container">
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-success" onclick="location.href='./ShowUserEdit.jsp'">新規登録</button>
                <button type="button" class="btn btn-default" onclick="history.back()">削除</button>
            </div>
            <% while(rs.next()){ %>
        
                <!-- Panel部分-->
                <div class="panel panel-default">
                    <div class="panel-heading"><%=rs.getString("user_name") %></div>
                    <div class="panel-body">id:<%=rs.getInt("id") %><BR/>
                    パスワード:<%=rs.getString("password") %><BR/>
                    priv:<%=rs.getInt("priv") %></div>
                    <div class="panel-footer">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-default" onclick="location.href='./ShowUserEdit.jsp?id=<%=rs.getInt("id") %>'">編集</button>
                            <button type="button" class="btn btn-danger" onclick="location.href='./UpdateUserData.jsp?id=<%=rs.getInt("id") %>&mode=3'">削除</button>
                        </div>
                    </div>
                </div>
            <%} 
            rs.close();
            stmt.close();
            conn.close();
            %>

            </div>
    


    </body>
</HTML>