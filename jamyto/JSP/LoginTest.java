package servlet;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns={"/urlLogin"})
public class LoginTest extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public static void putLog(String data){
        try{
            BufferedWriter objBw=new BufferedWriter(
                new FileWriter("error.log",true),10);
              objBw.write(data);
              objBw.close();
    
    

        } catch(Exception e) {
            e.printStackTrace();
        }
    }


    public static String getValue(String data,String key){
        String[] lines = data.split("&");
        for (String line : lines){
            String[] parts = line.split("=");
            if (parts[0].trim().equals(key)){
                if (parts.length==1){
                    return "";
                } else {
                    return parts[1];
                }
                
            }
        }
        return "";
    }


    @Override
    public void doPost (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String result="";
        try {

            HttpSession session = req.getSession(false);
            if (session == null){
              session = req.getSession(true);
            }else{
            }
            BufferedReader reader = req.getReader();
            String line;
            try {
                
                line = reader.readLine();
                
            } finally {
                reader.close();
            }

            LoginTest.putLog(line);
            //パラメータ取得
            String name= LoginTest.getValue(line, "name");
            String password = LoginTest.getValue(line, "password");
            String id ="";
            String msg ="";

            Class.forName("com.mysql.cj.jdbc.Driver");
            String strConn="jdbc:mysql://localhost/bbs?serverTimezone=JST";
            Connection conn=DriverManager.getConnection(strConn, "BBS_USER", "BBS_USER");
            PreparedStatement pstmt=null;
            String strSql ="SELECT * FROM user Where user_name=?";
            pstmt=conn.prepareStatement(strSql);
            pstmt.setString(1,name);
            ResultSet rs=pstmt.executeQuery();
            if (rs.next()){
                if (password.equals(rs.getString("password"))){
                    id=String.valueOf(rs.getInt("id"));
                    session.setAttribute("id",id);
                    session.setAttribute("name",name);
                    msg="ログインしました";
                } else {


                    msg="パスワードが不正です";
                }
            } else {
                msg="名前が登録されていません";

            }

            //出力(レスポンスをmapに格納してJSON化)
            res.setContentType("text/html; charset=UTF-8");
            PrintWriter out = res.getWriter();
            out.println(msg);        
            out.close();

        } catch(Exception e) {
            PrintWriter out = res.getWriter();
            e.printStackTrace(out);      
            out.close();
        }

    }

}