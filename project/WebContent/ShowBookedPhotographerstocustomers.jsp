<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Photographer</title>
<%@ include file = "ExternalLinks.jsp" %>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        .bcontent {
            margin-top: 10px;
        }
        
        
    </style>


</head>

<body>

<!-- if photogid is not = null then just show the requested photographer with book now button -->

<%@ include file = "CustomerHeader.jsp" %>
<%@ include file = "CustomerNavbar.jsp" %>


<%

//no need to take id because we are feting requested photographers from db
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
			int Photogid=0;
			if(request.getParameter("photogid")!=null)
			{
				Photogid=Integer.parseInt(request.getParameter("photogid")); 
				System.out.println("Photographer Id at BookPhotographer: "+Photogid);
				if(Photogid>0)
				{
							PreparedStatement ps = con.prepareStatement("select * from photographer.photographerdetails where pid=?");
							ps.setInt(1,Photogid);
							ResultSet rs=ps.executeQuery();
					
							if(rs.next())  //for record present in db
				 			{
								
								
							%>
							<div class="container bcontent">
						        <h2>You Requested Photographer</h2>
						        <hr />
						        <center>
						        <div class="card" style="width: 800px;">
						            <div class="row no-gutters">
						                <div class="col-sm-5">
						                    <img class="card-img" src="<%=rs.getString(9) %>" alt="Suresh Dasari Card">
						                </div>
						                <div class="col-sm-7">
						                    <div class="card-body">
						                        <h5 class="card-title"><%= rs.getString(2)%> <%= rs.getString(3)%></h5>
						                        <p class="card-text">City:<%= rs.getString(7)%>  | Contact:<%= rs.getString(10)%></p>
						                        <a href="BookPhotographer.jsp?id="<%= rs.getString(23)%> class="btn btn-primary" >Book now</a>
						                        <a href="ViewAllPhotographers.jsp" class="btn btn-primary">cancel</a>
						                    </div>
						                </div>
						            </div>
						        </div>
						        </center>
						</div>
						<hr/>
						<!--  if he click on book then using js remove that requested div with its ID, redirect to BookPhotographer page with his ID,-->
						
			
						<% } //inner if rs.next()
					} //photogid>0
			 	else if(Photogid==0) 
			 			{
			 			%>
			 				<center>
			 				<span>NO photographer is requested ..!</span><hr/>
			 				</center>
			 				<% 
			 			}
	 			
			} //outer if photoid !=null
			
				
				
				//  int pid=Integer.parseInt(request.getParameter("id")); 
	              //System.out.println("pid: "+pid);
	              
	              //String cemail=request.getParameter("cemail");
	           
	              
				  if(session.getAttribute("cemail")!=null)
				  {
					  String cemail=session.getAttribute("cemail").toString();  
					  System.out.println("Customer email: "+cemail);
					  
					  PreparedStatement ps = con.prepareStatement("select * from photographer.bookedphotographers where Cemail=?");
					  ps.setString(1, cemail);
					  
					  ResultSet rs=ps.executeQuery();
					  if (rs.next()==false) 
					  {
						  %><br/>
					        <center><h1>No photographer is Booked Yet..! click on Show photographers to proceed further..!</h1></center>
					      <% 
					      }
					  else 
					  {
						  %>
						 <center> <h2>Your Booked Photographer</h2></center>
						  <% 

					        do{
					        	
					        	int photoid=rs.getInt(3);
								  PreparedStatement ps1 = con.prepareStatement("select * from photographer.photographerdetails where pid=?");
								  ps1.setInt(1, photoid);
								  ResultSet rs2=ps1.executeQuery();
								  
								  while (rs2.next())
								  {
					        	%>
								<div class="container bcontent">
						        
						        <hr style="border-color:yellow;"/>
						        <center>
						        <div class="card" style="width: 800px;">
						            <div class="row no-gutters">
						                <div class="col-sm-5">
						                    <img class="card-img" src="<%=rs2.getString(9) %>" alt="Suresh Dasari Card">
						                </div>
						                <div class="col-sm-7">
						                    <div class="card-body">
						                        <h5 class="card-title">Name: <%= rs2.getString(2)%> <%= rs2.getString(3)%></h5>
						                        
						                        <table class="table table-striped">
												  <thead>
												    <tr>
												      <th scope="col">City</th>
												      <th scope="col">Contact</th>
												      <th scope="col">Specialist</th>
												    </tr>
												  </thead>
												  
												  <tbody>
												    <tr>
												      <td><%= rs2.getString(7)%></td>
												      <td><%= rs2.getString(10)%></td>
												      <td><%= rs2.getString(24)%></td>
												    </tr>
												  </tbody>
												</table>
												
												<table class="table table-striped">
												  <thead>
												    <tr>
												      <th scope="col">Booking Date</th>
												      <th scope="col">Event Date</th>
												      <th scope="col">Booking Status</th>
												    </tr>
												  </thead>
												  
												  <tbody>
												    <tr>
												      <td><%= rs.getString(9)%></td>
												      <td><%= rs.getString(6)%></td>
												      <td><a href="#" class="btn btn-primary"><%= rs.getString(10)%></a></td>
												    </tr>
												  </tbody>
												</table>
												
												
						                        
						                    </div>
						                </div>
						            </div>
						        </div>
						        </center>
						</div>
					<% 	
					        }//while inner 
					  }while(rs.next());
					  }//else
				  }//check session
				  else
				  {
				  %>	<script>
				  		alert("Login first..!");
   			 			location.href="CustomerLogin.jsp";  
   			 		</script>
	 					<% 
				  }
			



				//need to show all the booked photographers from DB with status confirmed OR not, get the staus from photographer table to check the request is confirmed
				// do the Db connection and fetch all the booked photographers, if wont found any then ask to viit viewallphotographers page
		
con.close();
}  //try 
catch (Exception e) {
System.out.println("Connection error..!");
e.printStackTrace();
}

%>




<!-- 
if he directly goes from signup==> signin then we show the first requested photographer, ask do you want to book ( OR option to remove from screen/DB using JS) with book button which will redirect to the same page with form 
and if he click on book then using js remove that requested div with its ID, redirect to BookPhotographer page with his ID and show the appropriate form, get ID and show its basic details.

Show booked Dates of that requested photographers.

DB fields while booking photographer:

order_id -Pk
CID-fk1
C-Name
address
Booking Date
Event Date
Advance pay          :to confirm (before get payment make confirm that this photographer is not booked over that date, if already booked on same date, ask customer to contact personally and save the form in waiting under that photographer with zero advance)
PhotogId-Fk


Show booked Photographers on Bookedphotographers.jsp page

 -->
        
<%@ include file = "Footer.jsp" %>

</body>
</html>