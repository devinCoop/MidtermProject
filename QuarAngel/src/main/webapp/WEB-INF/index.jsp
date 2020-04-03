<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




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



	<div class="jumbotron jumbotron-fluid mb-10">
		<!-- <div class="container-fluid">
			<h1 class="display-4">Fluid jumbotron</h1>
			<p>This is a modified jumbotron that occupies the entire
				horizontal space of its parent.</p>
		</div> -->

	</div>


	<div class="bg-light text-secondary text-center h-20">
		<blockquote class="blockquote mb-10">
			<p>The purpose of life is not to be happy. It is to be useful, to
				be honorable, to be compassionate, to have it make some difference
				that you have lived and lived well.</p>
			<footer class="blockquote-footer">
				<cite title="Source Title">Ralph Waldo Emerson</cite>
			</footer>
		</blockquote>
	</div>

	<c:choose>
		<c:when test="${sessionScope.loggedInUser == null}">
			<div class="container-xl">
				<div class="row">
					<c:forEach items="${tasks}" var="task">
						<div class="card-container centermx drop-shadow lifted">
							<div class="card h-100">
								<div class="card-header">
									<span class="float-left">${task.requestor.username}</span><span
										class="float-right"><fmt:parseDate
											value="${task.dateCreated}" var="parsedDate"
											pattern="yyyy-MM-dd" /> Listed: <fmt:formatDate type="date"
											value="${parsedDate}" /></span>
								</div>
								<div class="card-body text-center">
									<p>${task.description }</p>
								</div>
								<ul class="list-group list-group-flush text-center">
									<li class="list-group-item"><button type="button"
											class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
											style="background-color: turquoise; color: white;"
											data-toggle="modal" data-target="#myModal1">Offer
											Help</button></li>
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
					</c:forEach>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container-xl">
				<div class="row">
					<c:forEach items="${tasks}" var="task">
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
									<li class="list-group-item"><a
										class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
										style="background-color: turquoise; color: white;"
										href="offerHelp.do?taskid=${task.id}" role="button">Offer
											Help</a></li>
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
					</c:forEach>
				</div>
			</div>
			<%-- 	<div class="container-fluid">
				<div class="row row-cols-1 row-cols-md-2">
					<c:forEach items="${tasks}" var="task">
						<div class="col mb-4 mt-4"> --%>
			<%-- 	<div class="card bg-light text-center mb-3 h-100">

								<div class="card-body text-secondary text-align-bottom">
									<h4 class="card-title">${task.requestor.username}</h4>
									<h6 class="card-subtitle mb-2 text-muted">${task.description}</h6>


								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">${RB.services}</li>
									<li class="list-group-item">Location:
										${task.requestor.address.city},
										${task.requestor.address.state}</li>
									<li class="list-group-item"><a
										class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
										style="background-color: turquoise; color: white;"
										href="offerHelp.do?taskid=${task.id}" role="button">Offer
											Help</a></li>
									<li class="list-group-item">Listed: ${task.dateCreated}</li>
									<li class="list-group-item">Expires: ${task.dateDeadline}</li>
								</ul>
							</div> --%>
			<!-- <div class="row row-cols-1 row-cols-md-2"> -->
			<%-- 		<div class="col mb-4">
								<div class="card">
									<img src="..." class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">This is a longer card with supporting
											text below as a natural lead-in to additional content. This
											content is a little bit longer.</p>
									</div>
								</div>
							</div>
						</div>
						<!-- </div> -->
					</c:forEach>
				</div>
			</div> --%>
		</c:otherwise>
	</c:choose>


	<jsp:include page="includes/bootstrapFoot.jsp" />

	<!-- Modal popup for not logged in state on home page -->


	<div class="modal fade" id="myModal1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Welcome to Quarangels</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
				</div>
				<div class="container"></div>
				<div class="modal-body text-center">
					<p>Please Register or Login before continuing</p>
				</div>
				<div class="modal-footer">

					<a data-dismiss="modal" data-toggle="modal"
						href="#registerModalCenter"
						class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
						style="background-color: turquoise; color: white;">Register</a> <a
						data-dismiss="modal" data-toggle="modal" href="#loginModalCenter"
						class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
						style="background-color: turquoise; color: white;">Login</a>
				</div>
			</div>
		</div>
	</div>

	<script>
		$("#registerModalCenter").on('show.bs.modal', function(e) {
			$("#myModal1").modal("hide");
		});

		$("#loginModalCenter").on('show.bs.modal', function(e) {
			$("#myModal1").modal("hide");
		});
	</script>

</body>
</html>