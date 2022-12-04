<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/default.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>

</head>
<body>
	<%
		if(session.getAttribute("id") == null){
			response.sendRedirect("login.jsp");
		}
	%>
	<%@ include file="/components/header.jsp" %>
	
	<%@ include file="/components/footer.jsp" %>
</body>
</html>