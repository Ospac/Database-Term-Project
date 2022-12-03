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
	
	String rid = request.getParameter("reservation");
	String query = "select symptom, state, doc_id from reservation where res_id = \'"+ rid +"\'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
%>

	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="예약 정보"/>
	</jsp:include>	
	<div class="container">
	<%
		while(rs.next()) {
			out.println(rs.getString("symptom"));
		}
	%>
	</div>
	
	<%@ include file="/components/footer.jsp" %>
</body>
</html>