<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>휴먼호텔: 객실관리</title>
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
      margin: 0px;
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
      background-color: #a47449;
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
      background-color: #4e3524;
    }
    #header {
      margin-left: 15px;
    }
    #all {
      display: flex;
    }
    #list {
      margin-left: 25px;
      margin-right: 50px;
    }
    .roomList {
      margin-left: 30px;
    }
    .enrollment {
      display: flex;

      margin-top: 20px;
    }
    .enrollment > ul > li {
      display: flex;
      align-items: center;
      margin: 30px 0px 20px 10px;
    }

    .con {
      display: flex;
      justify-content: space-between;
    }
    .con > input {
      padding: 2px 10px;
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
          <li class="navbar_menu_item"><a href="/app/booking">예약관리</a></li>
          <li class="navbar_menu_item"><a href="logout">로그아웃</a></li>
        </ul>
      </div>
    </nav>

    <!-- Header -->
    <header id="header">
      <h2>객실관리</h2>
    </header>

    <div id="all">
      <!-- List -->
      <section id="list">
        <div class="roomTitle">
          <h4>객실목록</h4>
        </div>
        <div class="roomList">
          <select id="room_menu" size="20"></select>
        </div>
      </section>

      <!-- Enrollment -->
      <section id="enrollment">
        <div class="enrollment">
          <ul>
            <li>
              객실이름 -&nbsp;<input id="txtName" type="text" />
              <input type="hidden" id="roomcode" />
            </li>
            <li>
              객실분류 -&nbsp;<select id="selType" size="5">
                <c:forEach items="${type}" var="type">
                  <option value="${type.typecode}">${type.name}</option>
                </c:forEach>
              </select>
            </li>
            <li>숙박가능인원 -&nbsp;<input type="number" id="txtNum" />명</li>
            <li class="charge">
              1박 요금 -&nbsp;<input type="number" id="txtPrice" />원
            </li>
            <li class="con">
              <input type="button" value="등록" id="btnAdd" />&nbsp;
              <input type="button" value="삭제" id="btnDelete" />&nbsp;
              <input type="button" value="취소" id="btnEmpty" />
            </li>
          </ul>
        </div>
      </section>
    </div>
  </body>

  <script>
    let ar;
    let code;

    $(document)
      .ready(function () {
        $.post(
          "http://localhost:8080/app/getRoomList",
          {},
          function (result) {
        	console.log(result);
            $.each(result, function (ndx, value) {
              str =
                '<option value="' +
                value["roomcode"] +
                '">' +
                value["roomname"] +
                "," +
                value["typename"] +
                "," +
                value["howmany"] +
                "," +
                value["howmuch"] +
                "</option>";
              $("#room_menu").append(str);
              //<option value="2">백두산, Suite Room,8,500000</option>
            });
          },
          "json"
        );
      })
      .on("click", "#room_menu option", function () {
        ar = $.map($(this).text().split(","), $.trim);

        $("#txtName").val(ar[0]);
        $("#selType option:contains('" + ar[1] + "')").prop("selected", true);
        $("#txtNum").val(ar[2]);
        $("#txtPrice").val(ar[3]);

        code = $(this).val();
        $("#roomcode").val(code);

        return false;
      })
      .on("click", "#btnEmpty", function () {
        $("#txtName, #txtNum, #selType, #roomcode , #txtPrice").val("");

        return false;
      })
      .on("click", "#btnDelete", function () {
        $.post(
          "http://localhost:8080/app/deleteRoom",
          { roomcode: $("#roomcode").val() },
          function (result) {
            console.log(result);
            if (result == "ok") {
              $("#btnEmpty").trigger("click");
              $("#room_menu option:selected").remove();
            }
          },
          "text"
        );

        return false;
      })
      .on("click", "#btnAdd", function () {
        let roomname = $("#txtName").val();
        let roomtype = $("#selType").val();
        let howmany = $("#txtNum").val();
        let howmuch = $("#txtPrice").val();
        // validation(유효성 검사)
        if (
          roomname == "" ||
          roomtype == "" ||
          howmany == "" ||
          howmuch == ""
        ) {
          alert("빈 값이 있습니다.");
          return false;
        }
        let roomcode = $("#roomcode").val();
        if (roomcode == "") {
          $.post(
            "http://localhost:8080/app/addRoom",
            {
              roomname: roomname,
              roomtype: roomtype,
              howmany: howmany,
              howmuch: howmuch,
            },
            function (result) {
              if (result == "ok") {
                location.reload();
              }
            },
            "text"
          );
        } else {
          // update
          $.post(
            "http://localhost:8080/app/updateRoom",
            {
              roomcode: roomcode,
              roomname: roomname,
              roomtype: roomtype,
              howmany: howmany,
              howmuch: howmuch,
            },
            function (result) {
              if (result == "ok") {
                location.reload();
              }
            },
            "text"
          );
        }
      });
  </script>
</html>