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
    import="java.util.Date"
    import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%	String username = request.getParameter("username");
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
	
	//DBCP로변경
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/tjkim");
	Connection con = ds.getConnection();
	
	String sql = "select * from post where username = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, username);
	
	ResultSet rs = pstmt.executeQuery();
	
	String title ="";
	String content ="";
	String rDate = "";
	
	if(rs.next()){
		title = rs.getString("title");
		content = rs.getString("content");
		rDate = rs.getString("rDate");
	}
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
	<title>멤버 정보 변경</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">게시글 수정</h2>
		<hr/>
		<form action="postUpdatePro.jsp?username=<%=username %>"method="post">
	<div class="container">
	작성 시간 : <%out.print(rDate); %><br>
	작성자 이름 :<%out.print(username); %><br>
		<div class="row">
		<div class="col-25">
		<label for="write">제목 : </label>
		</div>
		<div class="col-75">
		<input type="text" name="title" value=<%=title %>>
		</div>
	</div>
	<div class="row">
		<div class="col-25">
		<label for="write">작성 내용 : </label>
		</div>
		<div class="col-75">
		<textarea style="height:200px" name="content"><%out.print(content); %></textarea>
		</div>
	</div>
</div>
	    <br>
	    <div class="text-center">
	    		<input type="submit" value="저장" class="btn btn-secondary">  
					<input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='postDelete.jsp?username=<%=username%>'">
					<input type="button" value="목록" class="btn btn-secondary" onclick="location.href='postList.jsp'">
			</div>
		</form>
	</div>
</body>
</html>