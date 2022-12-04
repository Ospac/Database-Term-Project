<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("password"); 
	String isPatient = request.getParameter("isPatient");
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
	if(isPatient.equals("true")){
		query = "select pat_name name from patient where pat_id = '" + id + "' and pat_password = '"+pwd+"'";
	}else {
		query = "select doc_name name from doctor where doc_id = '" + id + "' and doc_password = '"+pwd+"'";
	}
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	String name = "";
	while(rs.next())
	{
		name = rs.getString("name");
	}
	if(name != ""){
		session.setAttribute("id", id);
		session.setAttribute("isPatient", isPatient);
		response.sendRedirect("index.jsp");
		
	}
	else{
		response.sendRedirect("loginFail.jsp");
	}
%>
