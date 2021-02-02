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
String pwd=null;
email=request.getParameter("email");
pwd=request.getParameter("pwd");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
	PreparedStatement ps = con.prepareStatement("select * from photographer.photographerssignup where Email=? and password=?");
	ps.setString(1,email);
	ps.setString(2,pwd);			
	
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())  //for record present in db
 	{
		//	if(rs.getString(4)!=null)  //for email in db
			//{
				HttpSession s1 = request.getSession(true);
				s1.setAttribute("Pemail", email);

				%>

				<script>
			 		alert("Logged in successfully..!"); 
			    </script>

				<%
			//check if already completed the profile
      		String sql1="select Email from photographer.photographerdetails where Email=?";
      		PreparedStatement ps1=con.prepareStatement(sql1);
      		ps1.setString(1, email);
      		ResultSet rs1=ps1.executeQuery();
      			if(rs1.next()) //if email is present in photographer details
      			{
      				%>
		    		<script>
   			 			location.href="MyProfile.jsp?id="+<%= rs.getInt(1) %>  <!-- redirect to photographer profile  page, show orders page-->
   			 		</script>
					<% 	
      			}
      			else
  				{
  				%>
			  	<script>
  			 		location.href="Completeprofile.jsp?id="+<%= rs.getInt(1) %>
  			 	</script>
				<%
  				}
		}
	else
	{
		%>
			<script>
			 alert("Invalid username OR password..!");
			 location.href="Login.jsp"
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