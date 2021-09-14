<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>휴먼호텔: 예약관리</title>
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
    #look_up,
    #action,
    #view {
      margin-left: 25px;
    }
    #btn {
      text-align: center;
    }
    tr {
      line-height: 35px;
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
          <li class="navbar_menu_item"><a href="/app/room">객실관리</a></li>
          <li class="navbar_menu_item"><a href="logout">로그아웃</a></li>
        </ul>
      </div>
    </nav>

    <!-- Header -->
    <header id="header">
      <div>
        <h2>예약관리</h2>
      </div>
    </header>

    <div id="all">
      <!-- LookUp -->
      <section id="look_up">
        <div class="look_up">
          <fieldset>
            예약기간 -&nbsp;<input type="date" name="" id="checkin" val=""/> ~
            <input type="date" name="" id="checkout" val=""/><br />
            객실종류 -&nbsp;
            <select class="room">
              <option>
                <c:forEach items="${type}" var="type">
                  <option value="${type.typecode}">${type.name}</option>
                </c:forEach>
              </option>
            </select>
            <input type="button" value="조회" id="btnSearch" />
            <datalist id=""> </datalist>
          </fieldset>
          <fieldset>
            <legend><b>예약가능객실</b></legend>
            <select name="" id="room_list" size="20"></select>
          </fieldset>
        </div>
      </section>

      <!-- Action -->
      <section id="action">
        <div>
          <form id="" action="">
            <table>
              <tr>
                <td>객실명 -</td>
                <td>
                  <input type="text" id="txtName" /><input
                    type="hidden"
                    id="roomcode"
                  />
                </td>
              </tr>
              <tr>
                <td>객실종류 -</td>
                <td>
                  <select id="selType" size="4">
                    <c:forEach items="${type}" var="type">
                      <option value="${type.typecode}">${type.name}</option>
                    </c:forEach>
                  </select>
                </td>
              </tr>
              <tr>
                <td>예약인원 -</td>
                <td><input type="number" id="txtHuman" min="1" />명</td>
              </tr>
              <tr>
                <td>최대인원 -</td>
                <td><input type="number" id="txtNum" min="1" />명</td>
              </tr>
              <tr>
                <td>예약기간 -</td>
                <td>
                  <input type="date" name="" id="txtCheckin" value=""/> ~
                  <input type="date" name="" id="txtCheckout" value=""/>
                </td>
              </tr>
              <tr>
                <td>숙박비총액</td>
                <td><input type="number" id="txtTotal" />원</td>
              </tr>
              <tr>
                <td>예약자명 -</td>
                <td>
                  <input type="text" id="txtPerson" />
                </td>
              </tr>
              <tr>
                <td>예약자 모바일 -</td>
                <td><input type="text" id="txtMobile" /></td>
              </tr>
              <tr id="btn">
                <td>
                  <input type="button" id="btnComplete" value="예약완료" />
                </td>
                <td><input type="button" id="btnEmpty" value="비우기" /></td>
                <td><input type="button" id="btnDelete" value="예약취소" /></td>
              </tr>
            </table>
          </form>
        </div>
      </section>

      <!-- View -->
      <section id="view">
        <div>
          <fieldset id="b">
            <legend>
              <b
                >예약된 객실(객실명 객실종류 예약인원/최대인원 예약기간 숙박비
                모바일 예약자명)</b
              >
            </legend>
            <select name="" id="booked" size="10"></select>
          </fieldset>
        </div>
      </section>
    </div>
  </body>
  <script>
    let ar;
    let code;

    $(document)
      .ready(function () {})
      .on("click", "#btnSearch", function () {
        let checkin = $("#checkin").val();
        let checkout = $("#checkout").val();

        $.post(
          "http://localhost:8080/app/getBookingList",
          {
            checkin: checkin,
            checkout: checkout,
          },
          function (result) {
            $("#booked").text("");
            $.each(result, function (ndx, value) {
              str =
                '<option value="' +
                value["bookcode"] +
                '">' +
                value["roomname"] +
                "," +
                value["typename"] +
                "," +
                value["human"] +
                "/" +
                value["howmany"] +
                "," +
                value["checkin"] +
                "~" +
                value["checkout"] +
                "," +
                value["total"] +
                "," +
                value["mobile"] +
                "," +
                value["name"] +
                "</option>";
              $("#booked").append(str);
            });
          },
          "json"
        );

        $.post(
          "http://localhost:8080/app/getAvailableBooking",
          {
            checkin: checkin,
            checkout: checkout,
          },
          function (result) {
            $("#room_list").text("");
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
              $("#room_list").append(str);
            });
          },
          "json"
        );

        return false;
      })
      .on("click", "#room_list option", function () {
        ar = $.map($(this).text().split(","), $.trim);

        $("#txtName").val(ar[0]);
        $("#selType option:contains('" + ar[1] + "')").prop("selected", true);
        $("#txtNum").val(ar[2]);

        code = $(this).val();
        $("#roomcode").val(code);

        $("#txtCheckin").val($("#checkin").val());
        $("#txtCheckout").val($("#checkout").val());

        let txtPrice = parseInt(ar[3]);

        let txtCheckin = $("#txtCheckin").val();
        let txtCheckout = $("#txtCheckout").val();

        let start = new Date(
          txtCheckin.substr(0, 4),
          txtCheckin.substr(5, 2),
          txtCheckin.substr(8, 2)
        );
        let end = new Date(
          txtCheckout.substr(0, 4),
          txtCheckout.substr(5, 2),
          txtCheckout.substr(8, 2)
        );

        let diffTime = Math.abs(end - start);
        let diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

        if (start > end) {
          alert("체크인 날짜가 체크아웃보다 나중일 수 없습니다.");
          return false;
        }

        let txtTotal = txtPrice * diffDays;

        $("#txtTotal").val(txtTotal);

        return false;
      })
      .on("click", "#btnComplete", function () {
        let roomname = $("#txtName").val();
        let roomtype = $("#selType option:selected").text();
        let human = $("#txtHuman").val();
        let howmany = $("#txtNum").val();
        let checkin = $("#txtCheckin").val();
        let checkout = $("#txtCheckout").val();
        let total = $("#txtTotal").val();
        let name = $("#txtPerson").val();
        let mobile = $("#txtMobile").val();

        if (
          roomname == "" ||
          roomtype == "" ||
          human == "" ||
          howmany == "" ||
          checkin == "" ||
          checkout == "" ||
          total == "" ||
          name == "" ||
          mobile == ""
        ) {
          alert("빈 값이 있습니다.");
          return false;
        }
        if (human > howmany) {
          alert("예약인원이 최대인원보다 큽니다.");
          return false;
        }

        let roomcode = $("#roomcode").val();

        if (roomcode != "") {
          $.post(
            "http://localhost:8080/app/addBooking",
            {
              roomcode: roomcode,
              human: human,
              checkin: checkin,
              checkout: checkout,
              total: total,
              name: name,
              mobile: mobile,
            },
            function (result) {
              if (result == "ok") {
                let arr = "";
                arr += '<option value="' + $("#roomcode").val + '">';
                arr += roomname + " ";
                arr += roomtype + " ";
                arr += human + "/" + howmany + " ";
                arr += checkin + "~" + checkout + " ";
                arr += total + " ";
                arr += mobile + " ";
                arr += name;
                arr += "</option>";
                $("#completeBook").append(arr);

                $("#btnEmpty").trigger("click");
              } else {
                alert("예약이 완료되지 않았습니다.");
              }
            },
            "text"
          );
          return false;
        } else {
          $.post(
            "http://localhost:8080/app/updateBooking",
            {
            	bookcode: $("#booked option:selected").val(), 
				human: human,
				name: name,
				mobile: mobile
            },
            function (result) {
              if (result == "ok") {
                  $("#btnEmpty").trigger("click");
                  $("#booked").text("");
                  $("#btnSearch").trigger("click");
              }
            },
            "text"
          );
        }
      })
      .on("click", "#btnEmpty", function () {
        $(
          "#roomcode ,#txtName, #selType, #txtHuman, #txtNum, #txtCheckin, #txtCheckout, #txtTotal, #txtPerson, #txtMobile"
        ).val("");

        return false;
      })
      .on("click", "#btnTest", function () {
        alert($("#booked option:selected").val());
      })
      .on("click", "#booked option", function () {
        ar = $.map($(this).text().split(","), $.trim);

        console.log(ar);

        $("#roomcode").val("");
        $("#txtName").val(ar[0]);
        $("#selType option:contains('" + ar[1] + "')").prop("selected", true);
        $("#txtHuman").val(ar[2].split("/")[0]);
        $("#txtNum").val(ar[2].split("/")[1]);
        $("#txtCheckin").val(ar[3].split("~")[0]);
        $("#txtCheckout").val(ar[3].split("~")[1]);
        $("#txtTotal").val(ar[4]);
        $("#txtMobile").val(ar[5]);
        $("#txtPerson").val(ar[6]);
      })
      .on("click", "#btnDelete", function () {
        $.post(
          "http://localhost:8080/app/deleteBooking",
          { bookcode: $("#booked option:selected").val() },
          function (result) {
            console.log(result);
            if (result == "ok") {
              $("#btnEmpty").trigger("click");
              $("#booked option:selected").remove();
            }
          },
          "text"
        );

        return false;
      });
  </script>
</html>
