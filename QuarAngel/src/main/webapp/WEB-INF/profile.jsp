<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><a href="editProfile.do">Click to edit user</a></h3>
	<img src="img/profilePicDefault.png" class="profileImage" />
<h3>${sessionScope.loggedInUser.firstName} ${sessionScope.loggedInUser.lastName}</h3>

</body>
</html>