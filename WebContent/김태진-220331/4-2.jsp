<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험점수와 총점과 평균</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String math = request.getParameter("math");
	int kor1 = Integer.parseInt(kor);
	int eng1 = Integer.parseInt(eng);
	int math1 = Integer.parseInt(math);
	%>
	
	국어 점수 : <%=kor1%><br>
	영어 점수 : <%=eng1%><br>
	수학 점수 : <%=math1%><br>
	<%float sum = kor1+eng1+math1; %>
	<%out.println("총점 : " + (sum)); %><br>
	<%out.println("평균 : " + (String.format("%.2f",sum/3))); %>
</body>
</html>