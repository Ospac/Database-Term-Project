<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("id") == null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/reservationInfo.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
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
	
	String rid = request.getParameter("reservation");
	String query = "select symptom, state, doc_id, p_id from reservation where res_id = \'"+ rid +"\'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
	rs.next();
	
	String symptom = rs.getString("symptom");
 	int state = rs.getInt("state");
 	String doc_id = rs.getString("doc_id");
 	String p_id = rs.getString("p_id");
 	
%>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="예약 정보"/>
	</jsp:include>	
	<div class="container">
		<div class="resInfoWrapper">
			<img src="./resources/diagnosis.png"/>
			<div class="doc_information">
			<%
				if(session.getAttribute("isPatient").equals("true")){
					query = "select doc_name, dep_name, hos_name from doctor D, hospital H, department DEP where DEP.dep_id = D.dep_id and DEP.hos_id = H.hos_id and doc_id = \'"+ doc_id +"\'";
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					rs.next();
					
					out.println("<div class=\"resInfo\">");
						out.println("<div class=\"hospitalName\">" + rs.getString("hos_name") + "</div>");
						out.println("<div class=\"doctorInfo\">");
							out.println("<div class=\"doctorName\">" +rs.getString("doc_name") + " 의사 </div>");
							out.println("<div class=\"doctorDept\">" +rs.getString("dep_name") + "</div>");
						out.println("</div>");
					out.println("</div>");
				}
				else{
					query = "select pat_name, pat_address, sex, blood_type from patient where pat_id = \'"+ p_id +"\'";
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					rs.next();
					
					out.println("<div class=\"resInfo\">");
						out.println("<div class=\"hospitalName\">" + rs.getString("pat_name") + "</div>");
						out.println("<div class=\"doctorInfo\">");
							out.println("<div class=\"doctorName\">" +rs.getString("sex") + " </div>");
							out.println("<div class=\"doctorDept\">" +rs.getString("blood_type") + "</div>");
						out.println("</div>");
					out.println("</div>");
				}
			%>
			</div>
			<%
			if (state==0)
				out.println("<div class=\"resState resWaitState\">예약 대기</div>");
			else
				out.println("<div class=\"resState resReadyState\">예약 완료</div>");
			%>
		</div>
		<div class ="symptom">
			<div class="symptomHead">증상</div>
			<div class="symptomInfo">
				<%
				out.println(symptom);
				%>
			</div>
		</div>
	</div>
	
	<%@ include file="/components/footer.jsp" %>
</body>
</html>