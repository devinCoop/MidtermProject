<!DOCTYPE html>
<html>
  <title>Welcome</title>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />


  <body>
 <form action="loggedIn.do" method="get" modelAttribute="user">
		<input type="text" value="${user.username}" class="form-control" />

	<table border="8" cellpadding="1">
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Address</th>
			<th>City</th>
			<th>State</th>
			<th>Zip</th>
			
		</tr>
		<thead>
		<tbody>
			<c:forEach items="${user}" var="user">
				<tr>
					<td>${user.firstName, user.lastName}</td>
					<td>${user.email}</td>
					<td>${user.phone}</td>
					<td>${user.address}</td>
					<td>${user.city}</td>
					<td>${user.state}</td>
					<td>${user.zipCode}</td>
					
				</tr>
			</c:forEach>
		</tbody>
  </body>
</html>
