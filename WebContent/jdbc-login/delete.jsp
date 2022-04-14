<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
//클라이언트에서 전달된 데이터
String id = request.getParameter("id");

//JDBC 드라이버 로드
Class.forName("org.mariadb.jdbc.Driver");
//커넥션 객체 얻기
String url = "jdbc:mariadb://localhost:3306/ktjdb";
String user = "ktj";
String password = "1111";
Connection con = DriverManager.getConnection(url, user, password);
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