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
		<div class="row"><!-- xs( xm md lg -->
			<div class="col-xs-9">
				<table class="table">
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>생년월일</td>
						<td>성별</td>
						<td>전화번호</td>
						<td>E-MAIL</td>
					</tr>
					<%
// 						List<MemberVO> list = (List) request.getAttribute("myList");
// 						for( MemberVO vo :list)
// 							out.println(vo.getName());
					%>
					<c:forEach items="${myList}" var="i">
						<tr>
							<td>${i.id}</td>
							<td>${i.name}</td>
							<td>${i.birth}</td>
							<td>${i.gender}</td>
							<td>${i.pnumber}</td>
							<td>${i.mail}</td>
						</tr>
					</c:forEach>
				</table>
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