<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Signup</title>
<%@ include file = "ExternalLinks.jsp" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/PlaceOrder.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->



</head>

<body>

<%@ include file = "Header.jsp" %>
<%@ include file = "Navbar.jsp" %>

<!-- Main part -->
<!-- main -->
<%
int Photogid=0;
if(request.getParameter("id")!=null)
{
	Photogid=Integer.parseInt(request.getParameter("id")); 
	System.out.println("Photographer Id at BookPhotographer: "+Photogid);

}
else
{
	Photogid=0;	
}
%>
	<div class="main-w3layouts wrapper">
		<h1>Customer SignUp Form</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form action="SignupCustomerinsert.jsp" method="post">
					<input class="text" type="text" name="Username" placeholder="Username" required="">
					<input class="text email" type="email" name="email" placeholder="Email" required="">
					<input class="text" type="password" name="password" placeholder="Password" required="">
					<input class="text w3lpass" type="password" name="conpassword" placeholder="Confirm Password" required="">
					
					<input class="text w3lpass" type="hidden" name="photogid" value="<%=Photogid %>">
					
					<div class="wthree-text">
						<label class="anim">
							<input type="checkbox" class="checkbox" required="">
							<span>I Agree To The Terms & Conditions</span>
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit" value="SIGNUP">
				</form>
				
					<% 
				if(Photogid!=0)
				{
				%>	
								<p>Already have an Account? <a href="CustomerLogin.jsp?id=<%=Photogid %>"> Login Now!</a></p>

					
				<% }
				else
				{
				%>	
				<p>Already have an Account? <a href="CustomerLogin.jsp"> Login Now!</a></p>
				<% 	
					
				}
				%>
			</div>
		</div>
		<!-- copyright -->
		<div class="colorlibcopy-agile">
			<p>© 2018  Signup Form. All rights reserved | Design by <a href="#" target="_blank">MyPhotographer</a></p>
		</div>
		<!-- //copyright -->
		<ul class="colorlib-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<!-- //main -->

<!-- Main part -->

<%@ include file = "Footer.jsp" %>

</body>
</html>