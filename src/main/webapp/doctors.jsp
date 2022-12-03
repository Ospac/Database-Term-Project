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
	<%
		String departmentName = request.getParameter("department");
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
	
	String query = "select doc_name, hos_name from doctor, department, hospital where doctor.dep_id = department.dep_id and dep_name =" + "'내과'"+" and department.hos_id = hospital.hos_id";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
%>
<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="<%=departmentName%>"/>
	</jsp:include>	
	<div class="container">
		<div style="overflow:scroll; width:400px; height:600px;">
		<form class="doctorsContainer" action="reservation.jsp" method="post">
	
<%

while(rs.next()){
	out.println("<button class=\"doctorWrapper\" name=\"doctor\" type=\"submit\" value=\"D000001\">");
	out.println("<img src=\"./resources/profile.jpg\"/>");
	out.println("<div class=\"doctorProfile\">");	
	out.println("<div class=\"doctorName\">" +rs.getString("doc_name")+ "의사</div>");
	out.println("<div class=\"hospitalName\">" +rs.getString("hos_name") + "</div>");
	out.println("</div>");
	out.println("</button>");
}
%>
		</form>
		</div>
	</div>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>