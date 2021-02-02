<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validate admin</title>
</head>
<body>

<%

String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
if(email.equals("admin@gmail.com") && pwd.equals("123"))
{
	HttpSession s = request.getSession(true);
	s.setAttribute("email", email);
%>	

	<script>
	alert("Logged in successfully..!");
	 location.href="ShowDashboards.jsp";
	</script>
<% 

}
else{
	%>	

	<script>
	alert("Invalid Username OR Password..!");
	 location.href="AdminLogin.jsp";
	</script>
<% 
	
}
%>

</body>
</html>