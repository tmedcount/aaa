<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>휴먼호텔: 회원가입</title>
	<!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
      rel="stylesheet"
    />
	<!-- icon -->
    <script
      src="https://kit.fontawesome.com/276cd09ce8.js"
      crossorigin="anonymous"
    ></script>
	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
	
</head>
<style>
	* {
      box-sizing: border-box;
    }
    body {
      font-family: "Open Sans", sans-serif;
      margin: 0px;
      cursor: default;
    }
    .navbar_logo > a {
      text-decoration: none;
      color: whitesmoke;
    }
    ul {
      list-style: none;
      padding-left: 0px;
    }
    #navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #A47449;
      color: whitesmoke;
      padding: 16px;
    }
    .navbar_menu {
      display: flex;
    }
    .navbar_logo {
      font-size: 28px;
      font-weight: 600;
    }
    .navbar_menu_item {
      padding: 8px 12px;
      margin: 0px 4px;
    }
	
    #frmSignin {
    	padding: 20px 20px;
    	color: whitesmoke;
    	background-color: #4E3524;
    }
    input {
    	margin: 0px 0px 15px 5px;
    }
    .btnNewbie {
    	margin: 0px 0px 0px 80px;
    }
    input[name=passcode2] {
    	margin-bottom: 20px;
    }


</style>
<body>
	<!-- Navbar -->
    <nav id="navbar">
      <div class="navbar_logo">
        <i class="fas fa-hotel"></i>
        <a href="/app">HumanHotel</a>
      </div>
      <div class="navbar_menu">
        <ul class="navbar_menu">
          <li class="navbar_menu_item">회원가입</li>
        </ul>
      </div>
    </nav>
	
	<!-- Newbie -->
    <form
      method="POST"
      action="/app/signin"
      id="frmSignin"
      accept-charset="utf-8"
    >
      이름: <input type="text" name="realname" /><br />
      로그인 아이디: <input type="text" name="loginid" /><br />
      비밀번호: <input type="password" name="passcode1" /><br />
      비밀번호 확인: <input type="password" name="passcode2" /><br />
      <input class="btnNewbie" type="submit" value="회원가입" />
      <input type="button" value="취소" onclick="location.href='/app'">
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
	.on("submit", "#frmLogin", function () {
        let pstr = $.trim($("input[name=loginid]").val());
        $("input[name=loginid]").val(pstr);
        pstr = $.trim($("input[name=passcode]").val());
        $("input[name=passcode]").val(pstr);
        if ($("input[name=loginid]").val() == "") {
          alert("로그인 아이디를 입력하시오.");
          return false;
        }
        if ($("input[name=passcode]").val() == "") {
          alert("비밀번호를 입력하시오.");
          return false;
        }
        return true;
      })

</script>
</html>