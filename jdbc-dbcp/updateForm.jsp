<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<%
	String id = request.getParameter("id");
	request.setCharacterEncoding("utf-8");

%>
<%
	//DBCP로 변경
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/tjkim");
	Connection con = ds.getConnection();
	
	String sql = "select * from login where id=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();
	String name = "";
	String pwd = "";
	if(rs.next()){
		name = rs.getString("name");
		pwd = rs.getString("pwd");
	};
	rs.close();
	pstmt.close();
	con.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>update</title>
</head>
<body>
	<form action="updatePro.jsp" method="post"> 
	<h2>update</h2>
	<hr>
		id : <input type="text" name="id" value="<%=id %>" disabled><br> 
		name : <input type="text" name="name" value="<%=name %>" ><br>
		pwd : <input type="password" name="pwd" value="<%=pwd %>"><br><br>
	<button type="submit">저장</button>
	<button type="button" onclick="location.href='delete.jsp?id=<%=id %>'" >삭제</button>
	<button type="button" onclick="location.href='list.jsp'">돌아가기</button>
	
	</form>
</body>
</html>