<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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



	<div class="jumbotron jumbotron-fluid jumbotron">
	</div>
		<div class="jumbotron jumbotron-fluid jumbotron4">
			<div align="center">
			<h2 class="text-body">Received Notifications</h2>
		</div>
		</div>
<%-- 		<div class="container-fluid">
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
		</div> --%>
		<div class="container-xl">
			<div class="row">
				<c:forEach items="${receiveNotifications}" var="notif">
							<div class="card-container centermx drop-shadow lifted">
								<div class="card h-100">
									<div class="card-header">
										<span class="float-left custom">${notif.sendingUser.firstName}</span><span
											class="float-right"><fmt:parseDate
												value="${notif.notificationDate}" var="parsedDate"
												pattern="yyyy-MM-dd" /> Listed: <fmt:formatDate type="date"
												value="${parsedDate}" /></span>
									</div>
									<div class="card-body text-center">
										<p class="my-auto">${notif.message}</p>
									</div>
									<div class="card-footer condensed">
										<span class="float-left">Location:
											${notif.sendingUser.address.city },
											${notif.sendingUser.address.state}</span> <span class="float-right"><fmt:parseDate
												value="${notif.task.dateDeadline}" var="parsedExpDate"
												pattern="yyyy-MM-dd" />Expires: <fmt:formatDate type="date"
												value="${parsedExpDate}" /></span>
									</div>
								</div>
							</div>
				</c:forEach>
			</div>
		</div>
		<div class="jumbotron jumbotron-fluid jumbotron4">
		<div align="center">
			<h2 class="text-body">Sent Notifications</h2>
		</div>
		</div>
			<div class="container-xl">
			<div class="row">
				<c:forEach items="${sentNotifications}" var="notif">
							<div class="card-container centermx drop-shadow lifted">
								<div class="card h-100">
									<div class="card-header">
										<span class="float-left custom">${notif.receivingUser.firstName}</span><span
											class="float-right"><fmt:parseDate
												value="${notif.notificationDate}" var="parsedDate"
												pattern="yyyy-MM-dd" /> Listed: <fmt:formatDate type="date"
												value="${parsedDate}" /></span>
									</div>
									<div class="card-body text-center">
										<p class="my-auto">${notif.message}</p>
									</div>
									<div class="card-footer condensed">
										<span class="float-left">Location:
											${notif.sendingUser.address.city },
											${notif.sendingUser.address.state}</span> <span class="float-right"><fmt:parseDate
												value="${notif.task.dateDeadline}" var="parsedExpDate"
												pattern="yyyy-MM-dd" />Expires: <fmt:formatDate type="date"
												value="${parsedExpDate}" /></span>
									</div>
								</div>
							</div>
				</c:forEach>
			</div>
		</div>

		<!-- </div> -->
	<!-- </div> -->
	<jsp:include page="includes/bootstrapFoot.jsp" />
</body>
</html>