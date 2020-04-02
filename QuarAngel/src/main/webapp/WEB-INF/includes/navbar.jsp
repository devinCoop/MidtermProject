<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>



<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand text-secondary" href="home.do">QUARANGEL</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">

		<div class="mr-auto"></div>
		<c:choose>
			<c:when test="${sessionScope.loggedInUser == null}">
				<button type="button"
					class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
					data-toggle="modal" data-target="#registerModalCenter">Register</button>
				<button type="button"
					class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
					data-toggle="modal" data-target="#loginModalCenter">Login</button>


			</c:when>
			<c:otherwise>
				<a role="button" class="btn btn-primary" href="viewNotifications.do">
	  			Notifications <span class="badge badge-light">${numNotifications}</span>
				</a>

				<button type="button"
					class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
					data-toggle="modal" data-target="#viewModalCenter">View
					Profile</button>
				<button type="button"
					class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
					data-toggle="modal" data-target="#editModalCenter">Edit
					Profile</button>


				<form class="form-inline my-2 my-lg-0" action="logout.do"
					method="GET">
					<button type="submit"
						class="btn btn-outline-secondary my-2 my-sm-0 mx-3">Logout</button>
				</form>


			</c:otherwise>
		</c:choose>
	</div>
</nav>

<!-- Popup for login -->
<div class="modal fade" id="loginModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="login" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="login">Login</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="loggingIn.do" method="POST">
					<div class="form-group">
						<label for="username">Username</label> <input type="text"
							class="form-control" id="username" name="username"
							aria-describedby="emailHelp" required>
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							class="form-control" id="password" name="password" required>
					</div>
					<button type="submit"
						class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
						style="background-color: turquoise; color: white;">Login</button>
				</form>

			</div>
		</div>
	</div>
</div>

<!--  Popup for register -->
<div class="modal fade" id="registerModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="register" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="register">Register</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<form action="registration.do" method="POST">

						<div class="form-group">
							<label for="username">Username</label> <input type="text"
								class="form-control" id="username" name="username" required>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password" required>
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email" required>
						</div>
						<div class="form-group">
							<label for="firstName">First Name</label> <input type="text"
								class="form-control" id="firstName" name="firstName"
								placeholder="Janis" required>
						</div>
						<div class="form-group">
							<label for="lastName">Last Name</label> <input type="text"
								class="form-control" id="lastName" name="lastName"
								placeholder="Joplin" required>
						</div>
						<div class="form-group">
							<label for="phone">Phone</label> <input type="text"
								class="form-control" id="phone" name="phone"
								placeholder="(555)555-5555" required>
						</div>
						<div class="form-group">
							<label for="street">Street</label> <input type="text"
								class="form-control" id="street" name="street"
								placeholder="1234 Main St" required>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="city">City</label> <input type="text"
									class="form-control" id="city" name="city" required>
							</div>
							<div class="form-group col-md-4">
								<label for="state">State</label> <select id="state"
									class="form-control" name="state" required>
									<option selected>Choose...</option>
									<option>Colorado</option>
									<option>Alabama</option>
									<option>Alaska</option>
									<option>Arizona</option>
									<option>Arkansas</option>
									<option>California</option>
									<option>Colorado</option>
									<option>Connecticut</option>
									<option>Delaware</option>
									<option>Florida</option>
									<option>Georgia</option>
									<option>Hawaii</option>
									<option>Idaho</option>
									<option>Illinois</option>
									<option>Indiana</option>
									<option>Iowa</option>
									<option>Kansas</option>
									<option>Kentucky</option>
									<option>Louisiana</option>
									<option>Maine</option>
									<option>Maryland</option>
									<option>Massachusetts</option>
									<option>Michigan</option>
									<option>Minnesota</option>
									<option>Mississippi</option>
									<option>Missouri</option>
									<option>Montana</option>
									<option>Nebraska</option>
									<option>Nevada</option>
									<option>New Hampshire</option>
									<option>New Jersey</option>
									<option>New Mexico</option>
									<option>New York</option>
									<option>North Carolina</option>
									<option>North Dakota</option>
									<option>Ohio</option>
									<option>Oklahoma</option>
									<option>Oregon</option>
									<option>Pennsylvania</option>
									<option>Rhode Island</option>
									<option>South Carolina</option>
									<option>South Dakota</option>
									<option>Tennessee</option>
									<option>Texas</option>
									<option>Utah</option>
									<option>Vermont</option>
									<option>Virginia</option>
									<option>Washington</option>
									<option>West Virginia</option>
									<option>Wisconsin</option>
									<option>Wyoming</option>
								</select>
							</div>
							<div class="form-group col-md-2">
								<label for="zipCode">Zip</label> <input type="text"
									class="form-control" id="zipCode" name="zipCode">
							</div>
						</div>

						<button type="submit"
							class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
							style="background-color: turquoise; color: white;">Register</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Popup button for view profile -->

