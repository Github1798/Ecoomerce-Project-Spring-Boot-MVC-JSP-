<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>


	<!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
		<div class="container">
			<a class="navbar-brand" href="#">FlipKartt</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="../">Home
							<span class="sr-only">(current)</span>
					</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Categories </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="/user/login">Login</a></li>

					<li class="nav-item active"><a class="nav-link"
						href="/user/register">Register</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<!--NavBar  -->
    
    <div class="container-fluid">

		<div class="row mt-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body px-5">
						<div class="container text-center">
							<img src="img/add-friend.png" style="max-width: 100px;"
								class="img-fluid" alt="">
						</div>
						<h3 class="text-center my-3">Sign up here!</h3>

						<form method="post" action="/user/register">
							<div class="form-group">
								<label for="name">User name</label> <input name="name"
									type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter name" required="required">
							</div>
							<div class="form-group">
								<label for="email">User email</label> <input name="email"
									type="text" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email" required="required">
							</div>
							<div class="form-group">
								<label for="password">User Password</label> <input
									name="password" type="password" class="form-control" id="password"
									aria-describedby="emailHelp" placeholder="Enter password" required="required">
								<div class="form-group">
									<label for="phoneNo">User phoneNo</label> <input name="phoneNo"
										type="text" class="form-control" id="phoneNo"
										aria-describedby="emailHelp" placeholder="Enter phoneNo">
									<div class="form-group">
										<label for="Address">User Address</label>
										<textarea name="Address" style="height: 100px;"
											class="form-control" placeholder="Enter your Address"></textarea>

									</div>
									<div class="container text-center">
										<button class="btn btn-outline-success">Register</button>
										<!-- <button class="btn btn-outline-warning">Reset</button> -->
									</div>


								</div>
							</div>




						</form>
					</div>
				</div>

			</div>
</body>
</html>