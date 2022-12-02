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
	<%
		String departmentName = request.getParameter("department");
	%>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="<%=departmentName%>"/>
	</jsp:include>	
	<div class="container">
		<form class="doctorsContainer" action="reservation.jsp" method="post">
			<button class="doctorWrapper" name="doctor" type="submit" value="D000001">
				<img src="./resources/profile.jpg"/>
				<div class="doctorProfile">
					<div class="doctorName">김서진 의사</div>
					<div class="hospitalName">우리내과의원</div>
				</div>
			</button>
			<button class="doctorWrapper" name="doctor" type="submit" value="D000001">
				<img src="./resources/profile.jpg"/>
				<div class="doctorProfile">
					<div class="doctorName">최창훈 의사</div>
					<div class="hospitalName">우리내과의원</div>
				</div>
			</button>
			<button class="doctorWrapper" name="doctor" type="submit" value="D000001">
				<img src="./resources/profile.jpg"/>
				<div class="doctorProfile">
					<div class="doctorName">김서진 의사</div>
					<div class="hospitalName">우리내과의원</div>
				</div>
			</button>
			<button class="doctorWrapper" name="doctor" type="submit" value="D000001">
				<img src="./resources/profile.jpg"/>
				<div class="doctorProfile">
					<div class="doctorName">김서진 의사</div>
					<div class="hospitalName">우리내과의원</div>
				</div>
			</button>
		</form>
	</div>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>