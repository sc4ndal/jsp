<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="team.LoginDao" %>
<%@page import="team.LoginDto" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//클라이언트에서 전달된 데이터
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	LoginDao dao = new LoginDao();
	LoginDto dto = new LoginDto(name, nick, id, pass, birth, tel, email);
	dao.insert(dto);

	 

	
	//DBCP로 변경
//	Context initCtx = new InitialContext();
//	Context envCtx = (Context)initCtx.lookup("java:comp/env");
//	DataSource ds = (DataSource)envCtx.lookup("jdbc/team");
//	Connection con = ds.getConnection();
	
	//SQL
//	String sql = "insert into account(name, nick, id, pass, birth, tel, email) values(?, ?, ?, ?, ?, ?, ?)";
	
	//SQL실행
//	PreparedStatement pstmt = con.prepareStatement(sql);
//	pstmt.setString(1, name);
//	pstmt.setString(2, nick);
//	pstmt.setString(3, id);
//	pstmt.setString(4, pass);
//	pstmt.setString(5, birth);
//	pstmt.setString(6, tel);
//	pstmt.setString(7, email);
	
//	pstmt.execute();
	
	//객체해지
//	pstmt.close();
//	con.close(); 
%>
<script>

//창닫기
alert("회원가입이 완료되었습니다!");

 window.self.close();
</script>