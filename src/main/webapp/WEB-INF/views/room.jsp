<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="http://code.jquery.com/jquery-3.5.0.js"></script>
    <title>객실관리</title>
  </head>
  <style>
    body {
      background-color: whitesmoke;
    }

    select#roomList {
      background-color: rgb(240, 240, 53);
    }

    header h2 {
      display: inline-block;
      padding-left: 20px;
    }

    div {
      float: left;
    }

    ul {
      margin-top: 0;
    }

    li {
      padding-bottom: 10px;
      list-style: none;
    }

    section {
      padding-left: 40px;
    }

    section div {
      padding-left: 10px;
    }

    div.b > ul > li.charge {
      padding-bottom: 20px;
    }

    div.b > ul > input {
      width: 200px;
      text-align: center;
    }

    body > section > div.b > ul > li.Con > input[type="button"] {
      width: 70px;
      margin-right: 20px;
      background-color: dodgerblue;
    }
  </style>
  <body>
    <header>
      <h2>객실관리</h2>
      <h2>
        <a href="/app/booking"><u>예약관리</u></a>
      </h2>
    </header>

    <section>
      <h4>객실목록</h4>
      <div>
        <select id="roomList" size="9">
          <option>백두산 Suite Room 4명</option>
          <option>한라산 Family Room 6명</option>
          <option>태조산</option>
          <option>치악산</option>
          <option>설악산</option>
          <option>한라산</option>
          <option>금강산</option>
          <option>덕유산</option>
          <option>계룡산</option>
        </select>
      </div>

      <div class="b">
        <ul>
          <li>객실이름 - <input type="text" /></li>
          <li>
            객실분류 -
            <select name="" id="">
              <option value="">Suite Room</option>
              <option value="">Family Room</option>
              <option value="">Double Room</option>
              <option value="">Single Room</option>
              <option value="">Domitory</option>
            </select>
          </li>
          <li>
            숙박가능인원 -
            <select name="" id="">
              <option value="">1</option>
              <option value="">2</option>
              <option value="">3</option>
              <option value="">4</option>
              <option value="">5</option>
            </select>
            명
          </li>
          <li class="charge">1박요금 - <input type="text" />원</li>
          <li class="Con">
            <input type="button" value="등록" />
            <input type="button" value="삭제" />
            <input type="button" value="Clear" />
          </li>
        </ul>
      </div>
    </section>
    <a href=logout>로그아웃</a>

	<table border=1>
    	<tr>
    		<td>
    			<select size=10 style='width:250px;' id=room_menu>
<%--     		<c:forEach items="${list}" var="room">
   						<option value='${room.roomcode}'>${room.roomname}, ${room.typename}, ${room.howmany}, ${room.howmuch}</option>
    				</c:forEach> --%>
    			</select>
    		</td>
    		<td>
   			 <table>
    			<tr>
    				<td align=right>객실명</td>
    				<td><input type=text id=txtName><input type=hidden id=roomcode></td>
    			</tr>
    			<tr>
			    	<td align=right>타입</td>
			    	<td>
			    		<select size=5 style='width:120px', id=selType>
			    		<c:forEach items="${type}" var="type">
			    			<option value='${type.typecode}'>${type.name}</option>
			    		</c:forEach>
			    		</select>
			   		</td>
   				</tr>
   				<tr>
					<td align=right>최대숙박인원</td><td><input type=number id=txtNum></td>
   				</tr>
			   	<tr>
			   		<td align=right>1박가격</td><td><input type=number id=txtPrice></td>
			   	</tr>
			   	<tr>
			   		<td colspan=2 align=center>
			   			<input type=button value='등록' id=btnAdd>&nbsp;
			   			<input type=button value='삭제' id=btnDelete>&nbsp;
			   			<input type=button value='취소' id=btnEmpty>
			   		</td>
   				</tr>	 
    		</table>
    		</td>
    	</tr>
    </table>
  </body>
  
  <script>
  	let ar;
  	let code;
  	
	$(document)
		.ready(function() {
			$.post("http://localhost:8080/app/getRoomList", {}, function(result) {
				console.log(result);
				$.each(result, function(ndx, value) {
					str = '<option value="'+value['roomcode']+'">'+value['roomname']+','+
							value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
							$("#room_menu").append(str);
					//<option value="2">백두산, Suite Room,8,500000</option>							
				})
			}, "json");
		})
		.on("click", "#room_menu option", function() {
			ar = $.map($(this).text().split(","), $.trim);
			
			$("#txtName").val(ar[0]);
			$("#selType option:contains('"+ar[1]+"')").prop("selected", true);
			$("#txtNum").val(ar[2]);
			$("#txtPrice").val(ar[3]);
			
			code = $(this).val();
			$("#roomcode").val(code);
			
			return false;
		})
		.on("click", "#btnEmpty", function() {
			$("#txtName, #txtNum, #selType, #roomcode ,#txtPrice").val("");
			
			return false;
		})
		.on("click", "#btnDelete", function() {
			$.post("http://localhost:8080/app/deleteRoom", {roomcode:$('#roomcode').val()}, function(result) {
				console.log(result);
				if (result=="ok") {
					$("#btnEmpty").trigger("click");
					$("#room_menu option:selected").remove();
				}
			}, 'text');
			
			return false;
		})
		.on("click", "#btnAdd", function() {
			let roomname = $("#txtName").val();
			let roomtype = $("#selType").val();
			let howmany = $("#txtNum").val();
			let howmuch = $("#txtPrice").val();
			// validation(유효성 검사)
			if (roomname=="" || roomtype=="" || howmany=="" || howmuch=="") {
				alert("빈 값이 있습니다.")
				return false;
			}
			let roomcode = $("#roomcode").val();
			if (roomcode=="") {
				$.post("http://localhost:8080/app/addRoom", {roomname:roomname, roomtype:roomtype, howmany:howmany, howmuch:howmuch}, function(result) {
						if(result=="ok") {
							location.reload();
						}
				}, "text")
			} else { // update
					$.post("http://localhost:8080/app/updateRoom", {roomcode:roomcode, roomname:roomname, roomtype:roomtype, howmany:howmany, howmuch:howmuch}, function(result) {
						if(result=="ok") {
							location.reload();
						}
				}, "text")
			}
		})
  </script>
</html>
