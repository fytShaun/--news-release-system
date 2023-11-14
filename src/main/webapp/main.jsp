<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.banner {
	border: 1px solid red;
	width: 100%;
	height: 80px;
}

.nav {
	float: left;
	border: 1px solid blue;
	width: 200px;
	height: 680px;
}

.ma {
	border: 1px solid green;
	width: 100%;
	height: 680px;
}
</style>
</head>
<body>
	<div class="banner">
		<%@include file="top.jsp"%>

	</div>

	<div class="nav">
		<%@ include file="nav.jsp"%>
	</div>

	<div class="ma">
		<%@ include file="d.jsp"%>
		<iframe src="welcome.jsp" width="80%" height="87%" name="_main"></iframe>


	</div>



</body>
</html>