package com.javaweb.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaBean.Jdbc;
import javaBean.News;
import javaBean.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javaBean.News;
@WebServlet("/loginResult")
public class loginResult extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public loginResult() {
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
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        String identity = "";
        String identity2 = (String) session.getAttribute("identity");
        String state ="";

        
        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");
        	PreparedStatement pstmt = conn.prepareStatement("SELECT state from user where username=?");
        	pstmt.setString(1, username);
        	ResultSet rs1 = pstmt.executeQuery();
        	if(rs1.next()) {
        		state = rs1.getString("state");
        		if("0".equals(state)) {
        			session.setAttribute("msp", "此账户已经被禁用，无法登录");
                    response.sendRedirect("login.jsp");
        		}
        	}
        	pstmt = conn.prepareStatement("SELECT username from user where username=? and password=?");
        	pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
            	pstmt = conn.prepareStatement("SELECT * from user where username=?");
            	pstmt.setString(1, username);
            	ResultSet rsList1 = pstmt.executeQuery();
            	if(rsList1.next()) {
            		identity = rsList1.getString("identity");
            	}
            	pstmt = conn.prepareStatement("SELECT * from user");
            	ResultSet rsList = pstmt.executeQuery();
            	List<User> list = new ArrayList<>();
            	List<News> list1 = new ArrayList<>();
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
            	pstmt = conn.prepareStatement("SELECT * from news");
            	ResultSet rs2 = pstmt.executeQuery();
            	while(rs2.next()){
                	News news = new News(
                			rs2.getInt("news_id"),
                			rs2.getString("title"),
                			rs2.getString("author"),
                			rs2.getString("category"),
                			rs2.getString("cover_url"),
                			rs2.getString("content"),
                			rs2.getInt("view_count"),
                			rs2.getString("create_time"),
                			rs2.getString("updateTime")
            			);
            		list1.add(news);
            	}
            	
            	session.setAttribute("newsList", list1);
            	
            	session.setAttribute("userList", list);
            	
            	
            	if(identity.equals(identity2)) {
            		if(identity.equals("manage")) {
            		session.setAttribute("identity", "管理员");
            		response.sendRedirect("main.jsp");
            		}
            	else {
            		session.setAttribute("identity", "用户");
            		response.sendRedirect("main2.jsp");}
            	}
            	else {
            		session.setAttribute("msp", "身份不符合，请重新选择");
                    response.sendRedirect("login.jsp");

            	}
            		
            }else {
            	session.setAttribute("msp", "账号密码错误");
                response.sendRedirect("login.jsp");
            }
            conn.close();
        } catch (Exception e) {
            out.println("未能正常登录");
            out.println("<a href=\"javascript: window.history.back()\">返回</a>");
            out.println(e.toString());
            out.flush();
            out.close();
        }
    }
}
