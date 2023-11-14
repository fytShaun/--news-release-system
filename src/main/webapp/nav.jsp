<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: auto 0;
	padding: 0;
	list-style: none;
}

div {
	background-color: rgb(241, 231, 224);
	width: 300px;
	height: 600px;
}

ul {
	font-size: 18px;
}

ul li {
	margin-top: 30px;
	width: 200px;
	height: 40px;
	line-height: 40px;
	background-color: whitesmoke;
}

ul li:hover {
	background: #ebabab;
}

ul li a {
	margin-left: 20px;
	text-decoration: none;
	color: rgb(29, 152, 235);
}

ul li a:hover {
	text-decoration: underline;
	color: black;
}
</style>
</head>

<body>
	<div>
		<ul>
			<li><a href="welcome.jsp" target="_main">新闻页面</a></li>
			<li><a href="view.jsp" target="_main">查看所有用户</a></li>
			<li><a href="manage.jsp" target="_main">用户管理</a></li>
			<li><a href="write.jsp" target="_main">写新闻</a></li>
			<li><a href="managewrite.jsp" target="_main">新闻管理</a></li>
			<li><a href="login.jsp" onclick='return confirm("确定退出吗吗");'>退出登录</a>
			</li>
		</ul>
	</div>
</body>
</html>