<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
div {
	text-align: center;
	padding: 150px;
}
</style>
</head>
<body>
	<div>
		<form id="fom">
			<input type="text" name="username" placeholder="用户名" id="username"><br>
			<span id="username_err" class="err_msg"
				style="display: none; color: red">用户名错误</span> <br> <input
				type="password" id="password" name="password" placeholder="密码"><br>
			<span id="password_err" style="display: none; color: red">密码格式错误</span>
			<br> <input type="submit" value="提交"> <br>
		</form>
	</div>

	<script>
	var usernameInPut = document.getElementById("username"); //获取输入框对象
	usernameInPut.onblur = checkusername;
		
		function checkusername(){//绑定失去焦点时间
		var username = usernameInPut.value;
		if(username.length>=6 && username.length<=12){
			document.getElementById("username_err").style.display = "none";
			return true;
		}
		else{
			document.getElementById("username_err").style.display = "";
			return false;
		}
	}
	var passwordInPut = document.getElementById("password"); //获取输入框
	passwordInPut.onblur = checkpassword;//绑定失去焦点时间 后要运行的函数
		
		function checkpassword(){
		var password = passwordInPut.value;
		if(password.length>=6 && password.length<=12){
			document.getElementById("password_err").style.display = "none";
			return true;
		}
		else{
			document.getElementById("password_err").style.display = "";
			return false;
		}
	}
	
	//获取表单对象
	var fom = document.getElementById("fom");
	fom.onsubmit = function(){
		var flag = checkusername()&&checkpassword();
		return flag;
	}
	
</script>

</body>
</html>