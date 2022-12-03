<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/reservation.css" rel="stylesheet" type="text/css">
<title>Medical Access</title>
</head>
<body>
	<jsp:include page="/components/header.jsp" flush="true">
    <jsp:param name="headerTitle" value="예약"/>
	</jsp:include>	
		
	<form class="container" action="setReservation.jsp" method="post">
		<div class="patientWrapper">
			<div class="title">진료 대상</div>
			<div class="patientInfo">
				<img src="./resources/profile.jpg">
				<div class="patientProfile">
					<div class="patientID">P000001</div>
					<div class="patientName">이소율</div>
					<div class="patientBloodInfo">AB형</div>
				</div>
			</div>
		</div>
		<div class="patientWrapper">
			<div class="title">의사 정보</div>
			<div class="patientInfo">
				<img src="./resources/profile.jpg">
				<div class="patientProfile">
					<div class="patientID">내과</div>
					<div class="patientName">김서진</div>
					<div class="patientBloodInfo">우리내과의원</div>
				</div>
			</div>
		</div>
		<div class="symptomWrapper">
			<div class="title">증상 입력</div>
			<textarea name="symptom" class="symptomInput" placeholder="ex) 감기기운, 두통 및 콧물">
			</textarea>
		</div>
		<button type="submit" class="reservationBtn">진료 신청</button>
	</form>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>