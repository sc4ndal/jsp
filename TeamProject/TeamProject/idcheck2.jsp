<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*,javax.sql.*,javax.naming.*"%>
<%
request.setCharacterEncoding("UTF-8");
String fid=(String)request.getParameter("id");
int check=-1;
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:/comp/env/jdbc/team");
		con=ds.getConnection();
		
		String sql="select id from project where id='"+fid+"'";
		st=con.createStatement();
		st.execute(sql);
		rs=st.executeQuery(sql);
		if(rs.next()){
			check=1;
		}else{
			check=0;
		}
	}
	finally{
		if(rs!=null)try{rs.close();}catch(SQLException err){}
		if(st!=null)try{st.close();}catch(SQLException err){}
	}
	if(check==1){
		%>
		<b><font color="red"><%=fid%></font>는 이미 사용중인 아이디입니다.</b>
		<form name="checkForm" method="post" action="createAccount.jsp">
		<b>다른 아이디를 입력해주세요.</b><br><br>
		
		</form>
		<%
	}else{
		%>
		<center>
		<b>사용가능한 아이디입니다.</b>
		<input type="button" value="닫기" onclick="setId()">
		</center>
		<script language="javascript">
		<%
	}

%>
	function setId(){
		opener.document.createAccount.id.value="<%=fid%>";
		window.self.close();
	}
</script>