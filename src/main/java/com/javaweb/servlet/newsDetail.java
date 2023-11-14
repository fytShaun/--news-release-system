package com.javaweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
import redis.clients.jedis.Jedis;

@WebServlet("/newsDetail")
public class newsDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String title = request.getParameter("title");
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
			
			PreparedStatement pstmt = conn.prepareStatement("select * from news where title=?");
			pstmt.setString(1, title);

			ResultSet rs = pstmt.executeQuery();
			
			 
			
			while (rs.next()) {
				int count = rs.getInt("view_count")+1;
				
 				String id = Integer.toString(rs.getInt("news_id")) ;
 				
 				
 				Jedis jedis = new Jedis("127.0.0.1", 6379);

            	List<String> list0 = jedis.lrange(id, 0 ,-1);
     	
            	request.getSession().setAttribute("commentslist", list0);

 				
           
            	
 				
 				request.getSession().setAttribute("id", id);
 				
 				
				String sql = "UPDATE news SET view_count=? where title=?";
				
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, count);
				pstmt.setString(2, title);

				pstmt.executeUpdate();
				
				News news = new News(rs.getInt("news_id"),rs.getString("title"),rs.getString("author"), rs.getString("category"),
						rs.getString("cover_url"), rs.getString("content"),rs.getInt("view_count"),rs.getString("create_time"),
						rs.getString("updateTime")
						);
				session.setAttribute("news_photo",news.getCover_url() ) ;
				session.setAttribute("news", news);
			}
			
			response.sendRedirect("newsDetatil.jsp");
			conn.close();

		} catch (Exception e) {
			out.println("<br>数据库连接失败！或者SQL执行失败，原因是" + e.getMessage());
			e.printStackTrace();
			return;
		}
	}

	private int llen(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
