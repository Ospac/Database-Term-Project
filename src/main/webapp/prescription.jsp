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
<title>Insert title here</title>

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
	
	//String location = request.getParameter("par_location");
	//String query = "select par_name, par_location from parmacy where par_location like '%"+location+"%'";
	//pstmt = conn.prepareStatement(query);
	//rs = pstmt.executeQuery();
%>
	<%@ include file="/components/header.jsp" %>
	
	<%@ include file="/components/footer.jsp" %>
</body>
</html>