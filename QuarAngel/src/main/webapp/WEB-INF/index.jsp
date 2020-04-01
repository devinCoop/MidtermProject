<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<jsp:include page="includes/bootstrapHead.jsp" />
<link href="css/style.css" rel="stylesheet" />
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


	<jsp:include page="includes/bootstrapFoot.jsp" />
</body>
</html>