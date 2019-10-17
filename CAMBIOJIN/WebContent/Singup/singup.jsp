<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/head.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<jsp:include page="/menu.jsp" />
		<!-- 중간 -->
		<div class="row"><!-- xs( xm md lg -->
			<div class="col-xs-4 singup">
			</div>
			<div class="col-xs-4 singup">
				<form action="${path}/memberInsertProc.do">
					<div class="form-group">
						<label for="id">ID:</label>
						<input type="text" class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label>
						<input type="password" class="form-control" id="pwd" name="pwd">
					</div>
					<div class="form-group">
						<label for="id">Confirm Password:</label>
						<input type="password" class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="pwd">name:</label>
						<input type="text" class="form-control" id="pwd" name="pwd">
					</div>
					<div class="form-group">
						<label for="id">the date of one’s birth:</label>
						<input type="text" class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="pwd">Gender:</label>
						<input type="text" class="form-control" id="pwd" name="pwd">
					</div>
					<div class="form-group">
						<label for="id">Phone number:</label>
						<input type="text" class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="pwd">E-mail:</label>
						<input type="text" class="form-control" id="pwd" name="pwd">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
			<div class="col-xs-4 singup">
			</div>
		</div>
		<!-- 발 -->
		<div class="row">
			<div class="col text-center">
				COPYRIGHT ⓒ 2019 CAMBIOJIN ALL RIGHTS RESERVED.
			</div>
		</div>
</body>
</html>