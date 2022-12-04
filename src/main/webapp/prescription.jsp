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
<title>Insert title here</title>

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
	
	String contents = request.getParameter("contents");
	String doc_id = request.getParameter("doc_id");
	String p_id = request.getParameter("p_id");
	String query = "INSERT INTO PRESCRIPTION VALUES ((select concat(\'PRE\', lpad(cast(substr(pre_id,-4) as number(10))+1,4,\'0\')) from prescription where pre_id = ( select max(pre_id)from prescription)),\'" +p_id + "\', \'" + doc_id + "\', \'" + contents + "\')";
	System.out.println(query);
	
	Statement stmt = conn.createStatement();
	int res = stmt.executeUpdate(query);
	
%>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="처 방 전"/>
	</jsp:include>		
	<%
	
	if(res > 0) out.println("처방전 업데이트 성공");
	else out.println("처방전 업데이트 실패");
	
	%>
	<%@ include file="/components/footer.jsp" %>
</body>
</html>