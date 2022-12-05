<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*, java.util.Date, java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/schedule.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="components/calendar.js"></script>
<%
if(session.getAttribute("id") == null){
	response.sendRedirect("login.jsp");
}
String docId = (String) session.getAttribute("id");
String symptom = "";
%>
</head>
<body>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="일정"/>
	</jsp:include>	
	<div class="container">
			<div class="weekWrapper">
				<div class="weekSelect">
					<button class="arrowLeft"><span class="material-symbols-outlined">chevron_left</span></button>
					<div class="yearMonth"></div>
					<button class="arrowRight"><span class="material-symbols-outlined">chevron_right</span></button>
				</div>
				<div class="dayNames">
	                <span>일</span>
	                <span>월</span>
	                <span>화</span>
	                <span>수</span>
	                <span>목</span>
	                <span>금</span>
	                <span>토</span>
				</div>
				<div class="dayNumbers">
	                <span></span>
	                <span></span>
	                <span></span>
	                <span></span>
	                <span></span>
	                <span></span>
	                <span></span>
				</div>
			</div>
			<div class="selectedDate"></div>
	        <div class="todoWrapper">
        	</div>
        </div>
	<%@ include file="/components/footer.jsp" %>
	<script>
	const symptom = "<%=symptom%>";
	const docId = "<%=docId%>";
	init(symptom, docId);
	</script>
</body>
</html>