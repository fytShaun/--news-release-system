<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javaBean.User"%>
<%@page isELIgnored="false"%>

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
				<th>身份</th>
				<th>用户名</th>
				<th>密码</th>
				<th>状态</th>
				<th>解禁</th>
				<th>禁用</th>
				<th>删除</th>
			</tr>
			<h3>${a}</h3>
			<script>
					var s = "${a}";
					if(s !== '' )
						alert(s);
				</script>
			<% request.getSession().setAttribute ("a","");%>
			<c:forEach items="${userList}" var="user" varStatus="row">
				<tr>
					<td>${row.index + 1 }</td>
					<td>${user.identity }</td>
					<td>${user.username }</td>
					<td>${user.password }</td>
					<td>${user.state    }</td>
					<td><a href="disable1?username=${user.username}"
						onclick='return confirm("确定解禁吗");'>解禁</a></td>
					<td><a href="disable?username=${user.username}"
						onclick='return confirm("确定禁用吗");'>禁用</a></td>
					<td><a href="DeleteServlet?username=${user.username}"
						onclick='return confirm("确定删除吗");'>删除</a></td>
				</tr>

			</c:forEach>
		</table>
	</div>
</body>
</html>