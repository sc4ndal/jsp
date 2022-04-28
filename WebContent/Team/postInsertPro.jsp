<%
/*
	파일명 : 
	프로그램 설명 : 

*/

%>


<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.awt.TextArea"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
    <%
    request.setCharacterEncoding("utf-8");
    String title = request.getParameter("title");
    String username = request.getParameter("username");
    String content = request.getParameter("content");
	//DBCP로 변경
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/tjkim");
	Connection con = ds.getConnection();
    
    String sql = "insert into post(title, username, content) values(?, ?, ?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, username);
    pstmt.setString(3, content);
    
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
	제목 : <%out.print(title); %><br>
	작성자 이름 : <%out.print(username); %><br>
	<div class="row">
		<div class="col-25">
		<label for="write">작성 내용 : </label>
		</div>
		<div class="col-75">
		<textarea style="height:200px" readonly="readonly"><%out.print(content); %></textarea>
		</div>
		<button  type="button" class="btn btn-primary" onclick="location.href='postList.jsp'">게시판 목록</button>
	</div>
</div>
 </body>
</html>