package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/*
 * 	서블릿 클래스를 만들기 위한 절차
 * 	1. HttpServlet클래스를 상속한다
 * 	2. 클라이언트의 요청을 받아
 * 	3.
 * 	4.
 * 
 */
public class HelloServlet extends HttpServlet {
	//직렬화된 클래스의 버전 관리에 사용되는 식별자
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException
	{
		req.setAttribute("message", "HelloServlet..!!");
		req.getRequestDispatcher("/12Servlet/HelloServlet.jsp").forward(req, resp);
	}
	
}
