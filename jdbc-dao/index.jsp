<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>	
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom:0">
	  <h1>Account Management</h1>
	  <p>회원관리</p>
	</div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <a class="navbar-brand" href="#">페이지 이동</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="https://www.google.com">구글</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="https://www.naver.com">네이버</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="https://www.dit.ac.kr/kr/?ref=aHR0cDovL2RpdC5hYy5rci8%3D">동의과학대학교</a>
	      </li>    
	    </ul>
	  </div>  
	</nav>
	<br><br>
  <div class="text-center">
		<button  type="button" class="btn btn-primary" onclick="location.href='list.jsp'">멤버 목록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button  type="button" class="btn btn-primary" onclick="location.href='insertForm.jsp'">멤버 입력</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button  type="button" class="btn btn-primary" onclick="location.href='loginForm.jsp'">로그인</button>
	</div>
</body>
</html>