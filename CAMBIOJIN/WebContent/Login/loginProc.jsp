<%@page import="com.cambio.org.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/head.jsp" %>
</head>
<body>
<div class="container">
		<jsp:include page="/menu.jsp" />
		<!-- 중간 -->
		<div class="row rowpd">	
		<div class="col-xs-4 singup"></div>
			<div class="col-xs-4 singup">
				<form action="${path}/singupProc.do">
					<%
						String id = request.getParameter("id");
						String pwd = request.getParameter("pwd");

						String checkvalue = request.getParameter("idsave");
				
						if (checkvalue != null) {
							//저장
							Cookie cookie = new Cookie("idsave", id);
							cookie.setMaxAge(1 * 60 * 60 * 24);
							response.addCookie(cookie);
						} else {
							Cookie cookie = new Cookie("idsave", "");
							cookie.setMaxAge(1 * 60 * 60 * 24);
							response.addCookie(cookie);
						}

						MemberDAO md = MemberDAO.getInstance();
						boolean result = md.checkLogin(request, id, pwd);

						if (id == null)
							out.println("아이디를 입력하세요.");
						else if (pwd == null)
							out.println("비밀번호를 입력하세요.");

						if (result == true) {
							session.setAttribute("login", "sce");
							session.setAttribute("id", id);
												
						}
								
						String loginId = (String) session.getAttribute("id");
						
						if(loginId.equals("admin"))
						{
							out.println("<h3>관리자 계정으로 로그인 하였습니다.</h3> <h3>확인 버튼 클릭시 메인페이지로 이동합니다.</h3><br>");
						}else{
							out.println("<h3>로그인에 성공하였습니다.</h3> <h3>확인 버튼 클릭시 메인페이지로 이동합니다.</h3><br>");
						}
					%>
				</form>	
			</div>
		</div>		
		<!-- 발 -->
		<div class="row">
			<div class="col text-center">
				COPYRIGHT ⓒ 2019 CAMBIOJIN ALL RIGHTS RESERVED.
			</div>
		</div>
	</div>
</body>
</html>