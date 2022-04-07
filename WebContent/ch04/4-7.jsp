<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취미</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<%
		String[] language=request.getParameterValues("language");
		String[] hobby=request.getParameterValues("hobby");
		%>
		내 관심 언어는 : 
		<%
		for(int i=0;i<language.length;i++){
			out.println(language[i]+"");
		}
		%>
		<br>
		내 취미는 : 
		
		<%
		for(int i=0;i<hobby.length;i++){
			out.println(hobby[i]+"");
		}
		%>
		<br>
		<%
		for(String s : hobby){
			out.println(s+"");
		}
	%>
</body>
</html>