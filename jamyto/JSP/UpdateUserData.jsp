<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*"%>
<% 
    String mode= request.getParameter("mode");
    String id= request.getParameter("id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");

    Class.forName("com.mysql.cj.jdbc.Driver");
    String strConn="jdbc:mysql://localhost/bbs?serverTimezone=JST";
    Connection conn=DriverManager.getConnection(strConn, "BBS_USER", "BBS_USER");
    PreparedStatement pstmt=null;

    String strSql ="";
    int rtn=0;
    String result ="";
    switch (mode) {
        case "1":
            // 追加
            strSql ="INSERT INTO user SET user_name= ? ,password = ?";
            pstmt=conn.prepareStatement(strSql);
            pstmt.setString(1,name);
            pstmt.setString(2,password);
            rtn=pstmt.executeUpdate();

            break;
        case "2":
            // 更新
            strSql ="UPDATE user SET user_name= ? ,password = ? WHERE id =?";
            pstmt=conn.prepareStatement(strSql);
            pstmt.setString(1,name);
            pstmt.setString(2,password);
            pstmt.setString(3,id);
            rtn=pstmt.executeUpdate();

            break;
        case "3":
            // 削除
            strSql ="DELETE FROM user Where id =?";
            pstmt=conn.prepareStatement(strSql);
            pstmt.setString(1,id);
            rtn=pstmt.executeUpdate();
            break;
    }
    pstmt.close();
    conn.close();
    if (rtn==1){
        result="登録完了";
    } else {
        result="登録失敗";
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
        <%=result %>
        <button type="button" class="btn btn-default" onclick="location.href='ShowUserList.jsp'">戻る</button>
    </body>
</HTML>