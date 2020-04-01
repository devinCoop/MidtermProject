<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
</head>
<body>
	<a href="viewProfile.do"> <img src="img/profilePicDefault.png"
		class="profileImage" />
	</a>
	<a href= "ShowConfirm.do" >Show confirm offer page which will be user admin page in order to confirm page</a>


</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello ${SessionScope.user }</title>
<jsp:include page="includes/bootstrapHead.jsp" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="includes/navbarLoggedIn.jsp" />


	<div align="center">
		<!-- <table class="table table-hover">
			<tr>
				<th>Waiting for an offer</th>
			</tr> -->
	<!-- 		<tr>
				<th>ID</th>
				<th>Description</th>
				<th>Requestor</th>
				<th>Volunteer</th>
				<th>Notification from</th>
				<th>Status</th> -->

	<%-- 		</tr>
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
				</c:forEach>
			</c:forEach> --%>
			<div class="container-fluid">
			<h5>Waiting for an offer</h5>
				<div class="row row-cols-1 row-cols-md-2 row-cols-lg-4">
					<c:forEach items="${tasks}" var="task">
						<c:choose>
							<c:when test="${task.notifications == null }">
								<div class="col mb-4">
									<div class="card bg-light text-center mb-3 h-100">
										<div class="card-body text-secondary text-align-bottom">
											<h4 class="card-title">${task.requestor.username}</h4>
											<h6 class="card-subtitle mb-2 text-muted">${task.description}</h6>

										</div>
										<ul class="list-group list-group-flush">
											<%-- <li class="list-group-item">${RB.services}</li> --%>
											<li class="list-group-item">Location:
												${task.requestor.address.city},
												${task.requestor.address.state}</li>
											<li class="list-group-item"><p>Waiting for an Offer</p></li>
											<li class="list-group-item">Listed: ${task.dateCreated }</li>
											<li class="list-group-item">Expires:
												${task.dateDeadline}</li>
										</ul>

										<%-- 	<div class="card-footer text-muted justify-content-center">
								<a href="tel:${RB.phoneNumber}" class="">${RB.phoneNumber}</a>
							</div> --%>

									</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>
			
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
											type="hidden" name="sendingUserId"
											value="${notif.sendingUser.id }" />

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


	<jsp:include page="includes/bootstrapFoot.jsp" />
</body>
</html>