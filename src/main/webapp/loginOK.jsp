<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/doctors.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<%
		String pid = request.getParameter("id");
		String pwd = request.getParameter("password");
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
	
	String query = "select * from patient where pat_id = '" + pid + "' and pat_password = '"+pwd+"'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
%>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="Login"/>
	</jsp:include>	
	<%
		String name = "";
		while(rs.next())
		{
			name = rs.getString("pat_name");
		}
		if(name != "")
		{
			out.println("<form action=\"index.jsp\" method=\"post\">");
			out.println("로그인 성공!");
			out.println("<input type = \"hidden\" name = \"id\" value=" +pid+"\"/>");
			out.println("<button type= \"submit\">확인</button>");
			out.println("</form>");
		}
		else
		{
			out.println("<form action=\"login.jsp\" method=\"post\">");
			out.println("로그인 실패. ID나 PW를 확인하세요");
			out.println("<button type= \"submit\">확인</button>");
			out.println("</form>");
		}
	%>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>