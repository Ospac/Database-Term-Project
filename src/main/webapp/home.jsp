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
<%
		String pid = request.getParameter("id");
%>
</head>
<body>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="Login"/>
	</jsp:include>	
	<div class="container">
		<form action="index.jsp" method="post">
			<input type = "hidden" name = "id" value="<%=pid%>"/>
			<button type= "submit">병원찾으러 가기</button>
		</form>
		<form action="searchParmacy.jsp" method="post">
			<input type = "hidden" name = "id" value="<%=pid%>"/>
			<button type= "submit">약국찾으러 가기</button>
		</form>
	</div>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>