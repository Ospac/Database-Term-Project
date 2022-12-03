<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/doctorInfo.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="의사 정보"/>
	</jsp:include>	
	
	
	<%@ include file="/components/footer.jsp" %>
</body>
</html>