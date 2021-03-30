<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.app.pojos.User"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel.</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!--javascript-->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<style type="text/css">
.admin .card {
	border: 1px solid blue;
}

.admin .card:hover {
	background: #e2e2e2;
	cursor: pointer;
}
</style>
</head>
<body>
   <%
		User validatedUser = (User) session.getAttribute("current-user");
	System.out.println("in validated user" + validatedUser);
	if (validatedUser == null) {

		session.setAttribute("message", "You are not logged in!! Login First");
		response.sendRedirect("/user/login");
		return;
	} else {
		if (validatedUser.getUserType().equals("normal")) {
			session.setAttribute("message", "You are not admin!! Unautorised access.");
			//	response.sendRedirect("user/login");
	%>
	<spring:url value="/user/login" var="url" />
	<c:redirect url="${url}" />
	<%
		}
	}
	%>


	<!-- NavBar -->
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
					<li class="nav-item active"><a class="nav-link" href="/">Home
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


					<li class="nav-item active"><a class="nav-link" href="#!"><%=validatedUser.getUserName()%></a></li>

					<li class="nav-item active"><a class="nav-link" href="../">Logout</a></li>





				</ul>
			</div>
		</div>
	</nav>


	<!-- NavBar  -->
	<h4 style= "color: red; ">${requestScope.message}</h4>
	<div class="container admin">
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/seo-and-web.png">
						</div>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/list.png">
						</div>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>

			</div>


			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/product.png">
						</div>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>

		</div>

		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/keys.png">
						</div>
						<p>Click here to add categories</p>
						<h1 class="text-uppercase text-muted">Add Categories</h1>
					</div>
				</div>
			</div>


			<div class="col-md-6">
				<div class="card"  data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/plus.png">
						</div>
						<p>Click here to add products</p>
						<h1 class="text-uppercase text-muted">Add Products</h1>
					</div>
				</div>

			</div>
		</div>
	</div>



	<!-- Modal 1 -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Category
						Details.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="post" action="/category">
						<div class="form-group">
							<input  type="text" class="form-control" name="categoryTitle"
								placeholder="Enter Category Title" required="required" />
						</div>
						<div class="form-group">
							<textarea class="form-control"
								placeholder="Enter Category Description" name="CategoryDescription"
								required="required"></textarea>
						</div>
						<div class="container text-center">
							<button class="btn-btn-outline-success">Add Category</button>
						</div>

					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	 
	 
	 	
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Product
						Details.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="post" action="/product">
						<div class="form-group">
							<input type="text" class="form-control" name="pName"
								placeholder="Enter Product Title" required="required" />
						</div>
						<div class="form-group">
							<textarea class="form-control"
								placeholder="Enter Product Description" name="pDesc"
								required="required"></textarea>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter Product Price" required="required" />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter Product Discount" required="required" />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter Product Quantity" required="required" />
						</div>
						
						<div class="form-group">
							 <select name="catId" class="form-control" id="">
							<c:forEach var="c" items="${current_list}">
							<option value="${c.categoryId}">${c.categoryTitle}</option>
							</c:forEach>
							</select>
							
 				       </div> 
 				       
 				      <!--  <div class="form-group">
 				       <select name="category">
 				       <option value="category_id">Laptop</option>
 				       <option value="category_id">Mobile</option>
 				       <option value="category_id">Phone</option>
 				       </select>
 				       </div> -->
						
						<div class="form-group">
						<label for="pPic">Select Picture for product</label>
						<br>
						<input type="file" name="pPhoto" required="required"/>
						
						</div>
						
						
						<div class="container text-center">
							<button class="btn-btn-outline-success">Add Product</button>
						</div>

					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	

</body>
</html>