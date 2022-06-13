<%@page import="cs.LoginDao" import="cs.LoginDto" %>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	LoginDao dao = new LoginDao();
	LoginDto dto = new LoginDto(id, pwd, name);		
	dao.insert(dto);
	
	response.sendRedirect("list.jsp");
%>
