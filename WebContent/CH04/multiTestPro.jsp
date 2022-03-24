<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취미</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>  <%-- post 방식으로 사용할때 필요함  --%>
	
	<%
		String[] hobby=request.getParameterValues("hobby");
		
		out.println("내 취미는 : ");

		
		for(int i=0; i<hobby.length; i++)
			out.println(hobby[i]);
	%>
	
	
	
</body>
</html>