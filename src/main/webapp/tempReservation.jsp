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
	String pid = session.getAttribute("id").toString();
	String docid = request.getParameter("doctor");
	String symptom = request.getParameter("symptom");
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
	%>
	<jsp:include page="/components/header.jsp" flush="true">
    <jsp:param name="headerTitle" value="예약"/>
	</jsp:include>
	<form class="container" action="tempReservation.jsp" method="post">
	<div>환자정보 : <%=pid %></div>
	<div>의사정보 : <%=docid %></div>
	<div>증상 : <%=symptom %></div>
	<%
	String query = "INSERT INTO RESERVATION VALUES ((select concat('R',lpad(cast(substr(res_id,-5) as number(10))+1,6,'0')) from reservation where res_id = ( select max(res_id) from reservation )), '"+symptom+"', 0, '"+pid+"', '"+docid+"')";
	pstmt = conn.prepareStatement(query);
	pstmt.executeUpdate();
	%>
	
		<button type= "submit">제출하기</button>
	</form>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>