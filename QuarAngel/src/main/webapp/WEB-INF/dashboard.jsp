<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
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









	<div class="container-fluid mt-10">

		<h5>My Requests</h5>
		<h6>Waiting for an offer</h6>
		<!-- Waiting on an Offer -->
		<div class="container-xl">
			<div class="row">
				<c:forEach items="${userTasks}" var="task">
					<c:choose>
						<c:when test="${empty task.notifications}">

							<div class="card-container centermx drop-shadow lifted">
								<div class="card h-100">
									<div class="card-header">
										<span class="float-left custom">${task.requestor.username}</span><span
											class="float-right"><fmt:parseDate
												value="${task.dateCreated}" var="parsedDate"
												pattern="yyyy-MM-dd" /> Listed: <fmt:formatDate type="date"
												value="${parsedDate}" /></span>
									</div>
									<div class="card-body text-center">
										<p class="my-auto">${task.description }</p>
									</div>
									<ul class="list-group list-group-flush text-center">
										<li class="list-group-item">Waiting on an offer...</li>
									</ul>
									<div class="card-footer condensed">
										<span class="float-left">Location:
											${task.requestor.address.city },
											${task.requestor.address.state}</span> <span class="float-right"><fmt:parseDate
												value="${task.dateDeadline}" var="parsedExpDate"
												pattern="yyyy-MM-dd" />Expires: <fmt:formatDate type="date"
												value="${parsedExpDate}" /></span>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>
		<!-- End of Waiting on an Offer -->

		<!-- Accept Offer -->
		<h5>My Requests</h5>
		<h6>Waiting to accept an offer</h6>

		<div class="container-xl">
			<div class="row">
				<c:forEach items="${userTasks}" var="task">
					<c:forEach items="${task.notifications }" var="notif">
						<c:choose>
							<c:when test="${task.volunteer == null && notif != null}">

								<div class="card-container centermx drop-shadow lifted">
									<div class="card h-100">
										<div class="card-header">
											<span class="float-left custom">${task.requestor.username}</span><span
												class="float-right"><fmt:parseDate
													value="${task.dateCreated}" var="parsedDate"
													pattern="yyyy-MM-dd" /> Listed: <fmt:formatDate
													type="date" value="${parsedDate}" /></span>
										</div>
										<div class="card-body text-center">
											<p class="my-auto">${task.description }</p>
											<p class="my-auto">You got an offer from
												${notif.sendingUser.firstName } ${notif.sendingUser.lastName }</p>
										</div>
										<ul class="list-group list-group-flush text-center">
											<li class="list-group-item"><%-- <a
												class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
												style="background-color: turquoise; color: white;"
												href="confirmOffer.do?taskid=${task.id }" role="button">Accept
													Offer</a> --%>
													<form class="w3-container"
												action="confirmOffer.do?taskid=${task.id }" method="GET">
												<input type="hidden" name="taskid" value="${task.id }" />
												<input type="hidden" name="notificationId" value="${notif.id }" />
												<button class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
													style="background-color: turquoise; color: white;"
													type="submit">Accept Offer</button>
											</form>
													
													</li>
										</ul>
										<div class="card-footer condensed">
											<span class="float-left">Location:
												${task.requestor.address.city },
												${task.requestor.address.state}</span> <span class="float-right"><fmt:parseDate
													value="${task.dateDeadline}" var="parsedExpDate"
													pattern="yyyy-MM-dd" />Expires: <fmt:formatDate
													type="date" value="${parsedExpDate}" /></span>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:forEach>
			</div>
		</div>






		<!-- End of Accept Offer -->
		<!-- Mark the Job as Complete -->
		<!-- <div class="container-fluid"> -->
		<h5>My Requests</h5>
		<h6>Waiting to mark job as complete</h6>
		<div class="container-xl">
			<div class="row">
				<c:forEach items="${userTasks}" var="task">
					<c:choose>
						<c:when
							test="${task.volunteer != null && task.dateCompleted == null}">

							<div class="card-container centermx drop-shadow lifted">
								<div class="card h-100">
									<div class="card-header">
										<span class="float-left custom">${task.requestor.username}</span><span
											class="float-right"><fmt:parseDate
												value="${task.dateCreated}" var="parsedDate"
												pattern="yyyy-MM-dd" /> Listed: <fmt:formatDate type="date"
												value="${parsedDate}" /></span>
									</div>
									<div class="card-body text-center">
										<p class="my-auto">${task.description }</p>
										<p class="my-auto">Waiting for ${task.volunteer.firstName}
											to complete the job.</p>
									</div>
									<ul class="list-group list-group-flush text-center">
										<li class="list-group-item"><form class="w3-container"
												action="completeJob.do?taskid=${task.id }" method="GET">
												<input type="hidden" name="taskid" value="${task.id }" />
												<button class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
													style="background-color: turquoise; color: white;"
													type="submit">Mark Complete</button>
											</form></li>
									</ul>
									<div class="card-footer condensed">
										<span class="float-left">Location:
											${task.requestor.address.city },
											${task.requestor.address.state}</span> <span class="float-right"><fmt:parseDate
												value="${task.dateDeadline}" var="parsedExpDate"
												pattern="yyyy-MM-dd" />Expires: <fmt:formatDate type="date"
												value="${parsedExpDate}" /></span>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>

		<!-- End of Mark the Job as Complete -->

		<!-- Waiting on Requestor to Accept Offer -->
		<!-- <div class="container-fluid"> -->


		<%-- 	<h5>My Volunteer Offers</h5>
	<h6>Waiting on Requestor to Accept Offer</h6>
	<!-- <div class="row row-cols-1 row-cols-md-3"> -->
	<div class="card-columns">
		<c:forEach items="${noVolunteerTasks}" var="task">
			<c:forEach items="${task.notifications }" var="notif">
				<c:choose>
					<c:when
						test="${notif.sendingUser.id == sessionScope.loggedInUser.id}">
						<div class="card bg-light text-center mb-3 h-100">
							<div class="card-body text-secondary text-align-bottom">
								<h4 class="card-title">${task.requestor.username}</h4>
								<h6 class="card-subtitle mb-2 text-muted">${task.description}</h6>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">Location:
									${task.requestor.address.city}, ${task.requestor.address.state}</li>
								<li class="list-group-item">You got an offer from
									${notif.sendingUser.firstName } ${notif.sendingUser.lastName }</li>

								<li class="list-group-item">Waiting on
									${task.requestor.username} to accept your offer</li>
								<li class="list-group-item"><fmt:parseDate
										value="${task.dateCreated}" var="parsedDate"
										pattern="yyyy-MM-dd" /> <b>Listed:</b> <fmt:formatDate
										type="date" value="${parsedDate}" /><br></li>
								<li class="list-group-item"><fmt:parseDate
										value="${task.dateDeadline}" var="parsedExpDate"
										pattern="yyyy-MM-dd" /> <b>Expires:</b> <fmt:formatDate
										type="date" value="${parsedExpDate}" /><br></li>
							</ul>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</c:forEach>
	</div>

 --%>

		<!-- </div> -->

		<!-- End of Waiting on Requestor to Accept Offer -->

		<!-- View Contact info for Requestor to link up and finish job -->

		<h5>My Volunteer Offers</h5>
		<h6>View Requestor Contact Info to link up and finish job</h6>
		<div class="container-xl">
			<div class="row">
				<c:forEach items="${volunteerTasks}" var="task">
					<c:choose>
						<c:when test="${task.dateCompleted == null}">

							<div class="card-container centermx drop-shadow lifted">
								<div class="card h-100">
									<div class="card-header">
										<span class="float-left custom">${task.requestor.username}</span><span
											class="float-right"><fmt:parseDate
												value="${task.dateCreated}" var="parsedDate"
												pattern="yyyy-MM-dd" /> Listed: <fmt:formatDate type="date"
												value="${parsedDate}" /></span>
									</div>
									<div class="card-body text-center">
										<p class="my-auto">${task.description }</p>
									</div>
									<ul class="list-group list-group-flush text-center">
										<li class="list-group-item"><button type="button"
												class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
												style="background-color: turquoise; color: white;"
												data-toggle="modal" data-target="#contactModal">Please
												contact</button></li>
									</ul>
									<div class="card-footer condensed">
										<span class="float-left">Location:
											${task.requestor.address.city },
											${task.requestor.address.state}</span> <span class="float-right"><fmt:parseDate
												value="${task.dateDeadline}" var="parsedExpDate"
												pattern="yyyy-MM-dd" />Expires: <fmt:formatDate type="date"
												value="${parsedExpDate}" /></span>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>

		<!-- End of View Contact info for Requestor to link up and finish job -->

		<!-- Completed Requests -->

		<h6>My Completed Requests</h6>

		<div class="container-xl">
			<div class="row">
				<c:forEach items="${userTasks}" var="task">
					<c:choose>
						<c:when test="${task.dateCompleted != null}">

							<div class="card-container centermx drop-shadow lifted">
								<div class="card h-100">
									<div class="card-header">
										<span class="float-left custom">${task.requestor.username}</span><span
											class="float-right"><fmt:parseDate
												value="${task.dateCreated}" var="parsedDate"
												pattern="yyyy-MM-dd" /> Listed: <fmt:formatDate type="date"
												value="${parsedDate}" /></span>
									</div>
									<div class="card-body text-center">
										<p class="my-auto">${task.description }</p>
									</div>
									<ul class="list-group list-group-flush text-center">
										<li class="list-group-item">Job is complete</li>
									</ul>
									<div class="card-footer condensed">
										<span class="float-left">Location:
											${task.requestor.address.city },
											${task.requestor.address.state}</span> <span class="float-right"><fmt:parseDate
												value="${task.dateDeadline}" var="parsedExpDate"
												pattern="yyyy-MM-dd" />Expires: <fmt:formatDate type="date"
												value="${parsedExpDate}" /></span>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>

		<!-- End of Completed Requests -->

		<h5>My Completed Volunteers</h5>

		<div class="container-xl">
			<div class="row">
				<c:forEach items="${volunteerTasks}" var="task">
					<c:choose>
						<c:when test="${task.dateCompleted != null}">

							<div class="card-container centermx drop-shadow lifted">
								<div class="card h-100">
									<div class="card-header">
										<span class="float-left custom">${task.requestor.username}</span><span
											class="float-right"><fmt:parseDate
												value="${task.dateCreated}" var="parsedDate"
												pattern="yyyy-MM-dd" /> Listed: <fmt:formatDate type="date"
												value="${parsedDate}" /></span>
									</div>
									<div class="card-body text-center">
										<p class="my-auto">${task.description }</p>
									</div>
									<ul class="list-group list-group-flush text-center">
										<li class="list-group-item">Job is complete</li>
									</ul>
									<div class="card-footer condensed">
										<span class="float-left">Location:
											${task.requestor.address.city },
											${task.requestor.address.state}</span> <span class="float-right"><fmt:parseDate
												value="${task.dateDeadline}" var="parsedExpDate"
												pattern="yyyy-MM-dd" />Expires: <fmt:formatDate type="date"
												value="${parsedExpDate}" /></span>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>

		<!-- End of Completed Offers -->

		<jsp:include page="includes/bootstrapFoot.jsp" />
</body>
</html>