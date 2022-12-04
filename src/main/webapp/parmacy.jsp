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
<title>Medical Access</title>
<link href="css/parmacy.css" rel="stylesheet" type="text/css">
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
	
	String location = request.getParameter("par_location");
	String query = "select par_name, par_location from parmacy where par_location like '%"+location+"%'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
%>

	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="약국 정보"/>
	</jsp:include>	
	<div class="container">
	<%
		while(rs.next()) {
			out.println("<div class=\"parmacy\">");
			out.println("<img src=\"./resources/parmacy.png\"/>");
			out.println("<div class=\"parInfo\">");
			out.println("<div class=\"parName\">" +rs.getString("par_name")+ "</div>");
			out.println("<div class=\"parLocation\">" +rs.getString("par_location") + "</div>");
			out.println("</div>");
			out.println("</div>");
		}
	%>
	</div>
	
	<%@ include file="/components/footer.jsp" %>
</body>
</html>
