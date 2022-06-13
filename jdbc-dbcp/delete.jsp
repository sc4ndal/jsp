<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	//클라이언트에서 전달된 데이터
	String id = request.getParameter("id");
	
	//DBCP로 변경
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/tjkim");
	Connection con = ds.getConnection();
	
	
	String sql = "delete from login where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	int i = pstmt.executeUpdate();
	con.close();
	pstmt.close();
%>	
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	let ans = alert("삭제되었습니다.");
	if (!ans){
		location.href='list.jsp';
	}
	</script>
</body>
</html>