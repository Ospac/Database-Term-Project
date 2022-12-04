<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<body>
<%
	/* Connection parConn = (Connection)request.getAttribute("conn"); */
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String location = request.getParameter("par_location");
	String query2 = "select distinct substr(par_location, 0, instr(par_location, ' ',1,3)) as par_loc from parmacy";
	pstmt = conn.prepareStatement(query2);
	rs = pstmt.executeQuery();
%>

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
				<button type="submit">검색</button>
			</form>
		</div>
</body>
</html>