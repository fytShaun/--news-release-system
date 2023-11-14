package com.javaweb.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaBean.News;
@WebServlet("/pageServlet")
public class pageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currPage = request.getParameter("currpage");
		String pageSize = request.getParameter("pagesiaze");
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        String identity = request.getParameter("identity");
        String manage = request.getParameter("manage");
        if("one".equals(currPage)) {
        	response.sendRedirect("welcome.jsp");
        	return ;
        }
        
        if("two".equals(currPage)) {
        	response.sendRedirect("manage_manage.jsp");
        	return ;
        }

        HttpSession session = request.getSession();
        
        session.setAttribute("username",username);
        session.setAttribute("password",password);
        session.setAttribute("identity",identity);
       	
        
        
		int currpage= 1;
		int pagesize= 6;  // 5
		if(currPage!=null&&currPage!="") {
		currpage= Integer.parseInt(currPage);
		pagesize= Integer.parseInt(pageSize);  // 5
		}
    

		int row=0;
		
		List<News> list = new ArrayList<>();
        

		try{

		Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");
    	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM news");
    	ResultSet rs = pstmt.executeQuery();
    	while(rs.next()) {
    		row++;
    	}

 
		int pageNum=(int)Math.ceil(row*1.0/pagesize);
		
		pstmt = conn.prepareStatement("SELECT * FROM news limit ?,?");
		pstmt.setInt(1, (currpage-1)*pagesize);
		pstmt.setInt(2, pagesize);
    	rs = pstmt.executeQuery();
		while(rs.next()) {
			News news = new News(rs.getInt("news_id"),
			rs.getString("title"),
			rs.getString("author"),
			rs.getString("category"),
			rs.getString("cover_url"),
			rs.getString("content"),
			rs.getInt("view_count"),
			rs.getString("create_time"),
			rs.getString("updateTime")
			);
			list.add(news);
		}



		request.getSession().setAttribute("news_list", list);
		request.getSession().setAttribute("pageNum", pageNum);
		request.getSession().setAttribute("currpage", currpage);
		request.getSession().setAttribute("pagesize", pagesize);
		
		if("1".equals(manage)) {
			response.sendRedirect("manage_manage.jsp");
		}
		
		if(currpage==1) {
			response.sendRedirect("loginResult");
		}
		else {
			response.sendRedirect("page_welocme.jsp");
		}

		
	} catch (Exception e) {
		
		}	
	}

	private ServletRequest session() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}

	
}
