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
input textarea {
	boder: 0px;
	outline: none;
}
</style>
</head>

<body>
	<div class="write">
		<form action="/05_04_fuyuntian/write" method="post"
			enctype="multipart/form-data">
			<input placeholder="标题" type="text" required name="title" id="title">
			<br> <input type="file" name="cover"> <br> <select
				name="category" id=""category"">
				<option value="国际">国际</option>
				<option value="国内">国内</option>
				<option value="经济">经济</option>
				<option value="娱乐">娱乐</option>
				<option value="体育">体育</option>
				<option value="军事">军事</option>
				<option value="科技">科技</option>
				<option value="生活">生活</option>
			</select> <br>
			<hr>
			<br>
			<textarea rows="25" cols="80" name="content" id="content"></textarea>
			<br>
			<button type="submit">提交</button>
	</div>
	</form>
</body>

</html>