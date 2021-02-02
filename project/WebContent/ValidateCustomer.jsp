<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>validate photographer</title>
</head>
<body>

	<%

String email=null;
String password=null;
email=request.getParameter("email");
password=request.getParameter("password");
// check signup table and if customer is requested to any photographer then show on photographer cart OR on booked photohraphers
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
	PreparedStatement ps = con.prepareStatement("select * from photographer.customersignup where email=? and password=?");
	ps.setString(1,email);
	ps.setString(2,password);			
	
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())  //for record present in db
 	{		//	int id=rs.getInt(1);
 				//String cid=String.valueOf(id); 
 	
				HttpSession s1 = request.getSession(true);
				s1.setAttribute("cemail", email);
				%>
				  		<script>
				  		alert("Logged in successfully..!");
   			 			location.href="ShowBookedPhotographerstocustomers.jsp?photogid="+<%= rs.getInt(6) %>  <!-- redirect to photographer profile  page, show orders page-->
   			 		</script>
				<% 	
      }
	else
	{
		%>
			<script>
			 alert("Invalid username OR password..!");
			 location.href="CustomerLogin.jsp"
			 </script>

	<%
        	
	}
	con.close();
} catch (Exception e) {
System.out.println("Connection error..!");
e.printStackTrace();
}

%>
</body>
</html>