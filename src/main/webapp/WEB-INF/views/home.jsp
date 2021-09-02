<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<form method=post action="/app/check_user">
	loginID: <input type=text name=loginid><br>
	password: <input type=password name=passcode><br><br>
	<input type=submit value=로그인>
	<input type=reset value=취소>
	<input type=button value=회원가입 onclick=location.href='newbie'>
</form>
</body>
</html>