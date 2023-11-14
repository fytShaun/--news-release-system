<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javaBean.News"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>列表</title>
<style>
* {
	margin: auto 0;
	padding: 0;
}

.all {
	margin-left: 40px;
	margin-top: 50px;
	background-color: beige;
}

.title-top {
	margin-left: 20px;
	margin-top: 30px;
	border-left: solid 8px red;
	font-size: 15px;
	font-family: 微软雅黑;
}

.title-top p {
	margin-left: 20px;
	opacity: 0.6;
}

.title {
	margin-left: 20px;
	margin-top: 30px;
	font-size: 30px;
}

.text {
	font-size: 20px;
	opacity: 0.8;
	text-indent: 5em;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="all">
		<img width=60px height=60px src="${news_photo }">
		<div class="title-top">
			<p>${news.category }</p>
		</div>
		<div class="title">
			<p>${news.title }</p>
		</div>
		<div class="title-top">
			<p>${news.create_time }</p>
		</div>
		<div class="text">
			<p>${news.content }</p>
		</div>
		<div class="title-top">
			<p>${news.author }</p>
		</div>
		<div class="title_count">
			<p>访客量: ${news.view_count}</p>
		</div>
	</div>
	<div calss="comments">
		<form action="commentsServlet" menthod="post">
			写评论
			<textarea name="comments" id="comments" placeholder="这篇新闻真不错"></textarea>
			<input type="submit" value="提交">
		</form>
	</div>
	<br>
	<br>

	<div>
		<ul>
			<c:forEach items="${commentslist}" var="comments" varStatus="row">

				<li>${comments }</li>

			</c:forEach>
		</ul>
	</div>
	<br>
	<a href="welcome.jsp">返回</a>
</body>
</html>