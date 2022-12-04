<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/loginOK.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="Login"/>
	</jsp:include>	
	<div class='container'>
		<form action="login.jsp" method="post">
			<div class='loginMsg'>로그인 실패: 아이디와 패스워드를 다시 확인하세요</div>
			<button type= "submit">이전</button>
		</form>
	</div>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>