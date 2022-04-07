<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<head>
<meta charset="UTF-8">
<title>가입정보</title>
</head>
<body>
	
	<%request.setCharacterEncoding("utf-8");
	String memo = (String)request.getParameter("memo");
	%>
	아이디 : <%=request.getParameter("id") %><br>
	비밀번호  : <%=request.getParameter("pw") %><br>
	성별 : <%=request.getParameter("gender") %><br>
	가입경로 : <%=request.getParameter("intro") %><br>
	주소지 : <%=request.getParameter("addr") %><br>
	<div class="row">
	<div class="col-25">메모 :</div> <div class="col-75"><textarea rows="8" readonly="readonly"><%out.print(memo);%></textarea></div>
	</div>
</body>
</html>