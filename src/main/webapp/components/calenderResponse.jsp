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
String symptom = request.getParameter("symptom");
String docId = request.getParameter("docId");
if(docId == null){
	docId = (String) session.getAttribute("id");
}
conn = DriverManager.getConnection(url,user,pass);
String query = "select S_state, S_hour, S_minute from doctor_schedule where doc_id = '"+docId+"' and TO_DATE('"+year+"-"+month+"-"+day+"', 'yyyy-mm-dd') = S_Date";
pstmt = conn.prepareStatement(query);
rs = pstmt.executeQuery();

if(rs.next()){
	do{
		String hour = rs.getString("S_hour");
		String minute = rs.getString("S_minute");
		out.println("<form class='todoWrapper' action='writeReservation.jsp' method='post'>");
		for(int i = 9; i < 22; i++){
			if(i == Integer.parseInt(hour)){
				out.println("<div class='todo'>");
					out.println("<div class='time reserve'>");
						out.println("<div class='calTime'>" + i +"</div>");
						out.println("<div class='resTime'>");
							out.println(hour + ":" + (minute.equals("0")? "00" : minute)+" 예약됨");
						out.println("</div>");
					out.println("</div>");
				out.println("</div>");
			}else{
					out.println("<button class='todo' name='resTime' value='"+i+"' type='submit'>");
						out.println("<div class='time'>");
								out.println("<div class='calTime'>" + i +"</div>");
								out.println("<div class='resTime'>");
							out.println("</div>");
						out.println("</div>");
						out.println("<input type='hidden' name='symptom' value='"+symptom+"' />");
						out.println("<input type='hidden' name='docId' value='"+docId+"' />");
						out.println("<input type='hidden' name='year' value='"+year+"' />");
						out.println("<input type='hidden' name='month' value='"+month+"' />");
						out.println("<input type='hidden' name='day' value='"+day+"' />");
					out.println("</button>");
			}
		}
		out.println("</form>");
	}while(rs.next());
}else{
	out.println("<form class='todoWrapper' action='writeReservation.jsp' method='post'>");
	for(int i = 9; i < 22; i++){
			out.println("<button class='todo' name='resTime' value='"+ i +"' type='submit'>");
				out.println("<div class='time'>");
						out.println("<div class='calTime'>" + i +"</div>");
						out.println("<div class='resTime'>");
					out.println("</div>");
				out.println("</div>");
				out.println("<input type='hidden' name='symptom' value='"+symptom+"' />");
				out.println("<input type='hidden' name='docId' value='"+docId+"' />");
				out.println("<input type='hidden' name='year' value='"+year+"' />");
				out.println("<input type='hidden' name='month' value='"+month+"' />");
				out.println("<input type='hidden' name='day' value='"+day+"' />");
			out.println("</button>");
	}
	out.println("</form>");

}
rs.close();
%>