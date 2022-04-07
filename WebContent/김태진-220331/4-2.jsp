<%@page import="java.text.Format"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>

<%
request.setCharacterEncoding("utf-8");
String kor = request.getParameter("kor");
String eng = request.getParameter("eng");
String math = request.getParameter("math");
int kor1 = Integer.parseInt(kor);
int eng1 = Integer.parseInt(eng);
int math1 = Integer.parseInt(math);
int sum = kor1+eng1+math1;
float average = sum/3f;

%>
<%
Class.forName("org.mariadb.jdbc.Driver");
String url = "jdbc:mariadb://localhost:3306/ktjdb";
String user = "ktj";
String password = "1111";
Connection con = DriverManager.getConnection(url, user, password);
String sql = "insert into testscore(kor, eng, math, sum, average) values(?, ?, ?, ?, ?)";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, kor);
pstmt.setString(2, eng);
pstmt.setString(3, math);
pstmt.setInt(4, sum);
pstmt.setFloat(5, average);

//pstmt.executeUpdate();
con.close();
pstmt.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험점수와 총점과 평균</title>
</head>
<body>

	
	국어 점수 : <%=kor1%><br>
	영어 점수 : <%=eng1%><br>
	수학 점수 : <%=math1%><br>

	총점 : <%=sum %><br>
	<!-- <%//out.println("총점 : " + (sum)); %><br> -->
	평균 : <%out.println(""+String.format("%.2f", average)); %>
	<!-- <%//out.println("평균 : " + (String.format("%.2f",sum/3))); %> -->
</body>
</html>