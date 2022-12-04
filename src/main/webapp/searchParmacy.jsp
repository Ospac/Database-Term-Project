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

	String location = request.getParameter("par_location");
	String query = "select distinct substr(par_location, 0, instr(par_location, ' ',1,3)) as par_loc from parmacy";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
%>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="Login"/>
	</jsp:include>	
	<div class="container">
		<div style="overflow:scroll; width:400px; height:600px;">
		<div class="locationWrapper">
			<div class="locationHead">약국 검색
			</div>
			<form class="locationBody" action="parmacy.jsp">
				<select name="par_location">
					<%
					while(rs.next()) {
						String tmp = rs.getString("par_loc");
						String[] tmps = tmp.split(" ");
						out.println("<option value=\""+ tmps[2] +"\">"+tmps[2]+"</option>");//tmps[1] = 북구, tmps[2] = ㅇㅇㅇ로
					}
					%>
				</select>
				<input type="submit"/>
			</form>
		</div>
		</div>
	</div>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>