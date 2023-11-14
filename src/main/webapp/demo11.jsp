<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javaBean.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>

</head>
<body>
	<div class="main">
		<table>
			<tr>
				<th>用户名</th>
				<th>密码</th>
				<th>性别</th>
				<th>爱好</th>
			</tr>

			<c:forEach items="${userlist}" var="user" varStatus="row">
				<tr>
					<td>${user.username }</td>
					<td>${user.password }</td>
					<td>${user.gender }</td>
					<td>${user.favor }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<a href="welcome.jsp">返回</a>
</body>
</html>