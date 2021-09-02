<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>예약관리</title>
  </head>
  <style>
    body {
      background-color: whitesmoke;
    }

    header h2 {
      display: inline-block;
      padding-left: 20px;
      padding-bottom: 30px;
    }

    div#a {
      float: left;
      padding-left: 40px;
    }

    form {
      float: left;
      padding-left: 40px;
      padding-right: 40px;
      display: flex;
    }

    input#1 {
      display: block;
    }

    fieldset {
      width: 380px;
      background-color: rgb(240, 240, 53);
    }

    select {
      width: 200px;
    }

    tr:nth-child(3) > td:nth-child(2) > input[type="text"] {
      width: 20px;
    }

    tr:nth-child(7) > td {
      text-align: center;
    }

    tr:nth-child(7) > td > input[type="button"] {
      padding: 5px 30px;
      background-color: dodgerblue;
    }
  </style>
  <body>
    <header>
      <h2>
        <a href="/app/room"><u>객실관리</u></a>
      </h2>
      <h2>예약관리</h2>
    </header>
    <section>
      <div id="a">
        <fieldset>
          숙박기간: <input type="date" name="" id="" /> ~
          <input type="date" name="" id="" /><br />
          객실분류: <input type="text" list="list" />
          <datalist id="list">
            <option value="1"></option>
            <option value="2"></option>
            <option value="3"></option>
            <option value="4"></option>
            <option value="5"></option>
          </datalist>
        </fieldset>
        <fieldset>
          <legend><b>예약가능</b></legend>
          <select name="" id="" size="10">
            <option>백두산 Suite Room 4명</option>
            <option>한라산 Family Room 6명</option>
            <option>태조산</option>
            <option>치악산</option>
            <option>설악산</option>
          </select>
        </fieldset>
      </div>
      <form action="">
        <table>
          <tr>
            <td>객실이름 -</td>
            <td><input type="text" /></td>
          </tr>
          <tr>
            <td>숙박기간 -</td>
            <td>
              <input type="date" name="" id="" /> ~
              <input type="date" name="" id="" />
            </td>
          </tr>
          <tr>
            <td id="personnel">숙박인원 -</td>
            <td><input type="text" />명</td>
          </tr>
          <tr>
            <td>1박 비용 -</td>
            <td><input type="text" />원</td>
          </tr>
          <tr>
            <td>총 숙박비 -</td>
            <td><input type="text" />원</td>
          </tr>
          <tr>
            <td>예약자 모바일 -</td>
            <td><input type="" /></td>
          </tr>
          <tr>
            <td><input type="button" value="등록" /></td>
            <td><input type="button" value="취소" /></td>
            <td><input type="button" value="Clear" /></td>
          </tr>
        </table>
      </form>
      <fieldset id="b">
        <legend><b>예약된 객실</b></legend>
        <select name="" id="" size="10">
          <option value="">백두산</option>
          <option value="">한라산</option>
          <option value="">치악산</option>
          <option value="">계룡산</option>
          <option value="">금강산</option>
        </select>
      </fieldset>
    </section>
    <a href=logout>로그아웃</a>
  </body>
</html>
