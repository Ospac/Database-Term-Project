<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medical Access</title>
<link href="css/prescriptionLog.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/components/header.jsp" flush="true">
	    <jsp:param name="headerTitle" value="처방전 목록"/>
	</jsp:include>	
	<%@ include file="/components/footer.jsp" %>
	<form class="container" action="prescriptionInfo.jsp" method="post">
		<button class="wrapper" name="prescription" value="PRE0001">
			<img src="./resources/medical-list.png"/>
			<div class="preInfo">
				<div class="hospitalName">김가정의학과-외과의원</div>
				<div class="doctorInfo">
					<div class="doctorName">송우진 의사</div>
					<div class="doctorDept">외과</div>
				</div>
			</div>			
		</button>
	</form>
</body>
</html>