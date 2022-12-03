<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
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


String year = request.getParameter("year");	
String month = request.getParameter("month");	
String day = request.getParameter("day");

conn = DriverManager.getConnection(url,user,pass);
String query = "select S_state, S_hour, S_minute from doctor_schedule where doc_id = 'D000091' and TO_DATE('"+year+"-"+month+"-"+day+"', 'yyyy-mm-dd') = S_Date";
pstmt = conn.prepareStatement(query);
rs = pstmt.executeQuery();
if(rs.next()){
	do{
		String hour = rs.getString("S_hour");
		String minute = rs.getString("S_minute");
		for(int i = 9; i < 22; i++){
			out.println("<div class='todo'>");
			if(i == Integer.parseInt(hour)){
				out.println("<div class='time reserve'>");
					out.println("<div class='calTime'>" + i +"</div>");
					out.println("<div class='resTime'>");
						out.println(hour + ":" + (minute.equals("0")? "00" : minute)+" 예약됨");
					out.println("</div>");
				out.println("</div>");

			}else{
				out.println("<div class='time'>");
				out.println("<div class='calTime'>" + i +"</div>");
				out.println("<div class='resTime'>");
				out.println("</div>");
			out.println("</div>");
			}
			out.println("</div>");
		}
	}while(rs.next());
}else{
	for(int i = 9; i < 22; i++){
		out.println("<div class='todo'>");
			out.println("<div class='time'>");
				out.println("<div class='calTime'>" + i +"</div>");
			out.println("</div>");
		out.println("</div>");
	}
}
rs.close();
%>