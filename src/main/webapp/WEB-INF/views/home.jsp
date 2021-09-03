<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<title>Home</title>
</head>
<body>
<form method=post action="/app/check_user" id=frmLogin>
	loginID: <input type=text name=loginid><br>
	password: <input type=password name=passcode><br><br>
	<input type=submit value=로그인>
	<input type=reset value=취소>
	<a href=newbie>회원가입</a>
</form>
</body>
<script>
$(document)
	.on("submit", "#frmLogin", function() {
		let pstr = $.trim($("input[name=loginid]").val());
		$("input[name=loginid]").val(pstr);
		pstr = $.trim($("input[name=passcode]").val());
		$("input[name=passcode]").val(pstr);
		if($("input[name=loginid]").val()=="") {
			alert("로그인 아이디를 입력하시오.");
			return false;
		}
		if($("input[name=passcode]").val()=="") {
			alert("비밀번호를 입력하시오.");
			return false;
		}
		return true;
	})
</script>
</html>