<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a
			href="DetailServlet?username=<%request.getSession().getAttribute("username");%>"
			target="_main">查看个人信息</a></li>
		<li><a href="welcome.jsp" target="_main">新闻页面</a></li>
		<li><a href="write.jsp" target="_main">写新闻</a></li>
		<li><a href="changpassword.jsp">修改密码</a></li>
		<li><a href="login.jsp" onclick='return confirm("确定退出吗");'>退出登录</a>
		</li>
	</ul>

</body>
</html>