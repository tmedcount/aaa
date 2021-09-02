<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
<form action="/app">
	이름: <input type=text name=realname><br>
	로그인 아이디: <input type=text name=loginid><br>
	비밀번호: <input type=password name=passcode1><br>
	비밀번호 확인: <input type=password name=passcode2><br>
	모바일: <input type=text name=mobile><br><br>
	<input type=submit value=회원가입>
	<input type=button value=취소 onclick=location.href='/app'>
</form>
</body>
</html>