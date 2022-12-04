<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>

<%
if(session.getAttribute("id") == null){
	response.sendRedirect("login.jsp");
}
String id = (String) session.getAttribute("id");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String blood = request.getParameter("bloodType");

boolean isPatient;
if(session.getAttribute("isPatient").equals("true")){
	isPatient = true;
} else isPatient = false;

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
String query;
if(isPatient){
	query = "UPDATE PATIENT SET Pat_name = '"+ name +"', Pat_address = '"+ address+"', Blood_type = '"+blood+"' WHERE Pat_id = '"+id+"'";	
}else{
	query = "UPDATE DOCTOR SET Doc_name = '"+ name +"', Phone_number = '"+ phone+"' WHERE doc_id = '"+id+"'";	
}
pstmt = conn.prepareStatement(query);
rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/loginOK.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="Login"/>
	</jsp:include>	
	<div class='container'>
		<form action="userInfo.jsp" method="get">
			<div class='loginMsg'>내 정보가 업데이트 되었습니다.</div>
			<button type= "submit">이전</button>
		</form>
	</div>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>