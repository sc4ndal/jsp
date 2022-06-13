<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="cs.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LoginDto dto = new LoginDto("배고프다", "이름", "1111");

	pageContext.setAttribute("dto", dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 실습</title>
</head>
<body>
	문자열 : ${"hello world"}<br>
	연산자 : ${100+1234}<br>
	비교 : ${100>69}<br>
	내장객체(param) : ${param.name}<br>
	empty 연산 : ${empty param.name}<br>
	삼항연산 : ${!empty param.name ? param.name : "매개변수 없음"}<br>
	<hr>
	ID : ${dto.id}<br>
	NAME : ${dto.name}<br>
	PWD : ${dto.pwd}<br>
	<hr>
	프로토콜 : ${pageContext.request.protocol}<br>
	서버명 : ${pageContext.request.serverName}<br>
	<hr>
	<%
	//배열에서 값 꺼내기, 값 저장
	String list[] = {"moon", "sun", "jupiter", "mars", "venus", "mecury"};
	pageContext.setAttribute("list", list);
	
	//List객체에서 값 꺼내기, 값 저장
	List<String> namelist = new LinkedList<String>();
	namelist.add("ㄱㄴㄷ");
	namelist.add("ㄹㅁㅂ");
	namelist.add("ㅅㅇㅈ");
	pageContext.setAttribute("namelist", namelist);
	
	//쿠키에서 값 꺼내기
	String value = request.getParameter("v");
	Cookie cookie = new Cookie("v", "hi");
	response.addCookie(cookie);
	
	session.setAttribute("a", "hello world!");
	%>
	<br>
	List : ${list[3]}<br>
	NameList : ${namelist[1]}<br>
	Cookie : ${cookie.v.value}<br>
	Session : ${a} 
</body>
</html>