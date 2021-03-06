<%
/*
	파일명 : 
	프로그램 설명 : 

*/

%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea,button[type=submit] {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: none;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

button[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

button[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>

<h2>게시판 글쓰기</h2>
<p>게시판 글쓰기에는 타인을 배려하며 사용합시다</p>

<div class="container">
  <form action="postInsertPro.jsp">
  <div class="row">
    <div class="col-25">
      <label for="fname">제목</label>
    </div>
    <div class="col-75">
      <input type="text" id="title" name="title">
    </div>
    
  </div>
  <div class="row">
      <div class="col-25">
      <label for="fname">작성자 이름</label>
    </div>
    <div class="col-75">
      <input type="text" id="username" name="username">
    </div>
    </div>

  <div class="row">
    <div class="col-25">
      <label for="write">내용</label>
    </div>
    <div class="col-75">
      <textarea id="content" name="content" style="height:200px"></textarea>
    </div>
  </div>
  <br>    
	
  <div class="row">

     
    <button name="submit" type="submit">작성하기</button>
	
  </div>

  </form>
</div>

</body>
</html>