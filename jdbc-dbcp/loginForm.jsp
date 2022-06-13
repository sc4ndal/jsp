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
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="loginPro.jsp" method="post"> 
	<h2>로그인</h2>
	<hr>
		아이디 : <input type="text" name="id"><br>
		암호 : &nbsp&nbsp&nbsp<input type="password" name="pwd"><br><br>
		<input type="submit" value="저장">
	<button type="button" onclick="location.href='index.jsp'">돌아가기</button>
	</form>
</body>
</html>