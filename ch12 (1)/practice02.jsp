<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String[] list = {"cat", "kitty", "kitten", "neko", "goyangyi"};
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 실습</title>
</head>
<body>
	<c:out value="hi"/><br><br><br>${"hi"}<br>
	<c:set var="id" value="not name"/>
	<c:out value="${id}"/><br>
	${id}
	<hr>

	<hr>
	<c:set var="name" value="gildong"/>
	<c:set var="income" value="2000000"/>
	<c:out value="${name}님의 수입은${income}입니다."/>
	<hr>
	<c:if var="a" test="${income>=4000}">
		<c:out value="${name}님의 수입은${income}입니다."/>
		${a}
	</c:if>
	<hr>
	스코어 : ${!empty param.score ? param.score : "매개변수 없음" }
	<hr>
	<c:if test="${empty param.score}">
	<p>비었음!<p>
	</c:if>
	<hr>
	<c:if test="${!empty param.score}">
	<p>${param.score }<p>
	</c:if>
	<hr>
	<c:forEach var="i" begin="1" end="5" varStatus="st">
		<c:out value="${i}"/><br>
	</c:forEach>
	<br>
	<c:forEach var="a" items="${list}">
		${a}<br>
	</c:forEach><br>
	${list[0]}
	
</body>
</html>