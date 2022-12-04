<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		if(session.getAttribute("id") != null){
			response.sendRedirect("index.jsp");
		}
	%>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="Login"/>
	</jsp:include>	
	<div class="container">
		<form class="loginForm" action="loginOK.jsp" method="post">
			<div class="wrapper">
				<input type="text" name = "id" placeholder="아이디"/><br/>
				<input type="password" name = "password" placeholder="비밀번호"/><br/>
			</div>
			<button type= "submit">로그인</button>
			<div class="memberCheck">
				<input id="pat" type="radio" name="isPatient" value="true" checked/>
				<label for="pat">환자 회원</label>
				<input id="doc" type="radio" name="isPatient" value="false"/>
				<label for="doc">의사 회원</label>
			</div>
		</form>
	</div>
	
</body>
</html>