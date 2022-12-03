<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/doctors.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="Login"/>
	</jsp:include>	
	<div class="container">
		<form action="loginOK.jsp" method="post">
			ID : <input type="text" name = "id"/><br/>
			PW : <input type="text" name = "password"/><br/>
			<button type= "submit">Login</button>
		</form>
	</div>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>