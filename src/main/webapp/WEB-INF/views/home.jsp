<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>휴먼호텔: 환영합니다!</title>
    <meta
      name="description"
      content="Personal project of HumanEducationCenter"
    />
    <meta name="author" content="KangHoSung" />
    <!-- icon -->
    <script
      src="https://kit.fontawesome.com/276cd09ce8.js"
      crossorigin="anonymous"
    ></script>
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
      rel="stylesheet"
    />
    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-3.5.0.js"></script>
  </head>
  <style>
    * {
      box-sizing: border-box;
    }
    body {
      font-family: "Open Sans", sans-serif;
      margin: 0px 0px;
      cursor: default;
    }
    a {
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
      cursor: pointer;
    }
    .navbar_menu_item:hover {
      background-color: #4E3524;
    }

    #frmLogin {
      width: 300px;
      height: 400px;
      background: #3d3d3d;
      color: #fff;
      position: absolute;
      top: 100px;
      left: 1620px;
      text-align: center;
      border: 2px solid #000;
    }
    #frmLogin > input {
   	  margin: 10px 0px 0px 5px;
    }
    .signIn {
	  border-radius: 8px;
	  padding: 6px;	  	     	
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
          <li class="navbar_menu_item" id="popOpen">로그인</li>
          <li class="navbar_menu_item"><a href="newbie">회원가입</a></li>
        </ul>
      </div>
    </nav>

    <!-- Login -->
    <form
      method="post"
      action="/app/check_user"
      id="frmLogin"
      style="display: none"
    >
      ID: <input type="text" name="loginid" /><br />
      Password: <input type="password" name="passcode" /><br />
      <input class="signIn" type="submit" value="로그인" />
    </form>
  </body>
  <script>
    $(document)
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
      .on("click", "#popOpen", function () {
        if ($("#frmLogin").css("display") == "none") {
          $("#frmLogin").show();
        } else {
          $("#frmLogin").hide();
        }
      });
  </script>
</html>
