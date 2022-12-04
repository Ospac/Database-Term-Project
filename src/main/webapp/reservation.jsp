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
	String pid = session.getAttribute("id");
	String docid = request.getParameter("doctor");	
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
	
	String query = "select pat_id, pat_name, blood_type from patient where pat_id = '"+pid+"'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();	
%>
	<jsp:include page="/components/header.jsp" flush="true">
    <jsp:param name="headerTitle" value="예약"/>
	</jsp:include>
	<div style="overflow:auto; width:400px; height: 600px;">	
	<form class="container" action="checkSchedule.jsp" method="post">
		<%
		while(rs.next()) {
			out.println("<div class=\"patientWrapper\">");
			out.println("<div class=\"title\">진료 대상</div>");
			out.println("<div class=\"patientInfo\">");
			out.println("<img src=\"./resources/profile.jpg\">");
			out.println("<div class=\"patientProfile\">");
			out.println("<div class=\"patientID\">" + rs.getString("pat_id")+"</div>");
			out.println("<div class=\"patientName\">" + rs.getString("pat_name")+"</div>");
			out.println("<div class=\"patientBloodInfo\">" + rs.getString("blood_type")+"</div>");
			out.println("</div>");
			out.println("</div>");
			out.println("</div>");
		}
		query = "select dep_name, doc_name, hos_name from department, doctor, hospital where department.hos_id = hospital.hos_id and department.dep_id = doctor.dep_id and doc_id = '"+docid+"'";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();	
		while(rs.next())
		{
			out.println("<div class=\"patientWrapper\">");
			out.println("<div class=\"title\">의사 정보</div>");
			out.println("<div class=\"patientInfo\">");
			out.println("<img src=\"./resources/profile.jpg\">");
			out.println("<div class=\"patientProfile\">");
			out.println("<div class=\"patientID\">" + rs.getString("dep_name")+"</div>");
			out.println("<div class=\"patientName\">" + rs.getString("doc_name")+"</div>");
			out.println("<div class=\"patientBloodInfo\">" + rs.getString("hos_name")+"</div>");
			out.println("</div>");
			out.println("</div>");
			out.println("</div>");
		}
		%>
		<div class="symptomWrapper">
			<div class="title">증상 입력</div>
			<textarea name="symptom" class="symptomInput" placeholder="ex) 감기기운, 두통 및 콧물">
			</textarea>
		</div>
		<button type="submit" class="reservationBtn">일정 확인</button>
	</form>
	</div>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>