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

@WebServlet("/disable")
public class disable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String username = request.getParameter("username");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession()	;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			out.println("驱动加载失败！原因是" + e.getMessage());
			e.printStackTrace();
			return;
		}

		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");
			
			PreparedStatement pstmt = conn.prepareStatement("select identity from user where username=?");
			pstmt.setString(1, username);

			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				
				String identity = rs.getString("identity");
				if("manage".equals(identity)) {
					session.setAttribute("a", "管理员无法禁用");
					System.out.println(request.getAttribute("a"));	
                    response.sendRedirect("manage.jsp");
                    return ;
				}
			}
			
			String sql = "UPDATE user SET state='0' where username=?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, username);

			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("SELECT * from `javaweb`.`user`");
			
			ResultSet rsList = pstmt.executeQuery();
			
			List<User> list = new ArrayList<>();
			
			while (rsList.next()) {
				User user = new User(rsList.getString("identity"),rsList.getString("username"), rsList.getString("password"),
						rsList.getString("gender"), rsList.getString("favor"),rsList.getString("state"));
				list.add(user);
			}
			session.setAttribute("userList", list);
			
			
			session.setAttribute("state","已禁用");
			
			response.sendRedirect("manage.jsp");
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
