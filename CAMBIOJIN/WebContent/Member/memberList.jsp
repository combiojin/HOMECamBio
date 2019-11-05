<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/head.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$(".mytr").css("cursor", "pointer");
		
		$(".inputbox").click(function(e) {
			var seq = $(this).attr("id");
			$("#"+seq).attr("checked","true");
//				e.preventDefault(); 기본이벤트제거
			e.stopPropagation(); //부모태그 이벤트제거
		});
		
		$(".mytr").on('click' , function(e) {
			var num = $(this).attr("num");
			location.href = "memberListChange.do?num="+num;
		});

	});

	function doDelete() {
		var test = confirm("삭제 하시겠습니까?");
		if (test) {
			$("#myform").attr("action", "memberlistDelete.do");
			$("#myform").submit();
		}
	}
</script>
</head>
<body>
<form action="" method="get" id="myform">
<div class="container">
		<jsp:include page="/menu.jsp" />
		<!-- 중간 -->
		<div class="row"><!-- xs( xm md lg -->
			<div class="col-xs-12">
				<h4 class="text-center">회원 아이디 클릭시 회원 개인정보 수정 가능</h4>
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
					      <th class="justfly-content-center text-center">체크</th>
					    </tr>
					  </thead>
					<c:forEach items="${myList}" var="i">
						<tbody>
							<tr class="mytr" num="${i.num}">
								<th scope="row">${i.num}</th>
								<td>${i.id}</td>
<!-- 								<a href="memberListChange.do" style="color: black;"></a> -->
								<td>${i.name}</td>
								<td>${i.birth}</td>
								<td>${i.gender}</td>
								<td>${i.punmber}</td>
								<td>${i.mail}</td>
								<th class="justfly-content-center text-center">
								<input class="inputbox" id="check${i.num}" type="checkbox" name="num" value="${i.num}">
							</th>
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
					<li class="page-item"><a class="page-link" href="${path}/memberList.do?pageNum=${i}">${i}</a></li>
				</c:forEach>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
				<div class="width50 fl-r" style="margin: 20px 0;  text-align: right;">
					<button type="button" class="btn btn-default" onclick="location.href='singup.do';">회원등록</button>
					<button type="button" class="btn btn-default" onclick="doDelete();">회원삭제</button>
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
</form>	
</body>
</html>