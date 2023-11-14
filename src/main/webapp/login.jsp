<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
.s {
	text-align: center;
	padding: 20px;
}

.c {
	text-align: center;
	font-color: red;
}
</style>
</head>
<body>
	<div class="c" style="width: 100%; height: 60px">
		<h4>${msp}</h4>
	</div>
	<% request.getSession().setAttribute ("msp","");%>
	<div class="s">
		<form action="/05_04_fuyuntian/pageServlet" method="post">
			<input type="text" name="username" placeholder="用户名"> <br>
			<input type="password" name="password" placeholder="密码"> <br>
			<select name="identity" id=""identity"">
				<option value="user">用户</option>
				<option value="manage">管理员</option>
			</select> <br> <input type="submit" value="提交"> <a
				href="enroll_java.jsp">注册</a> <br>
		</form>
	</div>
</body>
</html>