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
String sql = "insert into login(id, name, pwd) values(?, ?, ?)";

//SQL실행
//Statement stmt = con.createStatement();
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, name);
pstmt.setString(3, pwd);

int i = pstmt.executeUpdate();
//int i = stmt.executeUpdate(sql);
//객체해지
pstmt.close();
con.close();

response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=i %>개의 데이터가 입력되었습니다.<br><br>
	<script>alert("<%=i%>개의 데이터가 입력되었습니다.");</script>
	아이디 : <%=id%><br>
	이름 : <%=name %><br>
	암호 : <%=pwd%>
	
	
</body>
</html>