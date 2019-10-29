<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/head.jsp"%>
<%
	session.invalidate(); // 전체삭제 
%>
</head>
<body>
	<div class="container">
		<jsp:include page="/menu.jsp" />
		<div class="row">
			<div class="col-xs-4"></div>
			<div class="col-xs-4">
				<form action="${path}/index.do">
					<div class="form-group">
						<h4 class="center">로그아웃 완료 되었습니다.<br><br>
							확인 버튼 클릭시 메인페이지로 이동합니다.
							
						</h4>
					</div>
					<div class="buttondiv">
						<button type="submit" class="btn btn-default">확인</button>
					</div>
				</form>
			</div>
			<div class="col-xs-4"></div>
		</div>
	</div>
</body>
</html>