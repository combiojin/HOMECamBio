package com.cambio.org;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cambio.org.board.BoardDAO;
import com.cambio.org.member.MemberDAO;
import com.cambio.org.member.MemberDTO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDAO dm = MemberDAO.getInstance();
	private BoardDAO db = BoardDAO.getInstance();

    public MainController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		request.setCharacterEncoding("UTF-8");
		String reqURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = reqURI.substring(contextPath.length());

		//홈
		if( cmd.equals("/index.do")) {
			rd = request.getRequestDispatcher("/index.jsp");
		}
		//로그인
		else if(cmd.equals("/login.do")) {
			rd = request.getRequestDispatcher("/Login/login.jsp");
		}
		else if(cmd.equals("/loginProc.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			dm.checkLogin(request, id, pwd);
			rd = request.getRequestDispatcher("/Login/loginProc.jsp");
		}
		//로그아웃
		else if(cmd.equals("/logOut.do")) {
			rd = request.getRequestDispatcher("/Login/logOut.jsp");
		}
		//회원가입
		else if(cmd.equals("/singup.do")) {
			rd = request.getRequestDispatcher("/Singup/singup.jsp");
		}
		else if(cmd.equals("/singupProc.do")) {
			dm.memberinsert(request);
			rd = request.getRequestDispatcher("/index.jsp");
		}
		//회원목록
		else if(cmd.equals("/member.do")) {
			dm.memberlistSelect(request);
			dm.cntmember(request);
			rd = request.getRequestDispatcher("/Member/member.jsp");
		}
		else if(cmd.equals("/memberProc.do")) {
			rd = request.getRequestDispatcher("/Member/member.jsp");
		}
		//마이페이지
		else if(cmd.equals("/memberMypage.do")) {
			rd = request.getRequestDispatcher("/Member/memberMypage.jsp");
		}
		//마이페이지 수정
		else if(cmd.equals("/memberMypageProc.do")) {
			dm.mypageUpdate(request);
			dm.mypageMember(request);
			rd = request.getRequestDispatcher("/Member/memberMypageProc.jsp");
		}
		//관리자 계정 회원정보 수정
		else if(cmd.equals("/memberList.do")) {
			dm.memberlistSelect(request);
			dm.cntmember(request);
			rd = request.getRequestDispatcher("/Member/memberList.jsp");
		}
		else if(cmd.equals("/memberListChange.do")) {
			dm.mypageMember(request);
			rd = request.getRequestDispatcher("/Member/memberListChange.jsp");
		}
		else if(cmd.equals("/memberListChangeProc.do")) {
			dm.mypageMember(request);
			dm.mypageUpdate(request);
			dm.memberlistSelect(request);
			rd = request.getRequestDispatcher("/Member/memberList.jsp");
		}
		//회원탈퇴
		else if(cmd.equals("/memberDelete.do")) {
			String id = request.getParameter("id");
			dm.mypageDelete(request, id);
			rd = request.getRequestDispatcher("/Member/memberDelete.jsp");
		}
		else if(cmd.equals("/memberlistDelete.do")) {
			String[] nums = request.getParameterValues("num");
			dm.memberlistDelete(request, nums);
			dm.memberlistSelect(request);
			dm.cntmember(request);
			rd = request.getRequestDispatcher("/Member/memberList.jsp");
		}
		//게시판
		else if(cmd.equals("/board.do")) {
			db.boardlistSelect(request);
			db.cntboard(request);
			rd = request.getRequestDispatcher("/Board/board.jsp");
		}
		else if(cmd.equals("/boardInsert.do")) {
			rd = request.getRequestDispatcher("/Board/boardInsert.jsp");
		}
		else if(cmd.equals("/boardInsertProc.do")) {
			db.boardinsert(request);
			db.boardlistSelect(request);
			db.cntboard(request);
			response.sendRedirect("board.do");
			return;
		}
		else if(cmd.equals("/boardUpdate.do")) {
			db.boardselectRow(request);
			rd = request.getRequestDispatcher("/Board/boardUpdate.jsp");
		}
		else if(cmd.equals("/boardUpdateProc.do")) {
			db.boardupdateRow(request);
			db.boardlistSelect(request);
			rd = request.getRequestDispatcher("/Board/board.jsp");
		}
		else if(cmd.equals("/boardDelete.do")) {
			String[] nums = request.getParameterValues("num");
			db.boardlistDelete(request, nums);
			db.boardlistSelect(request);
			db.cntboard(request);
			response.sendRedirect("board.do");
			return;
		}
		//에러페이지
		else {
			rd = request.getRequestDispatcher("/Error.jsp");
		}
				
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
