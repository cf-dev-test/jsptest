<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*"%>
<% 
    String id = request.getParameter("id");
    String name="";
    String password="";
    int flgNonExist =0;
    String lblid="";
    String capbtn="";
    String valmode="";
    if (id==null){
        lblid="新規";
        capbtn="登録";
        valmode="1";
    } else {
        lblid=id;
        capbtn="更新";
        valmode="2";
        Class.forName("com.mysql.cj.jdbc.Driver");
        String strConn="jdbc:mysql://localhost/bbs?serverTimezone=JST";
        Connection conn=DriverManager.getConnection(strConn, "BBS_USER", "BBS_USER");
        Statement stmt=conn.createStatement();
        String strSql ="SELECT * FROM user Where id =" + id;
        ResultSet rs=stmt.executeQuery(strSql);

        if(rs.next()){
            name=rs.getString("user_name");
            password=rs.getString("password");
        } else {
            flgNonExist=1;
        }
        rs.close();
        stmt.close();
        conn.close();
    }



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
        <% if(flgNonExist==0){ %>
            <form action="UpdateUserData.jsp" method="post">
                <input hidden id="mode" name="mode" value="<%=valmode %>" />
                <div class="form-group">
                    <label for="id">id</label>
                    <input type="text" disabled id="id" name="id" class="form-control" value="<%=lblid %>"/>
                </div>
                <div class="form-group">
                    <label for="name">name</label>
                    <input type="text" id="name" name="name" class="form-control" value="<%=name %>"/>
                </div>
                <div class="form-group">
                    <label for="password">password</label>
                    <input type="text" id="password" name="password" class="form-control" value="<%=password %>"/>
                </div>
                <input type="submit" class="btn btn-primary" value="<%=capbtn %>">
                <button type="button" class="btn btn-default" onclick="history.back()">戻る</button>
            </form>
        <%} else { %>
            IDが存在しません。
            <button type="button" class="btn btn-default" onclick="history.back()">戻る</button>
        <%} %>

    </body>
</HTML>