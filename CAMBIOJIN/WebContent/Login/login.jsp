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
	
    if(id == ""){
        alert("아이디를 입력하세요.");
    } else if (pwd == "") {
        alert("비밀번호를 입력하세요.");
    } else{
    	$("#myfrm").submit();
    }
//     	location.href='loginProc.do'; 
}
</script>
<%
	Cookie[] cks = request.getCookies();
	String id = "";
	String ck = "";
	if (cks != null) {
		for (int i = 0; i < cks.length; i++) {
			if (cks[i].getName().equals("idsave")) {
				id = cks[i].getValue();
				if (!id.equals("")) {
					ck = "checked";
				}
			}
		}
	}
%>
</head>
<body>
	<div class="container">
		<jsp:include page="/menu.jsp" />
		<!-- 중간 -->
		<div class="row rowpd"><!-- xs( xm md lg -->
			<div class="col-xs-4">
			</div>
			<div class="col-xs-4">
				<form action="${path}/loginProc.do" id="myfrm">
					<div class="form-group">
						<label class="labelfont" for="id">아이디:</label>
						<input type="text" class="form-control" id="id" name="id" value="<%=id%>">
					</div>
					<div class="form-group">
						<label class="labelfont" for="pwd">비밀번호:</label>
						<input type="password" class="form-control" id="pwd" name="pwd">
					</div>
					<div class="checkbox">
						<label><input type="checkbox" name="save" value="true" <%=ck%>> 아이디저장 </label>
					</div>
					<div class="buttondiv">
						<button type="button" class="btn btn-default" onclick="logincheck();" >로그인</button>
					</div>
				</form>
			</div>
			<div class="col-xs-4">
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