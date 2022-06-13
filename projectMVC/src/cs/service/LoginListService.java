package cs.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.dao.LoginDao;
import cs.dto.LoginDto;

public class LoginListService implements LoginService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Dao에서 반환리스트인 dtos를 requestScope에 저장
		// 1. Dao 생성
		LoginDao dao = new LoginDao();
		
		// 2. Dao의 list() 실행 -> 반환값을 dtos에 저장
		ArrayList<LoginDto> dtos = dao.list();
		
		// 3. dtos를 requestScope에 저장
		request.setAttribute("dtos", dtos);
		
	}

}
