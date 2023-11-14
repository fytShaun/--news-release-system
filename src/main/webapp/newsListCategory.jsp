<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javaBean.News"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
tr {
	margin-left: 20px;
}

tr th {
	font-size: 20px;
	color: black;
	margin-left: 20px;
}

.main {
	background: rgb(241, 231, 224);
}
</style>
</head>
<!-- newsListCategory -->
<body>
	<div class="c" style="width: 100%; height: 60px">
		<h4>${Category}</h4>
	</div>
	<div class="main">
		<table>
			<tr>
				<th>标题</th>
				<th>作者</th>
				<th>类别</th>
				<th>发布时间</th>
			</tr>

			<c:forEach items="${newsListCategory}" var="news" varStatus="row">
				<tr>
					<td><a href="newsDetail?title=${news.title}">${news.title }</a>
					</td>
					<td>${news.author }</td>
					<td>${news.category }</td>
					<td>${news.create_time }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<a href="welcome.jsp">返回</a>
</body>
</html>