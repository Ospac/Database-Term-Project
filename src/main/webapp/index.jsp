<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/index.css" rel="stylesheet" type="text/css">

</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<!-- 진료과목 검색 -->
		<div class="departmentWrapper">
			<div class="departmentHead">진료 과목</div>
			<div class="departmentBody">
				<a>내과</a>
				<a>외과</a>
				<a>이비인후과</a>
				<a>피부과</a>
				<a>소아과</a>
				<a>비뇨기과</a>
				<a>산부인과</a>
				<a>안과</a>
				<a>가정의학과</a>
				<a>소아청소년</a>
			</div>
		</div>
		<!-- 지역검색 -->
		<div class="locationWrapper">
			<div class="locationHead"></div>
			<div class="locationBody">
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
	
</body>
</html>	