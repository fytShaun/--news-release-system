package com.javaweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaBean.User;

@WebServlet("/DetailServlet")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DetailServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String username=(String) session.getAttribute("username");
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			out.println("驱动加载失败！原因是" + e.getMessage());
			e.printStackTrace();
			return;
		}
		// 2.链接数据库
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "513315");
			}
			catch(Exception e) {
				out.println("驱动加载失败，原因是："+e.getMessage());
				e.printStackTrace();
				return;
			}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");
            PreparedStatement pstmt = conn.prepareStatement("SELECT * from user where username=?");
            pstmt.setString(1, username);
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
            	request.getServletContext().setAttribute("d_userlist", list);
            	response.sendRedirect("detail.jsp");
        	conn.close();
		}catch(Exception e) {
			out.println("<br>数据库连接失败或者sql执行失败！原因："+e.getMessage());
			e.printStackTrace();
			return ;
		}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	    }
	}
