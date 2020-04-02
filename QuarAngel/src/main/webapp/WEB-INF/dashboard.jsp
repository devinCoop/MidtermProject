<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello ${SessionScope.loggedInUser }</title>
<jsp:include page="includes/bootstrapHead.jsp" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="includes/navbar.jsp" />
	
	<!-- Jumbo Tron  -->
	<div class="jumbotron jumbo-custom">
		<!-- <div class="container-fluid">
			<h1 class="display-4">Fluid jumbotron</h1>
			<p>This is a modified jumbotron that occupies the entire
				horizontal space of its parent.</p>
		</div> -->
	</div>
	
	
	
<!-- My Requests -->

	<!-- Waiting on an Offer -->
	<div class="container">
	<h5>My Requests</h5>
		<div class="row row-cols-1 row-cols-md-3">
			<c:forEach items="${userTasks}" var="task">
				<c:choose>
					<c:when test="${empty task.notifications}">
						<div class="col mb-4">
							<div class="card bg-light text-center mb-3 h-100">
								<div class="card-body text-secondary text-align-bottom">
									<h4 class="card-title">${task.requestor.username}</h4>
									<h6 class="card-subtitle mb-2 text-muted">${task.description}</h6>

								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">Location:
										${task.requestor.address.city},
										${task.requestor.address.state}</li>
									<li class="list-group-item"><button type="button"
											class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
											data-toggle="modal" data-target="#loginModalCenter">Waiting
											on an offer...</button></li>
									<li class="list-group-item">Listed: ${task.dateCreated }</li>
									<li class="list-group-item">Expires: ${task.dateDeadline}</li>
								</ul>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		<!-- End of Waiting on an Offer -->
		
		<!-- Accept Offer -->
			<c:forEach items="${userTasks}" var="task">
				<c:forEach items="${task.notifications }" var="notif">
					<c:choose>
						<c:when test="${task.volunteer == null && notif != null}">
							<div class="col mb-4">
								<div class="card bg-light text-center mb-3 h-100">
									<div class="card-body text-secondary text-align-bottom">
										<h4 class="card-title">${task.requestor.username}</h4>
										<h6 class="card-subtitle mb-2 text-muted">${task.description}</h6>

									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">Location:
											${task.requestor.address.city},
											${task.requestor.address.state}</li>
										<li class="list-group-item">You got an offer from
											${notif.sendingUser.firstName } ${notif.sendingUser.lastName }</li>
										<li class="list-group-item"><form class="w3-container"
												action="confirmOffer.do?taskid=${task.id }" method="GET">
												<input type="hidden" name="taskid" value="${task.id }" /> 
												<input type="hidden" name="notificationId" value="${notif.id }" /> <input
													type="hidden" name="sendingUserId"
													value="${notif.sendingUser.id }" />

												<button class="" type="submit">Accept Offer</button>
											</form></li>
										<li class="list-group-item">Listed: ${task.dateCreated }</li>
										<li class="list-group-item">Expires: ${task.dateDeadline}</li>
									</ul>

								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach>
		<!-- End of Accept Offer -->
		
		<!-- Mark the Job as Complete -->
			<c:forEach items="${userTasks}" var="task">
				<c:forEach items="${task.notifications }" var="notif">
					<c:choose>
						<c:when
							test="${task.volunteer != null && task.dateCompleted == null}">
							<div class="col mb-4">
								<div class="card bg-light text-center mb-3 h-100">
									<div class="card-body text-secondary text-align-bottom">
										<h4 class="card-title">${task.requestor.username}</h4>
										<h6 class="card-subtitle mb-2 text-muted">${task.description}</h6>

									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">Location:
											${task.requestor.address.city},
											${task.requestor.address.state}</li>
										<li class="list-group-item">You got an offer from
											${notif.sendingUser.firstName } ${notif.sendingUser.lastName }</li>
										<li class="list-group-item"><form class="w3-container"
												action="completeJob.do?taskid=${task.id }" method="GET">
												<input type="hidden" name="taskid" value="${task.id }" /> <input
													type="hidden" name="sendingUserId"
													value="${notif.sendingUser.id }" />

												<button class="" type="submit">Mark Complete</button>
											</form></li>
										<li class="list-group-item">Listed: ${task.dateCreated }</li>
										<li class="list-group-item">Expires: ${task.dateDeadline}</li>
									</ul>

								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach>
		<!-- End of Mark the Job as Complete -->
		
<!-- End of My Requests -->

<!-- My Volunteer Offers -->

		<!-- Waiting on Requestor to Accept Offer -->
		
		<!-- End of Waiting on Requestor to Accept Offer -->
		
		<!-- View Contact info for Requestor to link up and finish job -->
		
		<!-- End of View Contact info for Requestor to link up and finish job -->

<!-- End of My Volunteer Offers -->

<!-- Completed Requests -->
			<c:forEach items="${userTasks}" var="task">
				<c:forEach items="${task.notifications }" var="notif">
					<c:choose>
						<c:when test="${task.dateCompleted != null }">

							<div class="col mb-4">
								<div class="card bg-light text-center mb-3 h-100">
									<div class="card-body text-secondary text-align-bottom">
										<h4 class="card-title">${task.requestor.username}</h4>
										<h6 class="card-subtitle mb-2 text-muted">${task.description}</h6>

									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">Location:
											${task.requestor.address.city},
											${task.requestor.address.state}</li>
										<li class="list-group-item">${notif.sendingUser.firstName }
											${notif.sendingUser.lastName } finished this job on
											${task.dateCompleted }</li>
										<li class="list-group-item"><button type="button"
												class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
												data-toggle="modal" data-target="#loginModalCenter">Job
												has been completed</button></li>
										<li class="list-group-item">Listed: ${task.dateCreated }</li>
										<li class="list-group-item">Expires: ${task.dateDeadline}</li>
									</ul>

								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
<!-- End of Completed Requests -->



	<jsp:include page="includes/bootstrapFoot.jsp" />
</body>
</html>