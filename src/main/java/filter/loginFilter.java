package filter;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javaBean.*;
//@WebFilter("/*")
public class loginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session  = req.getSession(); 
		String username = (String) session.getAttribute("username");
		String [] arr= {"login.jsp","zmbz.jpg","fail.jsp","enroll_java.jsp","loginResult","register","pageServlet","manage_manage.jsp","page_welocme.jsp"};
		
		String  url = req.getRequestURI().toString();
		
		for(String c: arr) {
			if(url.contains(c)) {
				chain.doFilter(request,response);
				return ;
			}
		}	
		if(username!=null) {
			chain.doFilter(request,response);
		}
		else {
			req.setAttribute("msp","先登录");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}
