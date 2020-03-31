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
				<th>ID</th>
				<th>Description</th>
				<th>Requestor</th>
				<th>Category</th>
				<th>Help</th>
			</tr>
			<c:forEach items="${tasks}" var="task">
				<tr>
					<td>${task.id}</td>
					<td>${task.description}</td>
					<td>${task.requestor.firstName}${task.requestor.lastName}</td>
					<td>${task.category.name}</td>
					<c:forEach items="${notifications}" var="notif">
					<c:choose>
					<c:when test="${task.id == notif.task.id}">
			            Offer pending
			         </c:when>
					<c:otherwise>
						<a href="offerHelp.do?taskid=${task.id}">Offer Help</a>
					</c:otherwise>
					</c:choose>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>