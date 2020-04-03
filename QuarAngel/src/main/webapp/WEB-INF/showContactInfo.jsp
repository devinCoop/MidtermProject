<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Contact Info</title>
<jsp:include page="includes/bootstrapHead.jsp" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="includes/navbar.jsp" />

	<div class="container-fluid">
		<div align="center">
			<h5 class="modal-title" id="view">Requester Contact Info</h5>

			<h3>${userInfo.firstName}
				${userInfo.lastName}</h3>



		<div class="modal-body justify-content-center">



			<form action="viewProfile.do" method="GET">
				<table>
					<tr>
						<td>Name:</td>
						<td>${userInfo.firstName},${userInfo.lastName}</td>
					</tr>
					<tr>
						<td>Email:</td>
						<td>${userInfo.email}</td>
					</tr>
					<tr>
						<td>Phone:</td>
						<td>${userInfo.phone}</td>
					</tr>
					<tr>
						<td>Address:</td>
						<td>${userInfo.address.street},
							${userInfo.address.city},
							${userInfo.address.state},${userInfo.address.zipCode}</td>
					</tr>
				</table>
			</form>
		</div>
		</div>
	</div>

	<jsp:include page="includes/bootstrapFoot.jsp" />
</body>
</html>