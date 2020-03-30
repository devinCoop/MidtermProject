<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Edit profile</h1>
	<h3>${sessionScope.loggedInUser.firstName}
		${sessionScope.loggedInUser.lastName}</h3>
	<form action="editProfile.do" method="post">
		<input type="text" name="firstName" value="${user.firstName}" /> <input
			type="submit" value="Save Profile" />

	</form>
</body>
</html>