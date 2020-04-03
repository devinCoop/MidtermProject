<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quarangel Notifications</title>
<jsp:include page="includes/bootstrapHead.jsp" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<%-- <jsp:include page="includes/navbarLoggedIn.jsp" /> --%>
	<jsp:include page="includes/navbar.jsp" />



	<div class="jumbotron jumbotron-fluid jumbo-custom2">
	<div class="container mt-10">
			<div align="center">
			<h2 class="text-body">Received Notifications</h2>
		</div>
		<div class="container-fluid">
			<div class="card-columns">
				<c:forEach items="${receiveNotifications}" var="notif">
					<div class="card bg-info h-100">
						<div class="card-body">
								<b>Date:</b> <i>${notif.notificationDate}</i><br>
								<b>Sender Name:</b> <i>${notif.sendingUser.firstName} ${notif.sendingUser.lastName}</i><br> 
								<b>Task Description:</b> <p class="font-italic">${notif.task.description}</p>
								<b>Message:</b> <p class="font-italic">${notif.message}</p><br>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div align="center">
			<h2 class="text-body">Sent Notifications</h2>
		</div>
			<div class="container-fluid">
				<div class="card-columns">
					<c:forEach items="${sentNotifications}" var="notif">
						<div class="card bg-info h-100">
							<div class="card-body h-100">
							<b>Date:</b> <i>${notif.notificationDate}</i><br>
							<b>Receiver Name:</b> <i>${notif.receivingUser.firstName}
							${notif.receivingUser.lastName}</i><br>
							<b>Task Description:</b> <p class="font-italic">${notif.task.description}</p>
							<b>Message:</b><p class="font-italic">${notif.message}</p><br>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
		<!-- </div> -->
	<!-- </div> -->
	<jsp:include page="includes/bootstrapFoot.jsp" />
</body>
</html>