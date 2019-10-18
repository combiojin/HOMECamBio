package com.cambio.org;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		request.setCharacterEncoding("UTF-8");
		String reqURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = reqURI.substring(contextPath.length());

		if( cmd.equals("/index.do")) {
			rd = request.getRequestDispatcher("index.jsp");
		}
		else if(cmd.equals("/login.do")) {
			rd = request.getRequestDispatcher("/Login/login.jsp");
		}
		else if(cmd.equals("/singup.do")) {
			rd = request.getRequestDispatcher("/Singup/singup.jsp");
		}
		else if(cmd.equals("/memberForm.do")) {
			rd = request.getRequestDispatcher("/Member/memberForm.jsp");
		}
		else if(cmd.equals("/memberProc.do")) {
			rd = request.getRequestDispatcher("/Member/member.jsp");
		}
	
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
