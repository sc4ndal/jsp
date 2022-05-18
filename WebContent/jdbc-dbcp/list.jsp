<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
    <%
	//DBCP로 변경
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/tjkim");
	Connection con = ds.getConnection();
	
	String sql = "select * from login order by id";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
<title>list</title>
</head>
<body>
<h2>list</h2>
<hr>
<div class="container">
	<table class="table table-striped">
	<tr>
		<th>id</th>
		<th>name</th>
		<th>pwd</th>
	</tr>
	<tr>
<%

	//반환데이터 출력하기
	while(rs.next()){
		String id = rs.getString("id");
		String name = rs.getString("name");
		String pwd = rs.getString("pwd");
%>
		<td><a href="updateForm.jsp?id=<%=id%>"><%=id %></a></td>
		<td><%=name %></td>
		<td><%=pwd %></td>
	</tr>
<%
	}
%>
	</table>
	<button type="button" onclick="location.href='index.jsp'">돌아가기</button>
	</div>
<%
	//객체 해지
	rs.close();
	con.close();
	stmt.close();
%>
	<!-- <script>alert("Connection Success");</script> -->
</body>
</html>