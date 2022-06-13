package cs;

import cs.LoginDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.connector.Response;

public class LoginDao {
	private Connection getConnection() throws Exception{
		//1. JNDI를 이용하기 위한 객체 생성
		Context init = new InitialContext();
		
		//2. 등록된 네이밍 서비스로부터 등록된 자원을 가져옴
		Context env = (Context) init.lookup("java:comp/env");
		
		//3. 자원들 중 원하는 jdbc/tjkim 자원을 찾아서 데이터소스를 가져옴
		DataSource ds = (DataSource) env.lookup("jdbc/tjkim");
//		Context init = new InitialContext();
//		DataSource ds = (DataSource) init.lookup("java:/comp/env/jdbc/tjkim");
		//4. 커넥션 얻어옴
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public void insert(LoginDto dto) {
		String sql = "insert into login(id, pwd, name) values(?, ?, ?)";
		
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			
			int i = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<LoginDto> list(){
		ArrayList<LoginDto> dtos = new ArrayList<LoginDto>();
		String sql = "select id, pwd, name from login";
		
		try(
				Connection con = getConnection();
				Statement stmt = con.createStatement();
				)
		{
			ResultSet rs = stmt.executeQuery(sql);
			System.out.println("여기요!!!");
			while(rs.next()) {
				
				LoginDto dto = new LoginDto();
				
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
				
				System.out.println(rs.getString("id"));
				System.out.println(rs.getString("pwd"));
				System.out.println(rs.getString("name"));
				
//				String id = rs.getString("id");
//				String pwd = rs.getString("pwd");
//				String name = rs.getString("name");
//				LoginDto dto = new LoginDto(id,pwd,name);
				
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	
	//메소드 작성 시 고려사항
	//1. public or private
	//2. 반환 데이터 (output)
	//3. 입력 데이터 (input)
	
	public int checkUser(String id, String pwd){
		String sql = "select pwd from login where id=? and pwd=?";
		int check=0;
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) 
		{
			pstmt.setNString(1, id);
			pstmt.setNString(2, pwd);//sql 실행 준비
			try(ResultSet rs = pstmt.executeQuery();)
			{
				if(rs.next()) {
					check=1;
				}else {
					check=0;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}
}
