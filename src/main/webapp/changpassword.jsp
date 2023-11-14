<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	text-align: center;
	padding: 20px;
}
</style>
</head>
<body>
	<div class="c" style="width: 100%; height: 60px">
		<h4>${s}</h4>
	</div>
	<% request.getSession().setAttribute ("s","");%>
	<div class="s">
		<form action="/05_04_fuyuntian/getOldPassword" method="post">
			请输入旧密码<input type="password" name="old_password"> <br>
			请输入新密码<input type="password" name="new_password1"> <br>
			请确认新密码<input type="password" name="new_password2"> <br>
			<input type="submit" value="提交">
		</form>
	</div>
</body>
</html>