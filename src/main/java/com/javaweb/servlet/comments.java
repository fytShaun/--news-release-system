package com.javaweb.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import redis.clients.jedis.Jedis;
@WebServlet("/commentsServlet")
public class comments extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String comments = req.getParameter("comments");
		String id = (String) req.getSession().getAttribute("id");
		

		
		Jedis jedis = new Jedis("127.0.0.1", 6379);
		jedis.lpush(id,comments);
		List<String> list0 = jedis.lrange(id, 0 ,-1);
		
		String [] arr= {"诈骗","走私"};

		for(int i=0;i<list0.size();i++)
		{
			for(String c:arr) {
				String x = list0.get(i).replace(c, "***");
				list0.set(i, x);
			}
		}
		
     	
    	req.getSession().setAttribute("commentslist", list0);
		
		
		resp.sendRedirect("newsDetatil.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(req, resp);
	}
	
}
