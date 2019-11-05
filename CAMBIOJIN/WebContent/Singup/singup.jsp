<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/head.jsp" %>
<script type="text/javascript">
function logincheck() {
	var id = document.getElementById('id').value;
	var pwd = document.getElementById('pwd').value;
	var cpwd = document.getElementById('cpwd').value;
	
    if(id == ""){
        alert("아이디를 입력하세요.");
    } else if (pwd == "") {
        alert("비밀번호를 입력하세요.");
    } else if (pwd != cpwd) {
    	alert("비밀번호가 틀렸습니다. 다시 입력해주세요.")	
    } else{
    	$("#myfrm").submit();
    }
//     	location.href='loginProc.do'; 
}
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/menu.jsp" />
		<!-- 중간 -->
		<div class="row rowpd">
			<!-- xs( xm md lg -->
			<div class="col-xs-4 singup">
			</div>
			<div class="col-xs-4 singup">
				<form action="${path}/singupProc.do" id="myfrm">
					<div class="form-group">
						<label class="labelfont" for="id">아이디:</label> <input type="text"
							class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label class="labelfont" for="pwd">비밀번호:</label> <input
							type="password" class="form-control" id="pwd" name="pwd">
					</div>
					<div class="form-group">
						<label class="labelfont" for="cpwd">비밀번호 확인:</label> <input
							type="password" class="form-control" id="cpwd" name="cpwd">
					</div>
					<div class="form-group">
						<label class="labelfont" for="name">이름:</label> <input type="text"
							class="form-control" id="name" name="name">
					</div>
					<div class="form-group">
						<label class="labelfont" for="birth">생년월일:</label> <input
							type="text" class="form-control" id="birth" name="birth">
					</div>
					<div class="form-group">
						<label class="labelfont" for="gender">성별:</label> <input
							type="text" class="form-control" id="gender" name="gender">
					</div>
					<div class="form-group">
						<label class="labelfont" for="pnumber">전화번호:</label> <input
							type="text" class="form-control" id="punmber" name="punmber">
					</div>
					<div class="form-group">
						<label class="labelfont" for="mail">E-mail:</label> <input
							type="text" class="form-control" id="mail" name="mail">
					</div>
					<div class="buttondiv">
						<button type="button" class="btn btn-default" onclick="logincheck();">회원가입</button>
					</div>
				</form>
			</div>
			<div class="col-xs-4 singup">
			</div>
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