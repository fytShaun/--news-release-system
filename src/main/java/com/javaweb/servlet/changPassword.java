package com.javaweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaBean.User;

@WebServlet("/changPassword")
public class changPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession()	;
		String newpassword = (String) session.getAttribute("newpassword");
		String username = (String) session.getAttribute("username");
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			out.println("驱动加载失败！原因是" + e.getMessage());
			e.printStackTrace();
			return;
		}

		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");
			
			String sql = "UPDATE user SET password=? where username=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,newpassword);
			pstmt.setString(2, username);

			pstmt.executeUpdate();
			
			
			session.setAttribute("msp","密码修改成功，请重新登录");
			
			response.sendRedirect("login.jsp");
			conn.close();

		} catch (Exception e) {
			out.println("<br>数据库连接失败！或者SQL执行失败，原因是" + e.getMessage());
			e.printStackTrace();
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
