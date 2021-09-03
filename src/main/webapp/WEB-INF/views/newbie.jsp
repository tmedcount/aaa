<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<title>Join</title>
</head>
<body>
<form method=POST action="/app/signin" id=frmSignin accept-charset="utf-8">
	이름: <input type=text name=realname><br>
	로그인 아이디: <input type=text name=loginid><br>
	비밀번호: <input type=password name=passcode1><br>
	비밀번호 확인: <input type=password name=passcode2><br>
	<input type=submit value=회원가입>
</form>
</body>
<script>
$(document)
	.on('submit', '#frmSignin', function() {
 		if($("input[name=realname]").val()=="") {
			alert("이름을 입력하시오.");
			return false;
		}
		if($("input[name=userid]").val()=="") {
			alert("로그인 아이디를 입력하시오.");
			return false;
		}
		if($("input[name=passcode1]").val()=="") {
			alert("비밀번호를 입력하시오.")
			return false;
		}
		if($("input[name=passcode1]").val()!=$("input[name=passcode2]").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		return true;
	})
</script>
</html>