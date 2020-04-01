<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Request</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div align="center">
		<table class="table table-hover">
			<tr>
				<th>Waiting for an offer</th>
			</tr>
			<tr>
				<th>ID</th>
				<th>Description</th>
				<th>Requestor</th>
				<th>Volunteer</th>
				<th>Notification from</th>
				<th>Status</th>

			</tr>
			<c:forEach items="${tasks}" var="tasks">
					<c:choose>
						<c:when test="${empty tasks.notifications}">
							<tr>
								<td>${tasks.id}</td>
								<td>${tasks.description}</td>
								<td>${tasks.requestor.firstName}${task.requestor.lastName}</td>
								<td>${tasks.volunteer.firstName}${task.volunteer.lastName}</td>
								<td></td>
								<td>Waiting on an offer</td>
							</tr>
						</c:when>
					</c:choose>
				<%-- </c:forEach> --%>
			</c:forEach>
			<tr>
				<th>Waiting to Accept Offer</th>
			</tr>
			<tr>
				<th>ID</th>
				<th>Description</th>
				<th>Requestor</th>
				<th>Volunteer</th>
				<th>Notification from</th>
				<th>Status</th>

			</tr>

			<c:forEach items="${tasks}" var="tasks">
				<c:forEach items="${tasks.notifications }" var="notif">
					<c:choose>

						<c:when test="${tasks.volunteer == null && notif != null}">
							<tr>
								<td>${tasks.id}</td>
								<td>${tasks.description}</td>
								<td>${tasks.requestor.firstName}${task.requestor.lastName}</td>
								<td>${tasks.volunteer.firstName}${task.volunteer.lastName}</td>
								<td>${notif.sendingUser.firstName }</td>
								<td><form class="w3-container" action="confirmOffer.do"
										method="POST">
										<input type="hidden" name="taskId" value="${task.id }" /> <input
											type="hidden" name="taskId" value="${notif.sendingUser.id }" />

										<button class="" type="submit">Accept</button>
									</form></td>
							</tr>

						</c:when>

					</c:choose>
				</c:forEach>

			</c:forEach>
			<tr>
				<th>Waiting to complete job</th>
			</tr>
			<tr>
				<th>ID</th>
				<th>Description</th>
				<th>Requestor</th>
				<th>Volunteer</th>
				<th>Notification from</th>
				<th>Status</th>

			</tr>
			<c:forEach items="${tasks}" var="tasks">
				<c:forEach items="${tasks.notifications }" var="notif">
					<c:choose>


						<c:when test="${tasks.volunteer != null && notif != null}">
							<tr>
								<td>${tasks.id}</td>
								<td>${tasks.description}</td>
								<td>${tasks.requestor.firstName}${task.requestor.lastName}</td>
								<td>${tasks.volunteer.firstName}${task.volunteer.lastName}</td>
								<td>${notif.sendingUser.firstName}</td>

								<td><a href="">Complete</a></td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>


			</c:forEach>
			<tr>
				<th>Completed Jobs</th>
			</tr>
			<tr>
				<th>ID</th>
				<th>Description</th>
				<th>Requestor</th>
				<th>Volunteer</th>
				<th>Notification from</th>
				<th>Status</th>

			</tr>
			<c:forEach items="${tasks}" var="tasks">
				<c:forEach items="${tasks.notifications }" var="notif">
					<c:choose>


						<c:when test="${tasks.dateCompleted != null}">
							<tr>
								<td>${tasks.id}</td>
								<td>${tasks.description}</td>
								<td>${tasks.requestor.firstName}${task.requestor.lastName}</td>
								<td>${tasks.volunteer.firstName}${task.volunteer.lastName}</td>
								<td>${notif.sendingUser.firstName}</td>
								<td>Job is Complete</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>


			</c:forEach>
		</table>
	</div>
</body>
</html>