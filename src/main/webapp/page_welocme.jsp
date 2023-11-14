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
.top {
	background-color: rgb(51, 51, 51);
	width: 100%;
	height: 100px;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.left {
	margin-left: 100px;
	margin-top: 30px;
}

.left a {
	color: aquamarine;
	text-decoration: none;
	font-size: 30px;
}

.right {
	margin-right: 100px;
	margin-top: 35px;
	font-size: 18px;
}

.right a {
	color: white;
	text-decoration: none;
	margin-right: 20px;
}

.right a:hover {
	color: beige;
}

.text {
	height: 800px;
	width: 100%;
	background: beige fixed;
}

.news {
	margin-left: 70px;
	padding: 12px;
}

.news p {
	font-size: 20px;
}

.news p a {
	text-decoration: none;
	color: whitesmoke;
}

.news p a:hover {
	text-decoration: underline;
	color: black;
}
</style>
</head>
<body>
	<div class="top">
		<div class="left">
			<a href="">新闻发布系统</a>
		</div>
		<div class="right">
			<a href="/05_04_fuyuntian/category?category=国内">国内</a> <a
				href="/05_04_fuyuntian/category?category=国际">国际</a> <a
				href="/05_04_fuyuntian/category?category=经济">经济</a> <a
				href="/05_04_fuyuntian/category?category=娱乐">娱乐</a> <a
				href="/05_04_fuyuntian/category?category=体育">体育</a> <a
				href="/05_04_fuyuntian/category?category=科技">科技</a> <a
				href="/05_04_fuyuntian/category?category=生活">生活</a> <a
				href="/05_04_fuyuntian/category?category=军事">军事</a>
		</div>
	</div>
	<div>
		<form action="/05_04_fuyuntian/inquirenews" method="post">
			<input type="text" name="newstitle" placeholder="输入标题关键字"> <input
				type="submit" value="查询">
		</form>
	</div>
	<div class="text">
		<div class="news">
			<c:forEach items="${news_list}" begin="0" var="news" varStatus="row"
				end="5">
				<div style="float: left">
					<img width=30px height=30px src="${news.cover_url }">
				</div>>
			<div>
					<a href="newsDetail?title=${news.title}">${news.title }</a>
				</div>
				<div style="float: right">
					<span> ${news.create_time }</span>
				</div>
				<br>
			</c:forEach>
		</div>

		<c:forEach begin="1" end="${pageNum }" var="pageIndex">
			<a href="pageServlet?currpage=${pageIndex }&pagesiaze=6"
				target="_main" id="a1">${pageIndex }</a>
		</c:forEach>
	</div>



</body>
<script>
	var x = document.getElementById("a1"); 
	x.onclick = f;
	function f(){
	var p = x.innerText;
	if( p == 1){
		x.href="pageServlet?currpage=one&pagesiaze=6"
	}
}
</script>
</html>