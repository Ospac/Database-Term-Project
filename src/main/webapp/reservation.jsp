<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/reservation.css" rel="stylesheet" type="text/css">
<title>Medical Access</title>
</head>
<body>
<% 
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "team12";
	String pass = "team12";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	
	String query = "select pat_id, pat_name, blood_type, hos_name, doc_name, dep_name from patient, hospital, doctor, department, reservation where pat_id = 'P000001' and res_id = '" +"R000001"+"' and reservation.doc_id = doctor.doc_id and doctor.dep_id = department.dep_id and department.hos_id = hospital.hos_id";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
%>
	<jsp:include page="/components/header.jsp" flush="true">
    <jsp:param name="headerTitle" value="예약"/>
	</jsp:include>	
		
	<form class="container" action="setReservation.jsp" method="post">
		<div class="patientWrapper">
			<div class="title">진료 대상</div>
			<div class="patientInfo">
				<img src="./resources/profile.jpg">
				<div class="patientProfile">
				<%
				while(rs.next()){
					out.println("<div class=\"patientID\">" +rs.getString("pat_id")+ "</div>");
					out.println("<div class=\"patientName\">" +rs.getString("pat_name") + "</div>");
					out.println("<div class=\"patientBloodInfo\">" +rs.getString("blood_type") + "</div>");
				}
				%>
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