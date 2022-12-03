<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/reservation.css" rel="stylesheet" type="text/css">
<title>Medical Access</title>
	<%
		String timeinfo = request.getParameter("docSchedule");
		String doc_id = request.getParameter("doctor");
		String pid = request.getParameter("pid");
	%>
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
	
	String query = "select pat_id, pat_name, blood_type, hos_name, doc_name, dep_name from hospital, doctor, department, reservation, patient where patient.pat_id = 'P000001' and doctor.doc_id = 'D000096' and reservation.doc_id = doctor.doc_id and doctor.dep_id = department.dep_id and department.hos_id = hospital.hos_id";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	out.println(timeinfo);
%>
	<jsp:include page="/components/header.jsp" flush="true">
    <jsp:param name="headerTitle" value="예약"/>
	</jsp:include>	
	<form class="container" action="setReservation.jsp" method="post">
	<div style="overflow:scroll; width:400px; height:600px;">
		<input type = "hidden" name = "id" value="<%=pid%>"/>
		<div class="title"><%=timeinfo %></div>
			<%
			while(rs.next()){
				out.println("<div class=\"patientWrapper\">");
				out.println("<div class=\"title\">진료 대상</div>");
				out.println("<div class=\"patientInfo\">");
				out.println("<img src=\"./resources/profile.jpg\">");
				out.println("<div class=\"patientProfile\">");
				out.println("<div class=\"paitentID\">" +rs.getString("pat_id")+ "</div>");
				out.println("<div class=\"patientName\">" +rs.getString("pat_name") + "</div>");
				out.println("<div class=\"patientBloodtype\">" +rs.getString("blood_type") + "</div>");
				out.println("</div>");
				out.println("</div>");
				out.println("</div>");
				out.println("<div class=\"patientWrapper\">");
				out.println("<div class=\"title\">의사 정보</div>");
				out.println("<div class=\"patientInfo\">");
				out.println("<img src=\"./resources/profile.jpg\">");
				out.println("<div class=\"patientProfile\">");
				out.println("<div class=\"departmentName\">" +rs.getString("dep_name")+ "</div>");
				out.println("<div class=\"doctorName\">" +rs.getString("doc_name") + "</div>");
				out.println("<div class=\"hospitalName\">" +rs.getString("hos_name") + "</div>");
				out.println("</div>");
				out.println("</div>");
				out.println("</div>");
			}
			%>
		<div class="symptomWrapper">
			<div class="title">증상 입력</div>
			<textarea name="symptom" class="symptomInput" placeholder="ex) 감기기운, 두통 및 콧물"></textarea>
		</div>
		<button type="submit" class="reservationBtn">진료 신청</button>
		<br>
		<br>
	</div>
	</form>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>