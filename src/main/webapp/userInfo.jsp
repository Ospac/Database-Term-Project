<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/userInfo.css" rel="stylesheet" type="text/css">
<%
if(session.getAttribute("id") == null){
	response.sendRedirect("login.jsp");
}
String id = (String) session.getAttribute("id");
boolean isPatient = true;
if(session.getAttribute("isPatient") != null && session.getAttribute("isPatient").equals("true")){
	isPatient = true;
} else if(session.getAttribute("isPatient").equals("false"))
	isPatient = false;
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
	query = "select pat_id id, pat_name name, Pat_address address, Sex, Blood_type from patient where pat_id = '" + id + "'";
}
else{
	query = "select Doc_id id, Phone_number phone, Doc_name name from doctor where doc_id = '" + id + "'";
}
pstmt = conn.prepareStatement(query);
rs = pstmt.executeQuery();
%>
<title>Medical Access</title>
</head>
<body>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="내 정보 관리"/>
	</jsp:include>	
	<div class="container">
		<form action="editInfo.jsp" method="post">
		<%
		while(rs.next()){
			out.println("<div class='wrapper'>");
			out.println("<div class='label'>아이디</div>");
			out.println("<input name='id' class='infoInput' disabled value='"+ rs.getString("id") +"'>");
			out.println("</div>");
			
			out.println("<div class='wrapper'>");
			out.println("<div class='label'>이름</div>");
			out.println("<input name='name' class='infoInput'  value='"+ rs.getString("name") +"'>");
			out.println("</div>");
			if(isPatient){
				out.println("<div class='wrapper'>");
				out.println("<div class='label'>주소</div>");
				out.println("<input name='address' class='infoInput' value='"+ rs.getString("address") +"'>");
				out.println("</div>");
			}
			if(!isPatient){
				out.println("<div class='wrapper'>");
				out.println("<div class='label'>휴대폰</div>");
				out.println("<input name='phone' class='infoInput' value='"+ rs.getString("phone") +"'>");
				out.println("</div>");
			}
			if(isPatient){
				out.println("<div class='wrapper'>");
				out.println("<div class='label'>혈액형</div>");
				out.println("<input name='bloodType' class='infoInput' value='"+ rs.getString("Blood_type") +"'>");
				out.println("</div>");
			}
		}
		%>
		<button type="submit" class="editBtn">수정</button>
		</form>
		<form action="./components/logout.jsp" method="get">
			<button class="logoutBtn">로그아웃</button>
		</form>
	</div>

	<%@ include file="/components/footer.jsp" %>
</body>
</html>