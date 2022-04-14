<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="insertPro.jsp" method="post"> 
	<h2>가입</h2>
	<hr>
		아이디 : <input type="text" name="id"><br> 
		이름 : &nbsp&nbsp&nbsp<input type="text" name="name"><br>
		암호 : &nbsp&nbsp&nbsp<input type="password" name="pwd"><br><br>
		<input type="submit" value="저장">
	<button type="button" onclick="location.href='index.jsp'">돌아가기</button>
	</form>
</body>
</html>