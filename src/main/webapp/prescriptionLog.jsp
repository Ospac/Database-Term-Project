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
		String pid = request.getParameter("id");
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
	
	String query = "select doc_name, dep_name from doctor, department, prescription where doctor.doc_id = prescription.doc_id and p_id = '"+pid+"' and doctor.dep_id = department.dep_id";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
%>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="처방전 목록"/>
	</jsp:include>	
	<%@ include file="/components/footer.jsp" %>
	<form class="container" action="prescriptionInfo.jsp" method="post">
		<button class="wrapper" name="prescription" value="PRE0001">
			<img src="./resources/medical-list.png"/>
			<div class="preInfo">
			while(rs.next()){
				out.println("<button class=\"preWrapper\" name=\"prescription\" type=\"submit\" value=\""+rs.getString("hos_name")+"\">");
				out.println("<div class=\"prescription\">");	
				out.println("<div class=\"doctorName\">" +rs.getString("doc_name")+ "의사</div>");
				out.println("<div class=\"departmentName\">" +rs.getString("dep_name") + "</div>");
				out.println("</div>");
				out.println("</button>");
			}
			</div>			
		</button>
	</form>
</body>
</html>