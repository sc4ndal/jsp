package cs.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.dao.LoginDao;
import cs.dto.LoginDto;

public class LoginInsertService implements LoginService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 1. insertForm에서 전달된 id, pwd, name 받기
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		
		// 2. id, pwd, name로 LoginDto 객체를 만든다.
		LoginDto dto = new LoginDto(id,pwd,name);
		
		// 3. LoginDao 객체를 생성한다.
		LoginDao dao = new LoginDao();
		
		// 4. LoginDao의 insert(dto) 실행
		dao.insert(dto);
	}

}
