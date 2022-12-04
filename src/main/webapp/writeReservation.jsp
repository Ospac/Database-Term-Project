
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<%
if(session.getAttribute("id") == null){
	response.sendRedirect("login.jsp");
}
%>
<meta charset="UTF-8">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/reservation.css" rel="stylesheet" type="text/css">
<title>Medical Access</title>
<%
	String pid = session.getAttribute("id").toString();;
	String time = request.getParameter("resTime");	
	String symptom = request.getParameter("symptom");	
	String docId = request.getParameter("docId");	
	String year = request.getParameter("year");	
	String month = request.getParameter("month");	
	String day = request.getParameter("day");
	symptom = symptom + " / " + year + ". " + month + ". " + day + ". " + time + ":00";
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
Statement stmt = null;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url,user,pass);
String query = "INSERT INTO RESERVATION VALUES ((select concat('R',lpad(cast(substr(res_id,-5) as number(10))+1,6,'0')) from reservation where res_id = ( select max(res_id) from reservation )), '"+symptom+"', 0, '"+pid+"', '"+docId+"')";
pstmt = conn.prepareStatement(query);
pstmt.executeUpdate();
response.sendRedirect("reservationLog.jsp");
%>
