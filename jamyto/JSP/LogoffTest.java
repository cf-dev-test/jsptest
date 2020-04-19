package servlet;

import java.io.IOException;
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

@WebServlet(urlPatterns={"/urlLogoff"})
public class LogoffTest extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doPost (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
            HttpSession session = req.getSession(false);
            if (session == null){
                session = req.getSession(true);
            }else{
            }
            session.invalidate();
    }

}