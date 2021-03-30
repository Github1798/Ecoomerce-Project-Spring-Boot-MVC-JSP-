<%@page import="com.app.pojos.User"%>

<%
		User validatedUser = (User) session.getAttribute("current-user");
	System.out.println("in validated user" + validatedUser);
	if (validatedUser == null) {

		session.setAttribute("message", "You are not logged in!! Login First to access checkOut page.");
		response.sendRedirect("/user/login");
		return;
	}
%>
	






<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CheckOut</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<!--JavaScript-->

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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script>
	
	
	

	function add_to_cart(pid,pname,pprice) {
		
		let cart=localStorage.getItem("cart")	
		if(cart==null)
			{
			let products=[];
			let	 product={pId:pid,pName:pname,pQuantity:1,pPrice:pprice}
			products.push(product);
			localStorage.setItem("cart",JSON.stringify(products));
			
			/* console.log("Product added for the first time") */
			showToast("Item added to cart");
			}
		else
		{
			//cart is already present
		 let pCart=JSON.parse(cart);	
		 let oldProduct=pCart.find
		 ((item)=> item.pId==pid);
		 if(oldProduct){
			 //we have to increase quantity
			 oldProduct.pQuantity=oldProduct.pQuantity+1;
			 pCart.map((item)=>{
				 if(item.pId==oldProduct.pId){
					 item.pQuantity=oldProduct.pQuantity;
				 }
			 })
			  
			 localStorage.setItem("cart",JSON.stringify(pCart));
			 showToast(oldProduct.pName+" "+"product quantity increased Quantity="+oldProduct.pQuantity);
			 
		 }else{
			 //we have to add the product
				let	 product={pId:pid,pName:pname,pQuantity:1,pPrice:pprice}
                pCart.push(product)
                localStorage.setItem("cart",JSON.stringify(pCart));
			
			/* 	console.log("product added"); */
				showToast("Product added to cart");
				
		 }
		}
		
		updateCart();
		
		//alert(cartString);
	}
	
	function updateCart()
	{
		let cartString=localStorage.getItem("cart");
		let cart=JSON.parse(cartString);
		
		
		if(cart==null || cart.length==0)
			{
			  console.log("cart is empty");
			  $(".cart-items").html(`(0)`);
			  $(".cart-body").html("<h3>Your Cart is Empty!!</h3>");
			  $(".checkOut-btn").attr('disabled',true);
			  
			}else{
				
				//if there is something in the cart
				/* console.log("whole cart items"+cart); */
				
				var totalItems=JSON.parse(localStorage["cart"]).length;
				
				/* console.log("cartstring"+cartString); */
				
				/* console.log("totalitems:"+totalItems); */
				$(".cart-items").html(cart.length);
				
				let table=`
				    <table class='table'>
				    <thead class='thead-light'>
				    <tr>
				    <th>Item Name</th>
				    <th>Price</th>
				    <th>Quantity</th>
				    <th>Total Price</th>
				    <th>Action</th>
				    </tr>
				    </thead> `;
				
			  /*  for(var i in cart)	{
				   var item=cart[i];
				   var row=`"<tr><td>" + ${item.pName} + "</td><td>" +
                   item.pPrice + "</td><td>" + item.pQuantity + "</td><td>"
                   + item.pQuantity * item.pPrice + "</td><td>"`
				   
				   
				   
			   } */
				    
			     let totalPrice=0;
				 cart.map((item) => {
					
					table+="<tr><td>"+item.pName+"</td><td>"
					+item.pPrice+"</td><td>"+item.pQuantity+
					"</td><td>"+item.pQuantity*item.pPrice+"</td><td>"+ "<button onclick='deleteFromCart("+item.pId+")'  class='btn btn-danger btn-sm'>Remove</button></td></tr>" 
					totalPrice+=item.pPrice*item.pQuantity;    
					//console.log("Net Pice"+totalPrice)
					
				})   
				
				 
				
				
				
				
				
				table=table+`</table>`
				  
				
				$(".cart-body").html(table); 
				 $(".checkOut-btn").attr('disabled',false);
				
			}
		}
	
	    function deleteFromCart(pid){
	    	
	    	let cart=JSON.parse(localStorage.getItem('cart'));
	    	let newcart=cart.filter((item)=> item.pId!=pid);
	    	localStorage.setItem('cart',JSON.stringify(newcart));
	    	updateCart();
	    	showToast("Item removed from cart");
	    }
	     
	
	$(document).ready(function(){
		updateCart();
	})
	
	
	</script>


</head>
<body>


	<!-- NavBar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-primary ">
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

					<li class="nav-item active"><a class="nav-link" href="#!"
						data-toggle="modal" data-target="#cart"><i
							class="fa fa-cart-plus" style="font-size: 30px;"></i><span
							class="ml-0 cart-items">(0)</span></a></li> 

					<li class="nav-item active"><a class="nav-link"
						<%-- href="<%= validatedUser.getUserType().equals("admin") ? "/admin" : "/" %>" --%>><%=validatedUser.getUserName()%></a></li>

					<li class="nav-item active"><a class="nav-link"
						href="../user/register">Register</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!--NavBar  -->


	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center my-3">Your Selected Items.</h3>
						<div class="cart-body"></div>

					</div>

				</div>
			</div>
			<div class="col-md-6">

				<div class="card">
					<div class="card-body">
						<h3 class="text-center my-3">Your Details for Order.</h3>
						<form action="#!">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value="<%=validatedUser.getEmail()%>" type="email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="name">Your Name</label> <input
									value="<%=validatedUser.getUserName()%>" type="name" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter name">
							</div>
							
							
							<div class="form-group">
								<label for="number">Your MobileNo.</label> <input
									value="<%=validatedUser.getUserPhone()%>" type="name" class="form-control" id="number"
									aria-describedby="emailHelp" placeholder="Enter Contact No.">
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1">Enter Shipping
									Address</label>
								<textarea  class="form-control" id="exampleFormControlTextarea1"
									rows="3" placeholder="Enter your Address"></textarea>
							</div>
							
							<div class="container text-center">
							     <button class="btn btn-outline-success"><a href="/payMent">Place Order!</a></button>
							     <button class="btn btn-outline-primary" ><a href="/">Continue Shopping</a></button>
							</div>

						</form>
					</div>

				</div>

			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="cart" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">It's Your Cart</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="cart-body"></div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary checkOut-btn"
						onclick="goToCheckOut()">CheckOut</button>
				</div>
			</div>
		</div>
	</div>

	<!-- <div id="toast">This is our custom Toast Text</div> -->


</body>
</html>