<%@page import="com.cambio.org.member.MemberDTO"%>
<%@page import="com.cambio.org.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/head.jsp"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String cpwd = request.getParameter("cpwd");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String punmber = request.getParameter("punmber");
	String mail = request.getParameter("mail");
	
	MemberDAO md = MemberDAO.getInstance();
	boolean result = md.memberUpdateList(request, id, pwd, cpwd, name, birth, gender, punmber, mail);
	if (result == true) {
		session.setAttribute("login", "sce");
		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);
		session.setAttribute("cpwd", cpwd);
		session.setAttribute("name", name);
		session.setAttribute("birth", birth);
		session.setAttribute("gender", gender);
		session.setAttribute("punmber", punmber);
		session.setAttribute("mail", mail);
	}
	
	String myid = (String) session.getAttribute("id");
	String mypwd = (String) session.getAttribute("pwd");
	String mycpwd = (String) session.getAttribute("cpwd");
	String myname = (String) session.getAttribute("name");
	String mybirth = (String) session.getAttribute("birth");
	String mygender = (String) session.getAttribute("gender");
	String mypunmber = (String) session.getAttribute("punmber");
	String mymail = (String) session.getAttribute("mail");
%>
</head>
<body>
	<div class="container">
		<jsp:include page="/menu.jsp" />
		<!-- 중간 -->
		<div class="row rowpd">
			<!-- xs( xm md lg -->
			<div class="col-xs-3 singup"></div>
			<div class="col-xs-6 singup">
				<form action="${path}//memberMypage.do">
					<h3>비밀번호 / 전화번호 / E-MAIL 수정 가능합니다.</h3>
					<c:forEach items="${mypage}" var="i">
					<div class="form-group">
						<label class="labelfont" for="id">아이디:</label> <input type="text"
							class="form-control" id="id" name="id" value="${myid}"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label class="labelfont" for="pwd">비밀번호:</label> <input
							type="password" class="form-control" id="pwd" name="pwd"
							value="${mypwd}">
					</div>
					<div class="form-group">
						<label class="labelfont" for="cpwd">비밀번호 확인:</label> <input
							type="password" class="form-control" id="cpwd" name="cpwd"
							value="${mycpwd}">
					</div>
					<div class="form-group">
						<label class="labelfont" for="name">이름:</label> <input type="text"
							class="form-control" id="name" name="name" value="${myname}"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label class="labelfont" for="birth">생년월일:</label> <input
							type="text" class="form-control" id="birth" name="birth"
							value="${mybirth}" disabled="disabled">
					</div>
					<div class="form-group">
						<label class="labelfont" for="gender">성별:</label> <input
							type="text" class="form-control" id="gender" name="gender"
							value="${mygender}" disabled="disabled">
					</div>
					<div class="form-group">
						<label class="labelfont" for="pnumber">전화번호:</label> <input
							type="text" class="form-control" id="punmber" name="punmber"
							value="${mypunmber}">
					</div>
					<div class="form-group">
						<label class="labelfont" for="mail">E-mail:</label> <input
							type="text" class="form-control" id="mail" name="mail"
							value="${mymail}">
					</div>
					</c:forEach>
					<div class="buttondiv">
						<button type="submit" class="btn btn-default">수정</button>
					</div>
				</form>
			</div>
			<div class="col-xs-2 singup"></div>
		</div>
	</div>
	<!-- 발 -->
	<div class="row">
		<div class="col text-center">COPYRIGHT ⓒ 2019 CAMBIOJIN ALL
			RIGHTS RESERVED.</div>
	</div>
</body>
</html>