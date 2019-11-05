<%@page import="com.cambio.org.member.MemberDTO"%>
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
				<form action="${path}/index.do">
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
		
						if (result == true) {
							session.setAttribute("login", "sce");
// 							session.setAttribute("id", id);
							
						}
						
						String loginId = (String) session.getAttribute("id");
						
						if (loginId != null && loginId.equals("admin")) {
					%>
					<div class="form-group">
						<h4 class="center">
							관리자 계정으로 로그인 하였습니다.<br>
							<br> 확인 버튼 클릭시 메인페이지로 이동합니다.
						</h4>
					</div>
					<div class="buttondiv">
						<button type="submit" class="btn btn-default">확인</button>
					</div>
					<%
						} else if( loginId != null ) {
					%>
					<div class="form-group">
						<h4 class="center">
							로그인 성공 하였습니다.<br>
							<br> 확인 버튼 클릭시 메인페이지로 이동합니다.
						</h4>
					</div>
					<div class="buttondiv">
						<button type="submit" class="btn btn-default">확인</button>
					<% 
					} else{
					%>
					<div class="form-group">
						<h4 class="center">
							아이디와 비밀번호를 확인하세요<br>
							<br> 확인 버튼 클릭시 로그인 화면으로 이동합니다.
						</h4>
					</div>
					<div class="buttondiv">
						<button type="button" onclick="location.href='login.do'"
							class="btn btn-default">확인</button>
					</div>
					<% 	
					}
					%>	
					</div>
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