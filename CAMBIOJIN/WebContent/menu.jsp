<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 머리 -->
<div id="head1">
	<%
		String login = (String)session.getAttribute("login");
		String id = (String) session.getAttribute("id");
		String loginId = (String) session.getAttribute("id");
	%>
	<div class="col-xs-12 mymenu1">
		<a href="index.do"><img class="logoimg" src="Image/logo_white.png"/></a>
		<ul class="fl-r">
		<% if (login != null && login.equals("sce") && (loginId.equals("admin") != login.equals("sce")) ){ %>
			<li><a href="memberMypage.do">내정보</a></li>
			<li><a href="logOut.do">로그아웃</a></li>
		<%} else if (login != null && loginId.equals("admin")){%>
			<li><a href="memberList.do">회원정보</a></li>
			<li><a href="logOut.do">로그아웃</a></li>
		<%} else { %>		
			<li><a href="singup.do">회원가입</a></li>
			<li><a href="login.do">로그인</a></li>
		<%} %>	
		</ul>
	</div>
	<div class="col-xs-12 mymenu2">
		<ul class="fl-r"">
			<li><a href="board.do">게시판</a></li>
			<li><a href="member.do">회원목록</a></li>
		</ul>
	</div>
<div class="row">
	<div>
	
	</div>
</div>	
</div>