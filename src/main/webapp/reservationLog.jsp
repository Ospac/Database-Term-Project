<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/reservationLog.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	if(session.getAttribute("id") == null){
		response.sendRedirect("index.jsp");
	}
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
	
	String uid = (String) session.getAttribute("id");
	String query = "";
	String isPatient = (String)session.getAttribute("isPatient");
	if (session.getAttribute("id") != null && isPatient.equals("true"))
		query = "select res_id, symptom, p_id, doc_id, state from reservation where p_id = \'" + uid + "\'"; 
	else
		query = "select res_id, symptom, p_id, doc_id, state from reservation where doc_id = \'" + uid + "\'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	%>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="예약 목록"/>
	</jsp:include>	
	<form class="container" action="reservationInfo.jsp" method="post">
		<%
		while(rs.next()) {
			out.println("<button class=\"wrapper\" name=\"reservation\" value =\"" + rs.getString("res_id") + "\">");
			out.println("<img src=\"./resources/medical-list.png\"/>");
			out.println("<div class=\"resInfo\">");
			out.println("<div class=\"hospitalName\"> 예약번호 : " + rs.getString("res_id") + "</div>");
			out.println("<div class=\"doctorInfo\">");
			if (isPatient.equals("true")) {
				out.println("<div class=\"doctorName\"> 의사 : " + rs.getString("doc_id") + "</div>");
				out.println("<div class=\"doctorDept\"> 환자 : " + rs.getString("p_id") +"</div>");
			}
			else {
				out.println("<div class=\"doctorName\"> 환자 : " + rs.getString("p_id") + "</div>");
				out.println("<div class=\"doctorDept\"> 의사 : " + rs.getString("doc_id") +"</div>");
			}
			out.println("</div>");
			out.println("</div>");
			if (rs.getInt("state") == 0)
				out.println("<div class=\"resState resWaitState\">예약중</div>");
			else
				out.println("<div class=\"resState resReadyState\">완료</div>");
			out.println("</button>");
		}
		%>
	</form>
		<%@ include file="/components/footer.jsp" %>
</body>
</html>