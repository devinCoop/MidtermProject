<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notifications</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron text-center">
		<h1>Sent Notifications</h1>
	</div>
	<div align="center">
		<table class="table table-hover">
			<tr>
				<th>Notification ID</th>
				<th>Sender Name</th>
				<th>Receiver Name</th>
				<th>Task Description</th>
				<th>Message</th>
				<th>Date</th>
			</tr>
			<c:forEach items="${sentNotifications}" var="notif">
				<tr>
					<td>${notif.id}</td>
					<td>${notif.sendingUser.firstName} ${notif.sendingUser.lastName}</td>
					<td>${notif.receivingUser.firstName} ${notif.receivingUser.lastName}</td>
					<td>${notif.task.description}</td>
					<td>${notif.message}</td>
					<td>${notif.notificationDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="jumbotron text-center">
		<h1>Received Notifications</h1>
	</div>
	<div align="center">
		<table class="table table-hover">
			<tr>
				<th>Notification ID</th>
				<th>Sender Name</th>
				<th>Receiver Name</th>
				<th>Task Description</th>
				<th>Message</th>
				<th>Date</th>
			</tr>
			<c:forEach items="${receiveNotifications}" var="notif">
				<tr>
					<td>${notif.id}</td>
					<td>${notif.sendingUser.firstName} ${notif.sendingUser.lastName}</td>
					<td>${notif.receivingUser.firstName} ${notif.receivingUser.lastName}</td>
					<td>${notif.task.description}</td>
					<td>${notif.message}</td>
					<td>${notif.notificationDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>