<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javaBean.News"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- newsListCategory -->
<body>
	<div class="c" style="width: 100%; height: 60px">
		<h4>${Category}</h4>
	</div>
	<div class="main">
		<table>
			<tr>
				<th>封面</th>
				<th>标题</th>
				<th>作者</th>
				<th>类别</th>
				<th>发布时间</th>
			</tr>

			<c:forEach items="${userlistinquirenews}" var="news" varStatus="row">
				<tr>
					<td><img width=30px height=30px src="${news.cover_url }"></td>
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