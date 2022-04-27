<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*" %>
<% 	String id = request.getParameter("id");
	
	//DBCP로변경
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/tjkim");
	Connection con = ds.getConnection();
	
	String sql = "select * from login where id = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	
	String name ="";
	String pwd ="";
	
	if(rs.next()){
		name = rs.getString("name");
		pwd = rs.getString("pwd");
	}
%>	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>멤버 정보 변경</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">사용자 정보 변경</h2>
		<hr/>
		<form action="updatePro.jsp?id=<%= id %>" method="post">
		  <div class="form-group">
	      <label for="id">ID : </label>
	      <input type="text" class="form-control" id="id" name="id" value="<%=id%>" disabled="disabled">
	    </div>
	    <div class="form-group">
	      <label for="name">NAME : </label>
	      <input type="text" class="form-control" id="name" name="name" value="<%=name%>">
	    </div>
	    <div class="form-group">
	      <label for="pwd">PASSWORD : </label>
	      <input type="password" class="form-control" id="pwd" name="pwd" value="<%=pwd%>">
	    </div>
	    <br>
	    <div class="text-center">
	    		<input type="submit" value="저장" class="btn btn-secondary">  
					<input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='delete.jsp?id=<%=id%>'">
					<input type="button" value="목록" class="btn btn-secondary" onclick="location.href='list.jsp'">
			</div>
		</form>
	</div>
</body>
</html>