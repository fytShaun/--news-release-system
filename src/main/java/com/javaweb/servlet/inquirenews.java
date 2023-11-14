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

import javaBean.News;

@WebServlet("/inquirenews")
public class inquirenews extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
		String newstitle=request.getParameter("newstitle");
		System.out.println(newstitle);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		// 2.链接数据库
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "513315");
			}
			catch(Exception e) {
			
				e.printStackTrace();
				return;
			}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");
            Statement stmt = conn.createStatement();
            String sql = " SELECT * from news where title like '%"+ newstitle+"%' ";
            ResultSet rs2 = stmt.executeQuery(sql);
            	 List<News> list = new ArrayList<>();
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
                     System.out.println(news.getAuthor());
                 	list.add(news);
                 }
                HttpSession session = request.getSession()	;
            	session.setAttribute("userlistinquirenews", list);
            	response.sendRedirect("detailnews.jsp");
        	conn.close();
		}catch(Exception e) {
			
			e.printStackTrace();
			return ;
		}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			doGet(request, response);
	    }
	}