<div class="modal fade" id="viewModalCenter" tabindex="-1" role="dialog"
	aria-labelledby="view" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="view">View Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

				<div class="container-fluid">
					<div class="modal-body justify-content-center">

						<img src="img/profilePicDefault.png" class="profileImage" />

						<h3>${sessionScope.loggedInUser.firstName}
							${sessionScope.loggedInUser.lastName}</h3>
							

									<h5>${sessionScope.numRewards} rewards </h5>

					

					

						<form action="viewProfile.do" method="GET">
							<table>
								<tr>
									<td>Name:</td>
									<td>${sessionScope.loggedInUser.firstName},${sessionScope.loggedInUser.lastName}</td>
								</tr>
								<tr>
									<td>Email:</td>
									<td>${sessionScope.loggedInUser.email}</td>
								</tr>
								<tr>
									<td>Phone:</td>
									<td>${sessionScope.loggedInUser.phone}</td>
								</tr>
								<tr>
									<td>Address:</td>
									<td>${sessionScope.loggedInUser.address.street},
										${sessionScope.loggedInUser.address.city},
										${sessionScope.loggedInUser.address.state},${sessionScope.loggedInUser.address.zipCode}</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<!--  Popup for Edit Profile button -->
<div class="modal fade" id="editModalCenter" tabindex="-1" role="dialog"
	aria-labelledby="edit" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="edit">Edit Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<form action="editProfile.do" method="POST">
						<div class="form-group">
							<label for="username">Username</label> <input type="text"
								class="form-control" id="username" name="username" value = "${sessionScope.loggedInUser.username}" required>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password" value= "${sessionScope.loggedInUser.password}" required>
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email" value= "${sessionScope.loggedInUser.email}" required>
						</div>
						<div class="form-group">
							<label for="firstName">First Name</label> <input type="text"
								class="form-control" id="firstName" name="firstName" value="${sessionScope.loggedInUser.firstName}"
								placeholder="Janis" required>
						</div>
						<div class="form-group">
							<label for="lastName">Last Name</label> <input type="text"
								class="form-control" id="lastName" name="lastName" value="${sessionScope.loggedInUser.lastName}"
								placeholder="Joplin" required>
						</div>
						<div class="form-group">
							<label for="phone">Phone</label> <input type="text"
								class="form-control" id="phone" name="phone" value="${sessionScope.loggedInUser.phone}"
								placeholder="(555)555-5555" required>
						</div>
						<div class="form-group">
							<label for="street">Street</label> <input type="text"
								class="form-control" id="street" name="street" value="${sessionScope.loggedInUser.address.street}"
								placeholder="1234 Main St" required>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="city">City</label> <input type="text"
									class="form-control" id="city" name="city" value="${sessionScope.loggedInUser.address.city}" required>
							</div>
							<div class="form-group col-md-4">
								<label for="state">State</label> <select id="state"
									class="form-control" name="state"  value="${sessionScope.loggedInUser.address.state}" required>
									<option selected>Choose...</option>
									<option>Colorado</option>
									<option>Alabama</option>
									<option>Alaska</option>
									<option>Arizona</option>
									<option>Arkansas</option>
									<option>California</option>
									<option>Colorado</option>
									<option>Connecticut</option>
									<option>Delaware</option>
									<option>Florida</option>
									<option>Georgia</option>
									<option>Hawaii</option>
									<option>Idaho</option>
									<option>Illinois</option>
									<option>Indiana</option>
									<option>Iowa</option>
									<option>Kansas</option>
									<option>Kentucky</option>
									<option>Louisiana</option>
									<option>Maine</option>
									<option>Maryland</option>
									<option>Massachusetts</option>
									<option>Michigan</option>
									<option>Minnesota</option>
									<option>Mississippi</option>
									<option>Missouri</option>
									<option>Montana</option>
									<option>Nebraska</option>
									<option>Nevada</option>
									<option>New Hampshire</option>
									<option>New Jersey</option>
									<option>New Mexico</option>
									<option>New York</option>
									<option>North Carolina</option>
									<option>North Dakota</option>
									<option>Ohio</option>
									<option>Oklahoma</option>
									<option>Oregon</option>
									<option>Pennsylvania</option>
									<option>Rhode Island</option>
									<option>South Carolina</option>
									<option>South Dakota</option>
									<option>Tennessee</option>
									<option>Texas</option>
									<option>Utah</option>
									<option>Vermont</option>
									<option>Virginia</option>
									<option>Washington</option>
									<option>West Virginia</option>
									<option>Wisconsin</option>
									<option>Wyoming</option>
								</select>
							</div>
							<div class="form-group col-md-2">
								<label for="zipCode">Zip</label> <input type="text"
									class="form-control" id="zipCode" name="zipCode" value="${sessionScope.loggedInUser.address.zipCode}">
							</div>
						</div>
						<button type="submit"
							class="btn btn-outline-secondary my-2 my-sm-0 mx-3"
							style="background-color: turquoise; color: white;">Edit
							Profile</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</div>
