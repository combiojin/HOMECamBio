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
	String id = (String) session.getAttribute("id");
	String pwd = (String) session.getAttribute("pwd");
	String cpwd = (String) session.getAttribute("cpwd");
	String name = (String) session.getAttribute("name");
	String birth = (String) session.getAttribute("birth");
	String gender = (String) session.getAttribute("gender");
	String punmber = (String) session.getAttribute("punmber");
	String mail = (String) session.getAttribute("mail");
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
					<div class="form-group">
						<label class="labelfont" for="id">아이디:</label> <input type="text"
							class="form-control" id="id" name="id" value="${id}" readonly>
					</div>
					<div class="form-group">
						<label class="labelfont" for="pwd">비밀번호:</label> <input
							type="password" class="form-control" id="pwd" name="pwd"
							value="${pwd}">
					</div>
					<div class="form-group">
						<label class="labelfont" for="cpwd">비밀번호 확인:</label> <input
							type="password" class="form-control" id="cpwd" name="cpwd"
							value="${cpwd}">
					</div>
					<div class="form-group">
						<label class="labelfont" for="name">이름:</label> <input type="text"
							class="form-control" id="name" name="name" value="${name}">
					</div>
					<div class="form-group">
						<label class="labelfont" for="birth">생년월일:</label> <input
							type="text" class="form-control" id="birth" name="birth"
							value="${birth}">
					</div>
					<div class="form-group">
						<label class="labelfont" for="gender">성별:</label> <input
							type="text" class="form-control" id="gender" name="gender"
							value="${gender}">
					</div>
					<div class="form-group">
						<label class="labelfont" for="pnumber">전화번호:</label> <input
							type="text" class="form-control" id="punmber" name="punmber"
							value="${punmber}">
					</div>
					<div class="form-group">
						<label class="labelfont" for="mail">E-mail:</label> <input
							type="text" class="form-control" id="mail" name="mail"
							value="${mail}">
					</div>
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