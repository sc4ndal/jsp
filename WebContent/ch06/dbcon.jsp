<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DataBase Connection</title>
</head>
<body>
	<%
	//1. JDBC 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
	//2. 연결통로(Connection) 얻기
	String url = "jdbc:mariadb://localhost:3306/ktjdb";
	String user="ktj";
	String password="1111";
	Connection con = DriverManager.getConnection(url, user, password);	//연결통로	//DB사용하기 위해 con 변수 지정
	
	//3. DB 연결
	Statement stmt = con.createStatement();
	out.println("Connection Success");
	
	//4. 객제 해제
	stmt.close();
	con.close();
	
	%>
	<script>
	alert("Connection Success");
	</script>
</body>
</html>