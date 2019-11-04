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
		<div class="row">
			<form action="${path}/boardInsertProc.do">
			<div class="col-xs-12">
			<!-- xs( xm md lg -->
				<div class="form-group">
					<label for="exampleFormControlInput1">제목</label> <input
						type="text" name="title" class="form-control" id="title"
						placeholder="제목">
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">내용</label>
					<textarea class="form-control"  name="content" id="content"
						rows="3" placeholder="내용"></textarea>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">작성자</label> <input
						type="text" class="form-control"  name="writer" id="writer"
						placeholder="작성자">
				</div>
				<div class="width50 fl-r" style="margin: 20px 0; text-align: right;">
					<button type="submit" class="btn btn-default">글작성</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>