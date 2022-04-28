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
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String username = request.getParameter("username");
	String content = request.getParameter("content");
	
	//DBCP로변경 DataBaseConnectionPool
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/tjkim");
	Connection con = ds.getConnection();
	
	//SQL문
	String sql = "update post set title=?, content=? where username=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setString(3, username);
	
	//SQL 실행
	int i = pstmt.executeUpdate();
	
	//객체 해제
	pstmt.close();
	con.close();
	%>
 
	<script>
	let ans = alert("데이터 변경 완료");
	if (!ans){
		location.href="postList.jsp";
	}
	</script>
	 
<body>
<%=title %><br><%=username %><br><%=content %>
</body>
	