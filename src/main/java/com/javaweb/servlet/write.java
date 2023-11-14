package com.javaweb.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import javaBean.News;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/write")
@MultipartConfig
public class write extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
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
        String title = request.getParameter("title");
        String x = request.getParameter("content");
        String author = (String) session.getAttribute("username");
        String category = request.getParameter("category");
        System.out.println("usernae"+" "+author);
        
        String content="";
        
        String [] arr= {"诈骗","走私"};
		for(String c: arr) {
			content=x.replace(c, "****");
			x=content;
			}
			
      
        
        Part cover = request.getPart("cover");
        String savePath =  request.getServletContext().getRealPath("/upload");//从根目录开始的绝对路径
        //创建目录树，保证文件上传时，文件夹先存在。
        new File(savePath).mkdirs();
        String filename = cover.getSubmittedFileName();
        cover.write(savePath+"/"+filename);
      
        String dbUrl =  "upload" +"/"+ filename;
        
        System.out.println(dbUrl);
        System.out.println(savePath);


        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");
        	PreparedStatement pstmt = conn.prepareStatement("insert into `javaweb`.`news`(title,author,category,content,cover_url) values(?,?,?,?,?)");
        	pstmt.setString(1, title);
        	pstmt.setString(2, author);
        	pstmt.setString(3, category);
        	pstmt.setString(4, content);
        	pstmt.setString(5, dbUrl);
        	pstmt.executeUpdate();
            
        	pstmt = conn.prepareStatement("SELECT * from news");
            ResultSet rs2 = pstmt.executeQuery();
            List<News> list1 = new ArrayList<>();
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
        	response.sendRedirect("su.jsp");
        	
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
