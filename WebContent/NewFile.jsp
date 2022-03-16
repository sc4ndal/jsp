<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.time.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-*=8">
<title>첫jsp</title>
</head>
<body>
<h2>hello</h2>


<%
out.println("현재날짜: "+ LocalDate.now());
%>

</body>
</html>