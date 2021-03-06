<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rewards</title>
</head>
<body>
	<h3><a href="editProfile.do">Click to edit user</a></h3>
	<img src="img/profilePicDefault.png" class="profileImage" />
<h3>${sessionScope.loggedInUser.firstName} ${sessionScope.loggedInUser.lastName}</h3>

	<table border="8" cellpadding="20">
		<tr>
			<td>Name:</td>
			<td>${user.firstName} ${user.lastName}</td>
		</tr>
		<tr>
			<td>Rewards:</td>
			<td><button type="button" class="btn btn-primary">
  			Rewards <span class="badge badge-light">${numRewards}</span>
			</button></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td>${user.email}</td>
		</tr>
		<tr>
			<td>Phone:</td>
			<td>${user.phone}</td>
		</tr>
		<tr>
			<td>Address:</td>
			<td>${user.address.street} <br/>${user.address.city}, ${user.address.state}, ${user.address.zipCode}</td>
		</tr>
	</table>
</body>
</html>