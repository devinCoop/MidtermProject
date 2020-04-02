<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quarangel</title>
<jsp:include page="includes/bootstrapHead.jsp" />
<link href="css/style.css" rel="stylesheet" />
<script type="text/javascript" src="js/action.js.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>
	<jsp:include page="includes/navbar.jsp" />



	<div class="jumbotron jumbotron-fluid">
		<!-- <div class="container-fluid">
			<h1 class="display-4">Fluid jumbotron</h1>
			<p>This is a modified jumbotron that occupies the entire
				horizontal space of its parent.</p>
		</div> -->

	</div>
		<div class="card">
			<div class="card-body">
				<div class="card bg-light text-center mb-2 h-20">
					<blockquote class="blockquote mb-0">
						<p>The purpose of life is not to be happy. It is to be useful,
							to be honorable, to be compassionate, to have it make some
							difference that you have lived and lived well.</p>
						<footer class="blockquote-footer">
							<cite title="Source Title">Ralph Waldo Emerson</cite>
						</footer>
					</blockquote>
				</div>
			</div>
		</div>


		<div class="container">
			<div class="row row-cols-1 row-cols-md-2 row-cols-lg-4">
				<c:forEach items="${tasks}" var="task">
					<div class="col mb-4 mt-4">
						<div class="card bg-light text-center mb-3 h-100">

							<div class="card-body text-secondary text-align-bottom">
								<h4 class="card-title">${task.requestor.username}</h4>
								<h6 class="card-subtitle mb-2 text-muted">${task.description}</h6>

							</div>
							<ul class="list-group list-group-flush">
								<%-- <li class="list-group-item">${RB.services}</li> --%>
								<li class="list-group-item">Location:
									${task.requestor.address.city}, ${task.requestor.address.state}
								</li>
								<li class="list-group-item"><button type="button"
										class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
										style="background-color: turquoise; color: white;"
										data-toggle="modal" data-target="#loginModalCenter">Offer
										Help</button></li>
								<li class="list-group-item">Listed: ${task.dateCreated}</li>
								<li class="list-group-item">Expires: ${task.dateDeadline}</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	<jsp:include page="includes/bootstrapFoot.jsp" />
</body>
</html>