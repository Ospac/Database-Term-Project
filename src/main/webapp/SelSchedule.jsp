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
<link href="css/doctors.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
	<%
		String docid = request.getParameter("doctor");
		String pid = request.getParameter("pid");
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
	
	String query = "select s_date, s_hour, s_minute, s_state from doctor_schedule where doc_id = '"+docid+"'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
%>
<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="의사 스케쥴"/>
	</jsp:include>	
	<div class="container">
		<div style="overflow:scroll; width:400px; height:600px;">
		<form class="doctorsContainer" action="reservation.jsp" method="post">
		<input type = "hidden" name = "id" value="<%=pid%>"/>
		<%
		out.println("<div>원하는 시간을 선택하세요</div>");
		String timeinfo = "";
		while(rs.next()){
			String date = rs.getString("S_date").substring(0,10);
			String hour = rs.getString("S_hour");
			String min = rs.getString("S_minute");
			int e_hour = Integer.parseInt(hour);
			int e_min = Integer.parseInt(min)+30;
			if (e_min >= 60){
				e_min -= 60;
				e_hour += 1;
			}
			String ee_min = "";
			if (e_min == 0){
				ee_min = "00";
			}
			else{
				ee_min = String.valueOf(e_min);
			}
			String starttimeinfo = hour+":"+min;
			String endtimeinfo = String.valueOf(e_hour)+":"+ee_min;
			timeinfo = starttimeinfo+ " ~ " + endtimeinfo;
			out.println("<button class=\"scheduleWrapper\" name =\"timeinfo\" type=\"subimt\" value=\"" + timeinfo +"\">");
			out.println("<div class=\"schedule\">");	
			out.println("<div class=\"date\">" +date+ "</div>");
			out.println("<div class=\"time\">" +timeinfo + "</div>");
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