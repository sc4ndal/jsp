<%@page import="java.awt.TextArea"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
    <%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String message = request.getParameter("message");
    Class.forName("org.mariadb.jdbc.Driver");
    String url = "jdbc:mariadb://localhost:3306/ktjdb";
    String user = "ktj";
    String password = "1111";
    Connection con = DriverManager.getConnection(url, user, password);
    
    String sql = "insert into writehtml(name, message) values(?, ?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, name);
    pstmt.setString(2, message);
    
    pstmt.executeUpdate();
    con.close();
    pstmt.close();
    %>
<!DOCTYPE html>
<html>
<style>
* {
  box-sizing: border-box;
}
input[type=text], textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: none;
}
label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
.row:after {
  content: "";
  display: table;
  clear: both;
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
<head>
<meta charset="UTF-8">
<title>작성내용</title>
</head>
<body>
<div class="container">
<script>alert("Success");</script>
	작성자 이름 : <%out.print(name); %><br>
	<%--작성 내용 : <%out.print(message); %> --%>
	<div class="row">
		<div class="col-25">
		<label for="write">작성 내용 : </label>
		</div>
		<div class="col-75">
		<textarea style="height:200px" readonly="readonly"><%out.print(message); %></textarea>
		</div>
	</div>
</div>
 </body>
</html>