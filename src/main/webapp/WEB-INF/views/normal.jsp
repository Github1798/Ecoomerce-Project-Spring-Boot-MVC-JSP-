<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Shopping.</title>
<style>
body {
	background-image: url("/user/img/cart4.jpeg");
	background-size: 100%;
	background-repeat: no-repeat;
}
/* .container{
text-align: center;  
color:green;
width: 300px;  
height: 200px;  
padding-top: 300px; 
} */

button {
	cursor: pointer;
	position: relative;
	padding: 2.5rem 7.5rem;
	border-radius: 3.75rem;
	line-height: 2.5rem;
	font-size: 2rem;
	font-weight: 600;
	
	border: 1px solid #012880;
	background-image: linear-gradient(-180deg, #FF89D6 0%, #C01F9E 100%);
	box-shadow: 0 1rem 1.25rem 0 rgba(22,75,195,0.50),
							0 -0.25rem 1.5rem rgba(110, 15, 155, 1) inset,
							0 0.75rem 0.5rem rgba(255,255,255, 0.4) inset,
							0 0.25rem 0.5rem 0 rgba(180, 70, 207, 1) inset;
}

button span {
	color: transparent;
	background-image: linear-gradient(0deg, #EE82DA 0%, #FEFAFD 100%);
	-webkit-background-clip: text;
	background-clip: text;
	filter: drop-shadow(0 2px 2px hsla(290, 100%, 20%, 1));
}

button::before {
	content: "";
	display: block;
	height: 0.25rem;
	position: absolute;
	top: 0.5rem;
	left: 50%;
	transform: translateX(-50%);
	width: calc(100% - 7.5rem);
	background: #fff;
	border-radius: 100%;
	
	opacity: 0.7;
	background-image: linear-gradient(-270deg, rgba(255,255,255,0.00) 0%, #FFFFFF 20%, #FFFFFF 80%, rgba(255,255,255,0.00) 100%);
}

button::after {
	content: "";
	display: block;
	height: 0.25rem;
	position: absolute;
	bottom: 0.75rem;
	left: 50%;
	transform: translateX(-50%);
	width: calc(100% - 7.5rem);
	background: #fff;
	border-radius: 100%;
	
	filter: blur(1px);
	opacity: 0.05;
	background-image: linear-gradient(-270deg, rgba(255,255,255,0.00) 0%, #FFFFFF 20%, #FFFFFF 80%, rgba(255,255,255,0.00) 100%);
}
</style>
</head>
<body>
	 <center>
	<div class="container">
		<button class="btn btn-outline-success ">
			<a href="/">Start Shopping</a>
		</button>
		</div>
	</center> 
<!-- 	<button>
	<span>Jelly Button</span>
</button>
	 -->
	
</body>
</html>