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

import javaBean.News;
import javaBean.User;

@WebServlet("/DeleteNews")
public class DeleteNews extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String news_id = request.getParameter("news_id");
		PrintWriter out = response.getWriter();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			out.println("驱动加载失败！原因是" + e.getMessage());
			e.printStackTrace();
			return;
		}

		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");
			System.out.println("<br><br>数据库连接成功！<br>");

			String sql = "delete from news where news_id=?";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, news_id);

			pstmt.executeUpdate();
			
			
			pstmt = conn.prepareStatement("SELECT * from `javaweb`.`news`");
			
			ResultSet rs2 = pstmt.executeQuery();
			
			List<News> list = new ArrayList<>();
			
			while (rs2.next()) {
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
	            	list.add(news);
			}
			HttpSession session = request.getSession();
			session.setAttribute("newsList", list);

			response.sendRedirect("managewrite.jsp");
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
