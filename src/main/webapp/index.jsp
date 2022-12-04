<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("id") == null){
		response.sendRedirect("login.jsp");
	}
	if(session.getAttribute("isPatient") != null && session.getAttribute("isPatient").equals("false")){
		response.sendRedirect("schedule.jsp");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/index.css" rel="stylesheet" type="text/css">
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
	
	String query = "select distinct dep_name from department";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
%>
	<%@ include file="/components/header.jsp" %>
	<div class="container">
		<!-- 진료 과목 검색 -->
		<div class="departmentWrapper">
			<div class="departmentHead">진료 과목</div>
			<form class="departmentBody" action="doctors.jsp" method="get" accept-charset="utf-8">
			<input type = "hidden" name = "id" value="<%=pid%>"/>
<% 
	int i = 0;
	while(rs.next()){
		String depName = rs.getString("dep_name");
		out.println("<button class='department' name=\"department\" type=\"submit\" value=\"" + depName+"\">");
			out.println("<img src='./resources/department/"+ i +".png' >");
			out.println("<div>"+ depName +"</div>");
		out.println("</button>");
		i++;
	}
%>
			
			</form>
		</div>
		<!-- 약국 검색 -->
		<%
			request.setAttribute("conn", conn);
		%>
		<%@ include file="/components/searchParmacy.jsp" %>

	</div>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>	