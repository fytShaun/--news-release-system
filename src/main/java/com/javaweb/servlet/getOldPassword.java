package com.javaweb.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javaBean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

@WebServlet("/getOldPassword")
public class getOldPassword extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public getOldPassword() {
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
        String oldpassword = request.getParameter("old_password");
        String newpassword1 = request.getParameter("new_password1");
        String newpassword2 = request.getParameter("new_password2");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","513315");
        	PreparedStatement pstmt = conn.prepareStatement("select password from user where username=?");
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
			String password = rs.getString("password");
			if(password.equals(oldpassword)!= true) {
				session.setAttribute("s", "原密码输入错误");
				response.sendRedirect("changpassword.jsp");
			}
			else if(newpassword1.equals(newpassword2) != true) {
				session.setAttribute("s", "两次密码输入不一致");
				response.sendRedirect("changpassword.jsp");
			}
			else if(password.equals(oldpassword) && newpassword1.equals(newpassword2)) {
				session.setAttribute("newpassword", newpassword1);
				response.sendRedirect("changPassword");
			}	
		}
            	conn.close();
        } catch (Exception e) {
            out.println("未能正常登录");
            out.println("<a href=\"javascript: window.history.back()\">返回</a>");
            out.println(e.toString());
            out.flush();
            out.close();
            return;
        }
    }
}
