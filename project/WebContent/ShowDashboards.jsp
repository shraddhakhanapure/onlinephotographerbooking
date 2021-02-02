<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
<%@ include file = "ExternalLinks.jsp" %>
</head>

<body>

<%@ include file = "AdminHeader.jsp" %>
<%@ include file = "AdminNavbar.jsp" %>
<!-- Main dash board here -->

<section class="container mt-3">
      <h3 class="text-center">Featured Photographers</h3>
      <p class="pt-2 pb-3 text-center">Photographers that did extra ordinary last month</p>
      <div class="team slider" data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>

        <!-- person 1 -->
        <div class="card border-0 text-center ml-3 mr-3">
          <div class="feature-text">
            <img src="assets/images/Photographers.jpg" class="card-img-top" alt="team-member">
            <span class="text-left bg-accent font-weight-bold">
              Featured
            </span>
          </div>
          <div class="card-body">
            <h5 class="card-title">Total Photographers</h5>
            
            <% 
            try {
            	Class.forName("com.mysql.jdbc.Driver");
            	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
            	PreparedStatement ps = con.prepareStatement("select count(*) from photographer.photographerdetails");
            	ResultSet rs=ps.executeQuery();
            	if(rs.next())
            	{%>
                    <p class="card-text" style="font-weight:bold;font-family:rockwell;"><%= rs.getString(1) %></p>
            		<% 
            	}
            	
            } catch (Exception e) {
            	System.out.println("Connection error..!");
            	e.printStackTrace();
            	}

            %>
            <div class="person-description mt-2">         
              <button class="btn btn-accent"><a href="ShowPhotographers.jsp"> Show All</a> </button>
            </div>
            
          </div>
        </div>


        <!-- person 1 -->
        <div class="card border-0 text-center  ml-3 mr-3">
          <div class="feature-text">
            <img src="assets/images/customers.jpg" class="card-img-top" alt="team-member">
            <span class="text-left bg-accent font-weight-bold">
              Featured
            </span>
          </div>
          <div class="card-body">
            <h5 class="card-title">Total Customers</h5>
            <p class="card-text" style="font-weight:bold;font-family:rockwell;">10</p>
            <div class="person-description mt-2">         
             <button class="btn btn-accent"><a href="ShowCustomers.jsp"> Show All</a> </button>
            </div>
          </div>
        </div>


        <!-- person 1 -->
        <div class="card border-0 text-center  ml-3 mr-3">
          <div class="feature-text">
            <img src="assets/images/rupee4.jpg" class="card-img-top" alt="team-member">
            <span class="text-left bg-accent font-weight-bold">
              Featured
            </span>
          </div>
          <div class="card-body">
            <h5 class="card-title">Total Business</h5>
            <p class="card-text" style="font-weight:bold;font-family:rockwell;">Rs.152354/-</p>
            <div class="person-description mt-2">         
              <button class="btn btn-accent"><a href="#"> Show All</a> </button>
            </div>          
            </div>
        </div>


      </div>

          </section>

<!-- Main dash board here -->

<%@ include file = "Footer.jsp" %>

</body>
</html>