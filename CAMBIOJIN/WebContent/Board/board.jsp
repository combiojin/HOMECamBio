<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/head.jsp" %>
	<%
		String login = (String)session.getAttribute("login");
		String id = (String) session.getAttribute("id");
		String loginId = (String) session.getAttribute("id");
	%>
<script type="text/javascript">
$(document).ready(function() {
	$(".mytr").css("cursor", "pointer");

});

function doDelete() {
	var test = confirm("삭제 하시겠습니까?");
	if (test) {
		$("#myform").attr("action", "boardDelete.do");
		$("#myform").submit();
	}
}
</script>	
</head>
<body>
<div class="container">
		<jsp:include page="/menu.jsp" />
		<!-- 중간 -->
		<div class="row"><!-- xs( xm md lg -->
			<div class="col-xs-12">
				<table class="table talbe-dark">
					<thead>
					  <tr>
					      <th scope="col">번호</th>
					      <th scope="col">제목</th>
					      <th scope="col">내용</th>
					      <th scope="col">작성시간</th>
					      <th scope="col">작성자</th>
					      <% if (login != null && loginId.equals("admin")){%>
					      <th class="justfly-content-center text-center">체크</th>
					      <%} %>
   					    </tr>
					  </thead>
					<%
// 						List<MemberVO> list = (List) request.getAttribute("myList");
// 						for( MemberVO vo :list)
// 							out.println(vo.getName());
					%>
					<c:forEach items="${BoardList}" var="i">
						<tbody>
							<tr class="mytr" num="${i.num}">
								<th scope="row"><a href="boardWriter.do" style="color: black;">${i.num}</a></th>
								<td>${i.title}</td>
								<td>${i.content}</td>
								<td>${i.moddate}</td>
								<td>${i.writer}</td>
								<% if (login != null && loginId.equals("admin")){%>
								<th class="justfly-content-center text-center">
								<input class="inputbox" id="check${i.num}" type="checkbox" name="num" value="${i.num}">
								<%} %>
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
				<c:forEach begin="1" end="${boardcnt}" var="i">
					<li class="page-item"><a class="page-link" href="${path}/board.do?pageNum=${i}">${i}</a></li>
				</c:forEach>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
				<div class="width50 fl-r" style="margin: 20px 0; text-align: right;">
				<% if (login != null && login.equals("sce") && (loginId.equals("admin") != login.equals("sce")) ){ %>
					<button type="button" class="btn btn-default" onclick="location.href='boardInsert.do';">글작성</button>
				<%} else if (login != null && loginId.equals("admin")){%>
					<button type="button" class="btn btn-default" onclick="location.href='boardInsert.do';">글작성</button>
					<button type="button" class="btn btn-default" onclick="doDelete();">글삭제</button>
				<%} 
				%>
				</div>	
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