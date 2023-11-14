package com.javaweb.servlet;

	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;
	import java.io.IOException;
	import java.io.PrintWriter;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.text.Format;
	import java.text.SimpleDateFormat;

	@WebServlet("/register")
	public class enrollResult extends HttpServlet{
	    private static final long serialVersionUID = 1L;

	    public enrollResult() {
	        super();
	    }
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        doPost(request, response);
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.setCharacterEncoding("utf-8");

	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html; charset=utf-8");

	        PrintWriter out = response.getWriter();

	        HttpSession session = request.getSession();

	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String favor = request.getParameter("favor");
	        String description = request.getParameter("description");
	        String gender = request.getParameter("gender");

//	        Format fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	        String strNow = fmt.format(new java.util.Date());
	        try {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");

	            PreparedStatement pstmt = conn.prepareStatement("select username from `javaweb`.`user` where username=?");
	            pstmt.setString(1, username);
	        
	            ResultSet rs = pstmt.executeQuery();
	            if(rs.next()) {
	            	session.setAttribute("de", "用户名已存在");
	            	response.sendRedirect("enroll_java.jsp");
	            }

	            if (!rs.next()) {
	                pstmt = conn.prepareStatement("insert into `javaweb`.`user`(password,description,identity,gender,username) values(?,?,?,?,?)");
	                pstmt.setString(1, password);
	                pstmt.setString(2, description);
	                pstmt.setString(3, "user");
	                pstmt.setString(4, gender);
	                pstmt.setString(5, username);
	                pstmt.executeUpdate();
	                response.sendRedirect("login.jsp");
	            }
	            conn.close();
	        } catch (Exception e) {
	        	out.println("很遗憾，注册失败！<br/>");
	            out.println("<a href=\"javascript: window.history.back()\">返回</a><br>");
	            out.println(e.toString());
	            out.flush();
	        }
	    }
}
