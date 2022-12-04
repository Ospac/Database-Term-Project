<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/userInfo.css" rel="stylesheet" type="text/css">
<%
if(session.getAttribute("id") == null){
	response.sendRedirect("login.jsp");
}
%>
<title>Medical Access</title>
</head>
<body>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="내 정보 관리"/>
	</jsp:include>	
	<div class="container">
		<form action="editInfo.jsp" method="post">
			<div class="wrapper">
				<div class="label">아이디</div>
				<input name="id" class="infoInput" disabled value="P000001">
			</div>
			<div class="wrapper">
				<div class="label">이름</div>
				<input name="name" class="infoInput" value="이소율">
			</div>
			<div class="wrapper">
				<div class="label">주소</div>
				<input name="address" class="infoInput" value="대구광역시 북구 아양로4">
			</div>
			<div class="wrapper">
				<div class="label">휴대폰</div>
				<input name="phone" class="infoInput" value="010-5028-6981">
			</div>
			<div class="wrapper">
				<div class="label">혈액형</div>
				<input name="bloodType" class="infoInput" value="AB">
			</div>
			<button type="submit" class="editBtn">수정</button>
		</form>
		<form action="./components/logout.jsp" method="get">
			<button class="logoutBtn">로그아웃</button>
		</form>
	</div>

	<%@ include file="/components/footer.jsp" %>
</body>
</html>