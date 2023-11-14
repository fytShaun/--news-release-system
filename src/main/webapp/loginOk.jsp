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
	<%-- 将注册用户全部显示出来 --%>
	<div class="main">
		<table>
			<tr>
				<th>序号</th>
				<th>用户名</th>
				<th>密码</th>
				<th>性别</th>
				<th>爱好</th>
				<th>删除</th>
				<th>详情</th>
			</tr>

			<c:forEach items="${userList}" var="user" varStatus="row">
				<tr>
					<td>${row.index + 1 }</td>
					<td>${user.username }</td>
					<td>${user.password }</td>
					<td>${user.sex }</td>
					<td>${user.favor }</td>
					<td><a href="DeleteServlet?username=${user.username }">删除</a></td>
					<td><a href="DetailServlet?username=${user.username }">详情</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>