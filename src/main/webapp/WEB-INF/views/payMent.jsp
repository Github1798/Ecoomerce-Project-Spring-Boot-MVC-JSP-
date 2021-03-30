<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>payment</title>
</head>
<body>
	<center>
		<h1 style="font-style: italic;">Welcome to payment gateway</h1>

		<form>
			<table>
				<tr>
					<td><label>Select type of card</label> <select name="cards">
							<option value="visa">Visa</option>
							<option value="mastercard">Mastercard</option>
							<option value="rupay">Rupay</option>
							<option value="maestro">Maestro</option>
					</select></td>
				</tr>
				<tr>
					<td><label>Accountholder Name : </label><input type="text"
						name="accountholderName" required></td>
				</tr>
				<tr>
					<td><label>Account Number : </label><input type="text"
						name="accountNumber" required></td>
				</tr>
				<tr>
					<td><label>IFSC code : </label><input type="text" name="ifsc"
						required></td>
				</tr>
				<tr>
					<td><label>Expiry Month & Year : </label><input type="month"
						name="month"></td>
				</tr>
				<tr>
					<td><label>cvv: </label><input type="text" name="cvv" required></td>
				</tr>
			</table>
			<br> <button class="btn"><a href="/end">pay</a></button>
		</form>
	</center>
	<br>
	<center>
		<img src="/user/img/payMent.png" width="400" height="100">
	</center>
	<h1></h1>
</body>
</html>