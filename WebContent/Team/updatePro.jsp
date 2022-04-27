<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	//DBCP로변경 DataBaseConnectionPool
	//Context initCtx = new InitialContext();
	//Context envCtx = (Context)initCtx.lookup("java:comp/env");
	//DataSource ds = (DataSource)envCtx.lookup("jdbc/tjkim");
	//Connection con = ds.getConnection();
	
	//JDBC 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	//커넥션 객체 얻기
	String url = "jdbc:mariadb://localhost:3306/ktjdb";
	String user = "ktj";
	String password = "1111";
	Connection con = DriverManager.getConnection(url, user, password);
	
	//SQL문
	String sql = "UPDATE LOGIN SET NAME=?, PWD=? WHERE ID=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, pwd);
	pstmt.setString(3, id);
	
	//SQL 실행
	int i = pstmt.executeUpdate();
	
	//객체 해제
	pstmt.close();
	con.close();
	%>
	<meta charset="utf-8">
<body>
<%=id %><br>
<%=name %><br>
<%=pwd %>	
</body>
	 
	<script>
	let ans = alert("데이터 변경 완료");
	if (!ans){
		location.href="list.jsp";
	}
	</script>
	