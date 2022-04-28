<%
/*
	파일명 : 
	프로그램 설명 : 

*/

%>


<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	//DBCP로변경 DataBaseConnectionPool
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/tjkim");
	Connection con = ds.getConnection();
	//SQL문
	String sql = "SELECT * FROM post ORDER BY rDate";
	Statement st = con.createStatement();
	
	//SQL 실행
	ResultSet rs = st.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container"><br>	
	<h1 class="text-center font-weight-bold">게시판 목록</h1>
	<br>
	<table class="table table-hover">
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
		</tr>
<% 
	//DB에서 값을 하나씩 가져옴 
	while (rs.next()){
		String title = rs.getString("title");
		String username = rs.getString("username");
		String rDate = rs.getString("rDate");
%>	
		<tr>
			<td><a href="postUpdateForm.jsp?username=<%=username %>"><%=title %></a></td>
			
			<td><%=username %></td>
			<td><%=rDate %></td>
		</tr>
<%} 
	//6. 연결 해제
	rs.close();
	st.close();
	con.close();
%>
	</table>
	</div>	
	<div class="text-center">
	<button type="button" class="btn btn-secondary" onclick="location.href='postIndex.jsp'">돌아가기</button>
	</div>
</body>
</html>