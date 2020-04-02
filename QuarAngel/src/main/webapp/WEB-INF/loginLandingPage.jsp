<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logged In</title>
<link href="css/style.css" rel="stylesheet" />
<jsp:include page="includes/bootstrapHead.jsp" />
</head>
<body>
	<%-- <jsp:include page="includes/navbarLoggedIn.jsp" /> --%>
	<jsp:include page="includes/navbar.jsp" />



	<div class="jumbotron jumbotron-fluid jumbo-custom">
		<div class="container d-flex h-100 my-auto">
			<div class="card text-center align-self-center mx-auto w-75">
				<div class="card-header text-secondary">REQUEST HELP</div>
				<div class="card-body">
					<form:form class="justify-content-center text-secondary"
						action="requestSave.do" method="post" modelAttribute="task">
						<div class="form-group">
							<label for="description">Please give a brief description
								of what you need help with</label>
							<textarea class="form-control" name="description"
								id="description" rows="3"></textarea>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="dateTime">Date need help by</label>
								</labelDate>
								<input type="datetime-local" class="form-control" id="dateTime"
									name="dateDeadline">
							</div>
							<div class="form-group col-md-6">
								<label for="category">Select a category</label><select
									id="category" name="categoryid" class="form-control">
									<c:forEach items="${categories}" var="cat">
										<option value="${cat.id}">${cat.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>




						<div class="card-footer text-muted">
							<button type="submit" class="btn btn-primary mb-2" value="Save">Request</button>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</div>

	<div class="row row-cols-1 row-cols-md-2 row-cols-lg-4">
		<c:forEach items="${tasks}" var="task">
			<div class="col mb-4">
				<div class="card bg-light text-center mb-3 h-100">
					<div class="card-body text-secondary text-align-bottom">
						<h4 class="card-title">${task.requestor.username}</h4>
						<h6 class="card-subtitle mb-2 text-muted">${task.description}</h6>

					</div>
					<ul class="list-group list-group-flush">
						<%-- <li class="list-group-item">${RB.services}</li> --%>
						<li class="list-group-item">Location:
							${task.requestor.address.city}, ${task.requestor.address.state}</li>
						<li class="list-group-item"><a
							class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
							href="offerHelp.do?taskid=${task.id}" role="button">Offer
								Help</a></li>
						<li class="list-group-item">Listed: ${task.dateCreated }</li>
						<li class="list-group-item">Expires: ${task.dateDeadline}</li>
					</ul>

				</div>
				<ul class="list-group list-group-flush">
					<%-- <li class="list-group-item">${RB.services}</li> --%>
					<li class="list-group-item">Location:
						${task.requestor.address.city}, ${task.requestor.address.state}</li>
					<li class="list-group-item"><a
						class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
						href="offerHelp.do?taskid=${task.id}" role="button">Offer Help</a></li>
					<li class="list-group-item">Listed: ${task.dateCreated }</li>
					<li class="list-group-item">Expires: ${task.dateDeadline}</li>
				</ul>
			</div>
		</c:forEach>
	</div>
	<jsp:include page="includes/bootstrapFoot.jsp" />
</body>
</html>