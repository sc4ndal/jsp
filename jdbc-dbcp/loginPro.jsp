<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	//id,pwd가져오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//db연동으로 테이블에서 가져온 id,pwd 일치여부 확인
		//DBCP로 변경
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/tjkim");
	Connection con = ds.getConnection();
	
	//SQL
	String sql = "insert into login(id, pwd) values(?, ?)";
	
	//SQL실행
	//Statement stmt = con.createStatement();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	
	int i = pstmt.executeUpdate();
	//int i = stmt.executeUpdate(sql);
	//객체해지
	pstmt.close();
	con.close();
	
	response.sendRedirect("list.jsp");
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
 ㅎㅇ
</body>
</html>