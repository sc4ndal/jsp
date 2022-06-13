package cs.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.dao.LoginDao;
import cs.dto.LoginDto;
import cs.service.LoginInsertService;
import cs.service.LoginListService;
import cs.service.LoginService;

@WebServlet("*.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
//		out.println("안녕하시오");
//		out.println(uri);
//		out.println(uri.lastIndexOf("/"));
//		out.println(uri.lastIndexOf(".do"));
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
//		out.println(com);
		LoginDao dao = null;
		String viewPage=null;
		
		if(com != null && com.trim().equals("list")) {

			LoginService ser = new LoginListService();
			ser.execute(request, response);
			
			viewPage = "WEB-INF/test1/list.jsp";
			
		}else if(com != null && com.trim().equals("insertForm")) {
//			out.println("insertForm으로 들어왔습니다");
			viewPage = "WEB-INF/test1/insertForm.jsp";
			
		}else if(com != null && com.trim().equals("insert")) {
			LoginService ser = new LoginInsertService();
			ser.execute(request, response);
			viewPage = "list.do";
			
		}else if(com != null && com.trim().equals("index")) {
			viewPage = "WEB-INF/test1/index.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
