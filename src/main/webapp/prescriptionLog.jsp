<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/prescriptionLog.css" rel="stylesheet" type="text/css">
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
	
	String uid = session.getAttribute("id").toString();
	String query = "";
	String isPatient = session.getAttribute("isPatient").toString();
	if (isPatient.equals("true"))
		query = "select pre_id, contents, p_id, doc_id from prescription where p_id = \'" + uid + "\'"; 
	else
		query = "select pre_id, contents, p_id, doc_id from prescription where doc_id = \'" + uid + "\'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
%>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="처방전 목록"/>
	</jsp:include>	
	<%@ include file="/components/footer.jsp" %>
	<form class="container" action="prescriptionInfo.jsp" method="post">
		<%
			while(rs.next()){
				out.println("<button class='wrapper' name='prescription' type='submit' value='" + rs.getString("pre_id") +"'>");
				out.println("<img src='./resources/medical-list.png'/>");
				out.println("<div class='preInfo'>");
					out.println("<div class=\"doctorInfo\"> 처방전 번호 : " +rs.getString("pre_id")+ "</div>");
					out.println("<div class=\"departmentName\"> 환자 번호 : " +rs.getString("p_id") + "</div>");
				out.println("</div>");
				out.println("</button>");
			}
		%>
	</form>
</body>
</html>