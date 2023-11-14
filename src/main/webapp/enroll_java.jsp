<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javaBean.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>enroll</title>
<style>
input {
	margin: 0.4rem;
	border-radius: 20px;
	width: 150px;
	height: 20px;
}

input:focus {
	background-color: lightblue;
}

input:hover {
	width: 100px;
	background-color: orange;
}

label {
	font-family: 隶书;
	font-size: 1rem;
	padding-right: 10px;
}

select {
	font-size: 0.9rem;
	padding: 2px 5px;
}

.enroll {
	text-align: center;
	padding: 150px;
	background-image: url(zmbz.jpg);
}

button:link {
	color: red;
}

button:hover {
	color: aqua;
	background-color: blue;
}

button:cative {
	color: white;
	background-color: chartreuse;
}

textarea {
	padding: 10px;
	max-width: 100%;
	line-height: 1.5;
	border-radius: 5px;
	border: 1px solid #ccc;
	box-shadow: 1px 1px 1px #999;
}
</style>
</head>

<body>
	<div class="c" style="width: 100%; height: 60px">
		<h4>${de}</h4>
	</div>
	<div class="enroll">
		<form action="/05_04_fuyuntian/register" method="post">
			<label for="username">用户名</label> <input placeholder="用户名"
				type="text" required name="username" id="username"> <br>
			<label for="password">密码</label> <input placeholder="密码"
				type="password" required name="password" id="password"> <br>

			<label for="favor">爱好</label> <input type="text" name="favor"
				placeholder="爱好"> <br>
			<legend>性别</legend>
			<fieldset>
				<div>
					<input type="radio" id="男" name="gender" value="男" checked>
					<label for="huey">男</label>
				</div>
				<div>
					<input type="radio" id="女" name="gender" value="女"> <label
						for="dewey">女</label>
				</div>

			</fieldset>
			<br> <label for="简历">简历</label>
			<textarea name="简历" id="简历"></textarea>
			<br>
			<button type="submit">提交</button>
	</div>
	</form>
</body>

</html>