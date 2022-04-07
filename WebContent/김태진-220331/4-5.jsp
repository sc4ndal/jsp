<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");
String gender = request.getParameter("gender");
String intro = request.getParameter("intro");
String addr = request.getParameter("addr");
String memo = request.getParameter("memo");

Class.forName("org.mariadb.jdbc.Driver");
String url = "jdbc:mariadb://localhost:3306/ktjdb";
String user = "ktj";
String password = "1111";
Connection con = DriverManager.getConnection(url, user, password);

String sql = "insert into accounthtml(id, pw, gender, intro, addr, memo) values(?, ?, ?, ?, ?, ?)";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pw);
pstmt.setString(3, gender);
pstmt.setString(4, intro);
pstmt.setString(5, addr);
pstmt.setString(6, memo);

pstmt.executeUpdate();
pstmt.close();
con.close();
%>
<!DOCTYPE html>
<html>
<head>
<style>
input[type=text], textarea{
	resize: none;
}
.col-25 {
  float: left;
  
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}
</style>
<meta charset="UTF-8">
<title>가입정보</title>
</head>
<body>
	<script>alert("Success");</script>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	아이디 : <%=id %><br>
	비밀번호  : <%=pw %><br>
	성별 : <%=gender %><br>
	가입경로 : <%=intro %><br>
	주소지 : <%=addr %><br>
	<div class="row">
	<div class="col-25">메모 :</div> <div class="col-75"><textarea rows="8" readonly="readonly"><%out.print(memo);%></textarea></div>
	</div>

</body>
</html>