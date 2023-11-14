<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javaBean.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>
<style type="text/css">
div.main {
	margin: 20px;
	border: 1px solid red;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:not(:first-child):hover {
	background-color: coral;
}
</style>
</head>
<body>
	<div style="float: right; margin: 20px; paddin: 50px">
		<form action="/05_04_fuyuntian/inquire" method="post">
			<span></span> <input type="text" name="username"> <input
				type="submit" value="提交"> <br>
		</form>
	</div>


	<div class="main">


		<table>
			<tr>
				<th>序号</th>
				<th>用户名</th>
				<th>详情</th>
			</tr>
			<c:forEach items="${userList}" var="user" varStatus="row">
				<tr>
					<td>${row.index + 1 }</td>
					<td>${user.username }</td>
					<td><a href="DetailServlet?username=${user.username}">详情</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>