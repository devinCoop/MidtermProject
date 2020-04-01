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



					</form:form>
				</div>
				<div class="card-footer text-muted">
					<button type="submit" class="btn btn-primary mb-2" value="Save">Request</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>