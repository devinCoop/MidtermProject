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
	<img src="img/profilePicDefault.png" class="profileImage" />
	<h3>${sessionScope.loggedInUser.firstName}
		${sessionScope.loggedInUser.lastName}</h3>
	<form action="editProfile.do" method="post">
		<table border="8" cellpadding="20">
			<tr>
				<td>Username:</td>
				<td><input type="text" name="username" value="${user.username}" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="text" name="password" value="${user.password}" /></td>
			</tr>
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="firstName"
					value="${user.firstName}" /></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lastName" value="${user.lastName}" /></td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td><input type="text" name="phone" value="${user.phone}" /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" value="${user.email}" /></td>
			</tr>
			<tr>
				<td>Street:</td>
				<td><input type="text" name="street" value="${user.address.street}" /></td>
			</tr>
			<tr>
				<td>City:</td>
				<td><input type="text" name="city" value="${user.address.city}" /></td>
			</tr>
			<tr>
				<td>State:</td>
				<td><input type="text" name="state" value="${user.address.state}" /></td>
			</tr>
			<tr>
				<td>Zip:</td>
				<td><input type="text" name="zipCode" value="${user.address.zipCode}" /></td>
			</tr>

			<td colspan="2"><input type="submit" value="Save Profile"></td>
		</table>
		<%-- <input type="hidden" name="addressId" value="${user.addressId}" /> --%> <input
			type="hidden" name="enabled" value="${user.enabled}" /> <input
			type="hidden" name="role" value="${user.role}" /> <input
			type="hidden" name="biography" value="${user.biography}" />
	</form>

</body>
</html>