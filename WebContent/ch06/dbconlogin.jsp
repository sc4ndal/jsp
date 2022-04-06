<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Data Search</title>
</head>
<body>
	<%
	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://localhost:3306/ktjdb";
	String user = "ktj";
	String password = "1111";
	Connection con = DriverManager.getConnection(url, user, password);
	String sql = "select * from login";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	
	//반환데이터 출력하기
	while(rs.next()){
		out.println(rs.getString("id"));
		out.println(rs.getString("pwd"));
		out.println("<br>");
	}
	rs.close();
	con.close();
	stmt.close();
	%>
	<script>alert("Connection Success");</script>
</body>
</html>