<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/prescriptionInfo.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
	<%
		if(session.getAttribute("id") == null){
			response.sendRedirect("login.jsp");
		}
		String pid = (String) session.getAttribute("id");
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
	String pre_id = request.getParameter("prescription");
	String isPatient = session.getAttribute("isPatient").toString();
	String query = "select p_id, doc_id, contents from prescription where pre_id =\'" + pre_id + "\'" ;
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	rs.next();
	String p_id = rs.getString("p_id");
	String doc_id = rs.getString("doc_id");
	String contents = rs.getString("contents");
	
%>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="처방전 상세"/>
	</jsp:include>	
	<%@ include file="/components/footer.jsp" %>
	<div class="container">
		<div class="resInfoWrapper">
			<img src="./resources/diagnosis.png"/>
			<div class="doc_information">
			<%
				if(isPatient.equals("true")){
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
						out.println("<div class=\"hospitalName\"> 환자이름 : " + rs.getString("pat_name") + "</div>");
						out.println("<div class=\"doctorInfo\">");
							out.println("<div class=\"doctorDept\"> 혈액형 : " +rs.getString("blood_type") + "</div>");
							out.println("<div class=\"doctorName\"> 성별 : " +rs.getString("sex") + " </div>");
						out.println("</div>");
					out.println("</div>");
				}
			%>
			</div>
		</div>
		<div class ="symptom">
			<div class="symptomHead">처방전</div>
			<div class="symptomInfo">
				<%
				out.println(contents);
				%>
			</div>
		</div>
	</div>
</body>
</html>