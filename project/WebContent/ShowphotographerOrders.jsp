<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.sql.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All photographers</title>
<%@ include file = "ExternalLinks.jsp" %>
</head>

<body>

	<%@ include file="PhotographerHeader.jsp"%>
	<!-- create photographer header  show photographer name-->
	<%@ include file="PhotographerNav.jsp"%>
	<!-- create photographer Navbar, Logout -->
<!-- main content -->
<center><h3>All Placed orders</h3></center>

<% 
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
	String pemail=session.getAttribute("Pemail").toString();
	
	String sql="SELECT pid FROM photographer.photographerdetails where Email=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,pemail);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		int pid=rs.getInt(1);
		String sql1="SELECT * FROM photographer.bookedphotographers where photogid=?";
		PreparedStatement ps1 = con.prepareStatement(sql1);
		ps1.setInt(1,pid);
		ResultSet rs1=ps1.executeQuery();
		if (rs1.next() == false) {
	        %>
	        <h1>No booking Found yet.!</h1>
	      <% } 
		else {
		int count=0;
		%>
			<table class="table table-bordered">
			  <thead>
			    <tr>
			      
			      <th scope="col">Id</th>
			      <th scope="col">Order ID</th>
			      <th scope="col">Email</th>
			      <th scope="col">Event Name</th>
			      <th scope="col">Event Date</th>
			      <th scope="col">Event place</th>
			      <th scope="col">Booking Date</th>
			      <th scope="col">Booking Hours</th>
			      <th scope="col">Alternate Contact</th>
			      <th scope="col">Status </th>
			      
			    </tr>
			  </thead>
			  <tbody>
<% 
	        do {
	    		//id, Fname, Lname, Email, Age, Height, city, Address, profilePic, ContactNo, ShopAddress, Services, CameraType, perhr, perimg, img1, img2, img3, img4, status
				count=count+1;
	    		String status=rs1.getString(10);
			  %>
			    <tr>
			      <th scope="row"><%= count %></th>
			      <td><%= rs1.getInt(1)%></td>
			      <td><%= rs1.getString(2)%></td>
			      <td style="width:50px;"><%= rs1.getString(4)%></td>
			      <td><%= rs1.getString(6)%></td>
			      <td style="width:50px;"><%= rs1.getString(5)%></td>
			      <td><%= rs1.getString(9)%></td>
			      <td style="width:50px;"><%= rs1.getString(7)%></td>
			      <td style="width:50px;"><%= rs1.getString(8)%></td>
			      
					      <% if(status.equals("Pending")) 
					      {
					      %>
					                <td style="width:50px;"><a  href="ChangecustomerRequestStatus.jsp?orderid=<%= rs1.getInt(1) %>"> <button type="button" class="btn btn-danger"><%= rs1.getString(10)%></button></a> 
					     <% 
			             }
					      else if(status.equals("Confirmed"))
					      {
					    	  %>
				                <td style="width:50px;"><a href="ChangecustomerRequestStatus.jsp?orderid=<%= rs1.getInt(1) %>" style="background-color:Green;"> <button type="button" class="btn btn-success"><%= rs1.getString(10)%></button></a>
				   			<%  
					      }
	            			%>
			     
			    </tr>
			  </tbody>
		   <%      } while (rs1.next());
	     
			%>
			</table>
		<% 
		} //outer else
		
	}//if rs.next()
	%>
	  
	<% 

	con.close();
} catch (Exception e) {
System.out.println("Connection error..!");
e.printStackTrace();
}
%>

<!-- Main content -->
<%@ include file = "Footer.jsp" %>

</body>
</html>