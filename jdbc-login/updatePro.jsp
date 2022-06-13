<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
%>
<%
	request.setCharacterEncoding("utf-8");
	//클라이언트에서 전달된 데이터
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	//JDBC 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	//커넥션 객체 얻기
	String url = "jdbc:mariadb://localhost:3306/ktjdb";
	String user = "ktj";
	String password = "1111";
	Connection con = DriverManager.getConnection(url, user, password);


	//SQL
	String sql = "update login set name = ?, pwd = ? where id = ?";
	
	//SQL실행
	//Statement stmt = con.createStatement();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, pwd);
	pstmt.setString(3, id);
	
	int i = pstmt.executeUpdate();
	//int i = stmt.executeUpdate(sql);
	//객체해지
	
	pstmt.close();
	con.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	let ans = alert("데이터 변경 완료");
	if (!ans){
		location.href="list.jsp";
	}
	</script>
</body>
</html>