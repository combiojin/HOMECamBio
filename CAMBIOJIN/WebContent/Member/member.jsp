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
			<div class="col-xs-12">
				<table class="table table-dark">
					<thead>
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">아이디</th>
					      <th scope="col">이름</th>
					      <th scope="col">생년월일</th>
					      <th scope="col">성별</th>
					      <th scope="col">전화번호</th>
					      <th scope="col">E-mail</th>
					    </tr>
					  </thead>
					<%
// 						List<MemberVO> list = (List) request.getAttribute("myList");
// 						for( MemberVO vo :list)
// 							out.println(vo.getName());
					%>
					<c:forEach items="${myList}" var="i">
						<tbody>
							<tr class="mytr" num="${i.num}">
								<th scope="row">${i.num}</th>
								<td>${i.id}</td>
								<td>${i.name}</td>
								<td>${i.birth}</td>
								<td>${i.gender}</td>
								<td>${i.punmber}</td>
								<td>${i.mail}</td>
							</tr>
						</tbody>	
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<ul class="pagination width50 fl-l">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<c:forEach begin="1" end="${membercnt}" var="i">
					<li class="page-item"><a class="page-link" href="${path}/member.do?pageNum=${i}">${i}</a></li>
				</c:forEach>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
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