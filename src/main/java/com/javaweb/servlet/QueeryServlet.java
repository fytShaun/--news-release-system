package com.javaweb.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javaBean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

@WebServlet("/QueeryServlet")
public class QueeryServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public QueeryServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)throws ServletException,IOException {
        doPost(request,response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)throws ServletException,IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");
            PreparedStatement pstmt = conn.prepareStatement("SELECT * from user");
            	ResultSet rsList = pstmt.executeQuery();
            	List<User> list = new ArrayList<>();
            	while(rsList.next()){
            		User user = new User(
            				rsList.getString("identity"),
            				rsList.getString("username"),
            				rsList.getString("password"),
            				rsList.getString("gender"),
            				rsList.getString("favor"),
            				rsList.getString("state")
            			);
            		list.add(user);
            	}
            	//request.getServletContext().setAttribute("userList", list); 
            	session.setAttribute("userList", list);
            	response.sendRedirect("loginOk.jsp");
            	conn.close();
        } catch (Exception e) {
            out.println("未能正常登录");
            out.println("<a href=\"javascript: window.history.back()\">返回</a>");
            out.println(e.toString());
            out.flush();
            out.close();
            return;
        }
    }
}
