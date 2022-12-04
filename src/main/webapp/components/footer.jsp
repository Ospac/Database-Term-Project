<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="css/footer.css" rel="stylesheet" type="text/css">
	<link href="css/default.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<nav>
	<%

		if(session.getAttribute("isPatient") != null && session.getAttribute("isPatient").equals("true")){
			out.println("<a href='index.jsp'>");
				out.println("<span class='material-symbols-outlined'>home</span>");
				out.println("<span>홈</span>");
			out.println("</a>");
			out.println("<a href='reservationLog.jsp'>");
				out.println("<span class='material-symbols-outlined'>outpatient_med</span>");
				out.println("<span>예약 내역</span>");
			out.println("</a>");
			out.println("<a href='prescriptionLog.jsp'>");
				out.println("<span class='material-symbols-outlined'>prescriptions</span>");
				out.println("<span>처방 내역</span>");
			out.println("</a>");
			out.println("<a href='userInfo.jsp'>");
				out.println("<span class='material-symbols-outlined'>person</span>");
				out.println("<span>내 정보</span>");
			out.println("</a>");
		}else{
			out.println("<a href='reservationLog.jsp'>");
			out.println("<span class='material-symbols-outlined'>outpatient_med</span>");
			out.println("<span>예약 내역</span>");
			out.println("</a>");
			out.println("<a href='prescriptionLog.jsp'>");
				out.println("<span class='material-symbols-outlined'>prescriptions</span>");
				out.println("<span>처방 내역</span>");
			out.println("</a>");
			out.println("<a href='userInfo.jsp'>");
			out.println("<span class='material-symbols-outlined'>person</span>");
			out.println("<span>내 정보</span>");
		}
	%>
</nav>
</html>