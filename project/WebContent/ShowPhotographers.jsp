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



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>


</head>

<body>

<%@ include file = "AdminHeader.jsp" %>
<%@ include file = "AdminNavbar.jsp" %>
<!-- main content -->
<br><br>


<center>
<div class="container">
    <section class="container d-flex justify-content-center align-items-center mt-4">
      <form class="row text-center">
        <div class="col-md-auto">
          <div class="form-group mb-2">
            <input type="text" class="form-control" placeholder="Enter Keywords to search" id="myInput">
          </div>
<!--          <div class="text-center">
            <button type="submit" class="btn btn-accent ml-2 mb-2 pl-5 pr-5">Search</button>

          </div>
  -->        
</div>
      </form>
    </section>
</div>


</center>
<br>
<% 
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
	String sql="SELECT * FROM photographer.photographerdetails";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();

	%>
	<table class="table table-bordered">
	  <thead>
	    <tr>
	      
	      <th scope="col">Id</th>
	      <th scope="col">Profile Pic</th>
	      <th scope="col">Name</th>
	      <th scope="col">Email</th>
	      <th scope="col">Age/Height</th>
	      <th scope="col">Address</th>
	      <th scope="col">Contact</th>
	      <th scope="col">Shop Address</th>
	      <th scope="col">Services</th>
	      <th scope="col">Camera Type</th>
	      <th scope="col">Charges <br>/hour</th>
	      <th scope="col">Current <br>Status</th>
	      
	    </tr>
	  </thead>
	  
	  <tbody id="myTable">
	  <% 
	  while(rs.next()) 
	  {
			//id, Fname, Lname, Email, Age, Height, city, Address, profilePic, ContactNo, ShopAddress, Services, CameraType, perhr, perimg, img1, img2, img3, img4, status
			int id=rs.getInt(1);
			String status=rs.getString(20);
		  %>
		    <tr>
		      <th scope="row"><%= rs.getInt(1) %></th>
		      <td><img src="<%= rs.getString(9) %>" class="img-thumbnail" alt="Cinque Terre" style="height:100px;width:100px;"></td>
		      <td><%= rs.getString(2)%> <%= rs.getString(3)%></td>
		      <td><%= rs.getString(4)%></td>
		      <td style="width:50px;"><%= rs.getString(5)%> <%= "/" %> <%= rs.getString(6)%></td>
		      <td><%= rs.getString(8)%></td>
		      <td style="width:50px;"><%= rs.getString(10)%></td>
		      <td><%= rs.getString(11)%></td>
		      <td style="width:50px;"><%= rs.getString(12)%></td>
		      <td style="width:50px;"><%= rs.getString(13)%></td>
		      <td style="width:50px;"><%= "Rs." %><%= rs.getString(14)%><%= "/-" %></td>
		      
		      <% if(status.equals("Inactive")) 
		      {
		      %>
		                <td style="width:50px;"><a  href="ChangeStatus.jsp?id=<%= rs.getInt(1) %>"> <button type="button" class="btn btn-danger"><%= rs.getString(20)%></button></a> 
		                <br><br><a href="PhotographerProfile.jsp?id=<%= rs.getInt(1) %>"><button type="button" class="btn btn-warning">Details</button></a></td>
             <% 
             }
		      else if(status.equals("Active"))
		      {
		    	  %>
	                <td style="width:50px;"><a href="ChangeStatus.jsp?id=<%= rs.getInt(1) %>" style="background-color:Green;"> <button type="button" class="btn btn-success"><%= rs.getString(20)%></button></a>
	                <br><br><a href="PhotographerProfile.jsp?id=<%= rs.getInt(1) %>"><button type="button" class="btn btn-warning">Details</button></a></td>
       			<%  
		      }
            %>
		     
		    </tr>
		  <% 
	  }
	  %>
		  </tbody>
	</table>
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