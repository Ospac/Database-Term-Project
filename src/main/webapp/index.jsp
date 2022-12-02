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
	<%@ include file="/components/header.jsp" %>
	<div class="container">
		<!-- 진료 과목 검색 -->
		<div class="departmentWrapper">
			<div class="departmentHead">진료 과목</div>
			<form class="departmentBody" action="doctors.jsp" method="post">
				<input name="department" type="submit" value="내과">
				<input name="department" type="submit" value="외과">
				<input name="department" type="submit" value="이비인후과">
				<input name="department" type="submit" value="피부과">
				<input name="department" type="submit" value="소아과">
				<input name="department" type="submit" value="비뇨기과">
				<input name="department" type="submit" value="산부인과">
				<input name="department" type="submit" value="안과">
				<input name="department" type="submit" value="가정의학과">
				<input name="department" type="submit" value="소아청소년">
			</form>
		</div>
		<!-- 약국 검색 -->
		<div class="locationWrapper">
			<div class="locationHead"></div>
			<div class="locationBody">
			</div>
		</div>
	</div>
	<%@ include file="/components/footer.jsp" %>
	
</body>
</html>	