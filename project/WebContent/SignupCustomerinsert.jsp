<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Signup</title>
</head>
<body>

	<%
//cid, username, email, password, conspass

String Unm=null;
String email=null;
String pwd=null;
String conpass=null;
int photogid=0;

Unm=request.getParameter("Username");
email=request.getParameter("email");
pwd=request.getParameter("password");
conpass=request.getParameter("conpassword");
photogid=Integer.parseInt(request.getParameter("photogid"));



try {
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
	PreparedStatement ps1 = con.prepareStatement("SELECT * FROM photographer.customersignup where email=?");
	ps1.setString(1, email);
	
	System.out.println("Entered Email is:"+email);
	
	ResultSet rs1=ps1.executeQuery();

	if(rs1.next())
	{
		System.out.println("userName:"+rs1.getString(3));
		%>
		
		<script>
	 		alert("Email is already registerd, try another one..!");
	 		location.href="CustomerSignup.jsp";  <!-- redirect to photographer profile  page, show orders page-->	   		
	    </script>
	 		<% 	


	}
	else
	{
	PreparedStatement ps = con.prepareStatement("insert into photographer.customersignup(username, email, password, conspass,Photogid)values(?,?,?,?,?)");
	ps.setString(1,Unm);
	ps.setString(2,email);			
	ps.setString(3,pwd);
	ps.setString(4,conpass);
	ps.setInt(5,photogid);
	
	int count=ps.executeUpdate();	
	
				if(pwd.equals(conpass))
				{
					if(count>0)  //for record present in db
			 		{
							%>
			
							<script>
						 		alert("You are Registered successfully..!");
						 		location.href="CustomerLogin.jsp?id="+<%= photogid %>  <!-- redirect to photographer profile  page, show orders page-->	   		
						    </script>
						 		<% 	
			      	}
			      	else
			  		{
			  		%>
						  <script>
						  alert("Check database connection..!");
			  			 	location.href="CustomerSignup.jsp?id="+<%= photogid %>
			  			 </script>
							<%
			  		} //inner else
				}// pass and conpass equality if
			else
			{
				%>
					<script>
					 alert("Password and confirm password doesn't matches..!");
					 location.href="CustomerSignup.jsp";
					 </script>
		
			<%
		        	
			}
	con.close();
	}//outer else
} //try
catch (Exception e) {
System.out.println("Connection error..!");
e.printStackTrace();
}

%>

</body>
</html>