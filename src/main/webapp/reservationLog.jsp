<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/reservationLog.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="예약 내역"/>
	</jsp:include>	
	<%@ include file="/components/footer.jsp" %>
	<form class="container" action="reservationInfo.jsp" method="post">
		<button class="wrapper" name="reservation" value="R000001">
			<img src="./resources/diagnosis.png"/>
			<div class="resInfo">
				<div class="hospitalName">김가정의학과-외과의원</div>
				<div class="doctorInfo">
					<div class="doctorName">송우진 의사</div>
					<div class="doctorDept">외과</div>
				</div>
			</div>
			<div class="resState resWaitState">예약 대기</div>
			
		</button>
	</form>
</body>
</html>