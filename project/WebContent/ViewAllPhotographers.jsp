<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Photographers</title>
<%@ include file = "ExternalLinks.jsp" %>
</head>

<body>

<!-- to use the same index page for different pages based on reuirement then use the session and check if the session is set by customer is not null then 
change the code of navar and show only customer related links-->

  <!-- header start-->
  <!-- header start-->
  <header class="header ">
    <div class="container">
      <div class="row ">
        <div class="col-md-6 header-info">
          <a href="mailto:info@Photographers.com" class="mr-3">info@Photographers.com</a>
          <span>Call at: +91 8862000838 </span>
        </div>
     <div class="header-buttons col-md-6 d-flex justify-content-end">
        
        <%
 String subname=null;
 if(session.getAttribute("cemail")!=null)
 {
 try{
 String name = (String) session.getAttribute("cemail");
 int x = name.indexOf("@");
 if (x != -1) 
 {
     subname= name.substring(0 , x); //this will give abc
 %>
 
          <a class="btn btn-accent mr-3" href="#"><%= subname%></a> <a class="nav-link" href="Logout.jsp"> <button class="btn btn-info">Logout </button><br> </a>
 
 <% 
 }
 else
 {
%>
            <a class="btn btn-accent mr-3" href="Login.jsp">Signin</a>
          <a class="btn btn-accent " href="Register.jsp">SignUp</a>
      
 
<% 	 
 }
 }
 catch (Exception e)
 {
	 e.printStackTrace();
 }
 }
 %>
        </div>
        
          </div>
    </div>
  </header>
<!-- header end here --><!-- header end here -->
 
 
 

 <%if(session.getAttribute("cemail")==null) 
 {%>
 
<!-- Navbar start -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">
        <img src="./assets/images/cam.jpg" alt="" width="140" height="50" alt="" loading="lazy">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="AboutUs.jsp">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="AdminLogin.jsp">Admin</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="CustomerLogin.jsp">Customer</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/contactus.html">Contact</a>
          </li>

        </ul>
      </div>
    </div>
  </nav>
<!-- Navbar ends here -->
 
 <% }
 else
 {
	 %>
	 
	 <!-- Navbar start -->
	   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	     <div class="container">
	       <a class="navbar-brand" href="index.jsp">
	         <img src="./assets/images/cam.jpg" alt="" width="140" height="50" alt="" loading="lazy">
	       </a>
	       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
	         aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	         <span class="navbar-toggler-icon"></span>
	       </button>
	       <div class="collapse navbar-collapse" id="navbarNav">
	         <ul class="navbar-nav ml-auto">
	      
	      <li class="nav-item active">
            <a class="nav-link" href="ViewAllPhotographers.jsp">Show Photographers</a>
          </li>
   
	      <li class="nav-item active">
            <a class="nav-link" href="ShowBookedPhotographerstocustomers.jsp">Booking status</a> 
            <!-- provide the link to each photographer to check status like confirmed OR still is in pending -->
          </li>

	         </ul>
	       </div>
	     </div>
	   </nav>
	 <!-- Navbar ends here -->
	  
	  <% 
 }
 %>


<!-- Main content -->
  <main class="home">
    <div class="top" data-slick='{"slidesToShow": 1, "slidesToScroll": 1}'>
      <div class="top-banner">
        <img src="./assets/images/cam3.jpg" alt="" class="img-fluid w-100">
      </div>
      <div class="top-banner">
        <img src="./assets/images/two.jpg" alt="" class="img-fluid w-100">
      </div>
      <div class="top-banner">
        <img src="./assets/images/cam4.jpg" alt="" class="img-fluid w-100">
        
      </div>


    </div>


    <section class="container d-flex justify-content-center align-items-center mt-4">
      <form class="row text-center">
        <div class="col-md-auto">
          <div class="form-group mb-2">
            <input type="password" class="form-control" placeholder="Enter Keywords">
          </div>
          <div class="text-center">
            <button type="submit" class="btn btn-accent ml-2 mb-2 pl-5 pr-5">Search</button>

          </div>
        </div>
      </form>
    </section>

    
      <% 
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
   %>   
   
   <!---------------------------------------------- start wedding specialist ------------------------------------------------------------------->
    <h3 class="text-center">Featured Photographers</h3>
    <section class="container mt-3">
      <p class="pt-2 pb-3 text-center">Wedding Specialist</p>
      
 <% 
 	PreparedStatement ps = con.prepareStatement("select * from photographer.photographerdetails where speciality=? and status=?");
	ps.setString(1,"Wedding");
	ps.setString(2,"Active");
	ResultSet rs=ps.executeQuery();
	if (rs.next() == false) 
	{
		%>
		<h3> Records Not found..!</h3>
	<% }
	else{
		%>
		      <!-- start slider -->
      <div class="team slider" data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>		
		<%		
		do
		{
			%>

	        <!-- person 1 -->
	        <div class="card border-0 text-center ml-3 mr-3">
	          <div class="feature-text">
	            <img src="<%= rs.getString(9) %>" class="card-img-top" alt="team-member">
	            <span class="text-left bg-accent font-weight-bold">
	              Featured
	            </span>
	          </div>
	          <div class="card-body">
	            <h5 class="card-title"><%= rs.getString(2) %> <%= rs.getString(3) %></h5>
	            <p class="card-text"><%= rs.getString(24) %> Specialist</p>
	            <div class="person-description mt-2">
	              <button class="btn btn-accent"> City: <%= rs.getString(7) %></button>
	              <button class="btn btn-accent"> Contact: <%= rs.getString(10) %></button>
	              <button class="btn btn-accent"> Camera: <%= rs.getString(13) %></button>  
	              
	            </div>
	                         
	              <div class="person-description mt-2">
	           <input type="button" class="btn btn-info" value="Know More" onclick=" relocate_home1()" align="right">

				<script>
				function relocate_home1()
				{
					//const encoded = encodeURI(uri);
					//console.log(decodeURI(encoded));
					location.href="PhotographerDetailsToCustomer.jsp?id="+<%= rs.getInt(23) %>
				} 
				</script>
	           </div> 
	           
	          </div>
	          
	        </div>

			<% 
		}while(rs.next());
	}
%>
</div> 
<!-- end slider -->

      <div class="controls d-flex justify-content-center mt-2 mb-2">
        <div class="d-flex">
          <i class="fa fa-angle-left youtuber-left"></i>
          <i class="fa fa-angle-right youtuber-right"></i>
        </div>
      </div>
</section>
<hr style="background-color:white;">
<!------------------------------------------------------ end wedding specialist  ------------------------------------------------------------------>




<!------------------------------------------------------ Start Photoshoot specialist  ------------------------------------------------------------------>
    <section class="container mt-3">
      <p class="pt-2 pb-3 text-center">Photoshoot Specialist</p>
      
 <% 
 	PreparedStatement ps1 = con.prepareStatement("select * from photographer.photographerdetails where speciality=? and status=?");
	ps1.setString(1,"Photoshoot");
	ps1.setString(2,"Active");
	ResultSet rs1=ps1.executeQuery();
	if (rs1.next() == false) 
	{
		%>
		<h3> Records Not found..!</h3>
	
	<% }
	else{
		%>
		      <!-- start slider -->
      <div class="team slider" data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>		
		<%		
		do
		{
			%>

	        <!-- person 1 -->
	        <div class="card border-0 text-center ml-3 mr-3">
	          <div class="feature-text">
	            <img src="<%= rs1.getString(9) %>" class="card-img-top" alt="team-member">
	            <span class="text-left bg-accent font-weight-bold">
	              Featured
	            </span>
	          </div>
	          <div class="card-body">
	            <h5 class="card-title"><%= rs1.getString(2) %> <%= rs1.getString(3) %></h5>
	            <p class="card-text"><%= rs1.getString(24) %> Specialist</p>
	            <div class="person-description mt-2">
	              <button class="btn btn-accent"> City: <%= rs1.getString(7) %></button>
	              <button class="btn btn-accent"> Contact: <%= rs1.getString(10) %></button>
	              <button class="btn btn-accent"> Camera: <%= rs1.getString(13) %></button>  
	              
	            </div>
	                         
	              <div class="person-description mt-2">
	           <input type="button" class="btn btn-info" value="Know More" onclick=" relocate_home2()" align="right">

				<script>
				function relocate_home2()
				{
					location.href="PhotographerDetailsToCustomer.jsp?id="+<%= rs1.getInt(23) %>
				} 
				</script>
	           </div> 
	           
	          </div>
	          
	        </div>

			<% 
		}while(rs1.next());
	}
%>
</div> 
<!-- end slider -->

      <div class="controls d-flex justify-content-center mt-2 mb-2">
        <div class="d-flex">
          <i class="fa fa-angle-left youtuber-left"></i>
          <i class="fa fa-angle-right youtuber-right"></i>
        </div>
      </div>
</section>
<hr style="background-color:white;">

<!------------------------------------------------------ end Photoshoot specialist  ------------------------------------------------------------------>



<!------------------------------------------------------ Start wild-life specialist  ------------------------------------------------------------------>
    <section class="container mt-3">
      <p class="pt-2 pb-3 text-center">Wild life Specialist</p>
      
 <% 
 	PreparedStatement ps2 = con.prepareStatement("select * from photographer.photographerdetails where speciality=? and status=?");
	ps2.setString(1,"Wild life");
	ps2.setString(2,"Active");
	ResultSet rs2=ps2.executeQuery();
	if (rs2.next() == false) 
	{
		%>
		<h3> Records Not found..!</h3>
	
	<% }
	else{
		%>
		      <!-- start slider -->
      <div class="team slider" data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>		
		<%		
		do
		{
			%>

	        <!-- person 1 -->
	        <div class="card border-0 text-center ml-3 mr-3">
	          <div class="feature-text">
	            <img src="<%= rs2.getString(9) %>" class="card-img-top" alt="team-member">
	            <span class="text-left bg-accent font-weight-bold">
	              Featured
	            </span>
	          </div>
	          <div class="card-body">
	            <h5 class="card-title"><%= rs2.getString(2) %> <%= rs2.getString(3) %></h5>
	            <p class="card-text"><%= rs2.getString(24) %> Specialist</p>
	            <div class="person-description mt-2">
	              <button class="btn btn-accent"> City: <%= rs2.getString(7) %></button>
	              <button class="btn btn-accent"> Contact: <%= rs2.getString(10) %></button>
	              <button class="btn btn-accent"> Camera: <%= rs2.getString(13) %></button>  
	              
	            </div>
	                         
	              <div class="person-description mt-2">
	           <input type="button" class="btn btn-info" value="Know More" onclick=" relocate_home3()" align="right">

				<script>
				function relocate_home3()
				{
					location.href="PhotographerDetailsToCustomer.jsp?id="+<%= rs2.getInt(23)%>
				} 
				</script>
	           </div> 
	           
	          </div>
	          
	        </div>

			<% 
		}while(rs2.next());
	}
%>
</div> 
<!-- end slider -->

      <div class="controls d-flex justify-content-center mt-2 mb-2">
        <div class="d-flex">
          <i class="fa fa-angle-left youtuber-left"></i>
          <i class="fa fa-angle-right youtuber-right"></i>
        </div>
      </div>
</section>
<hr style="background-color:white;">

<!------------------------------------------------------ end wild-life specialist  ------------------------------------------------------------------>


<!------------------------------------------------------ Start Commercial specialist  ------------------------------------------------------------------>
    <section class="container mt-3">
      <p class="pt-2 pb-3 text-center">Commercial and industrial Photoshoot Specialist</p>
      
 <% 
 	PreparedStatement ps3 = con.prepareStatement("select * from photographer.photographerdetails where speciality=? and status=?");
	ps3.setString(1,"Commercial");
	ps3.setString(2,"Active");
	ResultSet rs3=ps3.executeQuery();
	if (rs3.next() == false) 
	{
		%>
		<h3> Records Not found..!</h3>
	
	<% }
	else{
		%>
		      <!-- start slider -->
      <div class="team slider" data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>		
		<%		
		do
		{
			%>

	        <!-- person 1 -->
	        <div class="card border-0 text-center ml-3 mr-3">
	          <div class="feature-text">
	            <img src="<%= rs3.getString(9) %>" class="card-img-top" alt="team-member">
	            <span class="text-left bg-accent font-weight-bold">
	              Featured
	            </span>
	          </div>
	          <div class="card-body">
	            <h5 class="card-title"><%= rs3.getString(2) %> <%= rs3.getString(3) %></h5>
	            <p class="card-text"><%= rs3.getString(24) %> Specialist</p>
	            <div class="person-description mt-2">
	              <button class="btn btn-accent"> City: <%= rs3.getString(7) %></button>
	              <button class="btn btn-accent"> Contact: <%= rs3.getString(10) %></button>
	              <button class="btn btn-accent"> Camera: <%= rs3.getString(13) %></button>  
	              
	            </div>
	                         
	              <div class="person-description mt-2">
	           <input type="button" class="btn btn-info" value="Know More" onclick=" relocate_home()4" align="right">

				<script>
				function relocate_home4()
				{
					location.href="PhotographerDetailsToCustomer.jsp?id="+<%= rs3.getInt(23) %>
				} 
				</script>
	           </div> 
	           
	          </div>
	          
	        </div>

			<% 
		}while(rs3.next());
	}
%>
</div> 
<!-- end slider -->

      <div class="controls d-flex justify-content-center mt-2 mb-2">
        <div class="d-flex">
          <i class="fa fa-angle-left youtuber-left"></i>
          <i class="fa fa-angle-right youtuber-right"></i>
        </div>
      </div>
</section>
<hr style="background-color:white;">

<!------------------------------------------------------ end Commercial specialist  ------------------------------------------------------------------>


<!------------------------------------------------------ Start Events specialist ------------------------------------------------------------------>
    <section class="container mt-3">
      <p class="pt-2 pb-3 text-center">Special Event Specialist</p>
      
 <% 
 	PreparedStatement ps4 = con.prepareStatement("select * from photographer.photographerdetails where speciality=? and status=?");
	ps4.setString(1,"Events");
	ps4.setString(2,"Active");
	ResultSet rs4=ps4.executeQuery();
	if (rs4.next() == false) 
	{
		%>
		<h3> Records Not found..!</h3>
	
	<% }
	else{
		%>
		      <!-- start slider -->
      <div class="team slider" data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>		
		<%		
		do
		{
			%>

	        <!-- person 1 -->
	        <div class="card border-0 text-center ml-3 mr-3">
	          <div class="feature-text">
	            <img src="<%= rs4.getString(9) %>" class="card-img-top" alt="team-member">
	            <span class="text-left bg-accent font-weight-bold">
	              Featured
	            </span>
	          </div>
	          <div class="card-body">
	            <h5 class="card-title"><%= rs4.getString(2) %> <%= rs4.getString(3) %></h5>
	            <p class="card-text"><%= rs4.getString(24) %> Specialist</p>
	            <div class="person-description mt-2">
	              <button class="btn btn-accent"> City: <%= rs4.getString(7) %></button>
	              <button class="btn btn-accent"> Contact: <%= rs4.getString(10) %></button>
	              <button class="btn btn-accent"> Camera: <%= rs4.getString(13) %></button>  
	              
	            </div>
	                         
	              <div class="person-description mt-2">
	           <input type="button" class="btn btn-info" value="Know More" onclick=" relocate_home5()" align="right">

				<script>
				function relocate_home5()
				{
					location.href="PhotographerDetailsToCustomer.jsp?id="+<%= rs4.getInt(23) %>
				} 
				</script>
	           </div> 
	           
	          </div>
	          
	        </div>

			<% 
		}while(rs4.next());
	}
%>
</div> 
<!-- end slider -->

      <div class="controls d-flex justify-content-center mt-2 mb-2">
        <div class="d-flex">
          <i class="fa fa-angle-left youtuber-left"></i>
          <i class="fa fa-angle-right youtuber-right"></i>
        </div>
      </div>
</section>
<hr style="background-color:white;">

<!------------------------------------------------------ end Events specialist  ------------------------------------------------------------------>


<!------------------------------------------------------ Start Drone specialist  ------------------------------------------------------------------>
    <section class="container mt-3">
      <p class="pt-2 pb-3 text-center">Drone Shooting Specialist</p>
      
 <% 
 	PreparedStatement ps5 = con.prepareStatement("select * from photographer.photographerdetails where speciality=? and status=?");
	ps5.setString(1,"Drone");
	ps5.setString(2,"Active");
	ResultSet rs5=ps5.executeQuery();
	if (rs5.next() == false) 
	{
		%>
		<h3> Records Not found..!</h3>
	
	<% }
	else{
		%>
		      <!-- start slider -->
      <div class="team slider" data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>		
		<%		
		do
		{
			%>

	        <!-- person 1 -->
	        <div class="card border-0 text-center ml-3 mr-3">
	          <div class="feature-text">
	            <img src="<%= rs5.getString(9) %>" class="card-img-top" alt="team-member">
	            <span class="text-left bg-accent font-weight-bold">
	              Featured
	            </span>
	          </div>
	          <div class="card-body">
	            <h5 class="card-title"><%= rs5.getString(2) %> <%= rs5.getString(3) %></h5>
	            <p class="card-text"><%= rs5.getString(24) %> Specialist</p>
	            <div class="person-description mt-2">
	              <button class="btn btn-accent"> City: <%= rs5.getString(7) %></button>
	              <button class="btn btn-accent"> Contact: <%= rs5.getString(10) %></button>
	              <button class="btn btn-accent"> Camera: <%= rs5.getString(13) %></button>  
	              
	            </div>
	                         
	              <div class="person-description mt-2">
	           <input type="button" class="btn btn-info" value="Know More" onclick=" relocate_home6()" align="right">

				<script>
				function relocate_home6()
				{
					location.href="PhotographerDetailsToCustomer.jsp?id="+<%= rs5.getInt(23) %>
				} 
				</script>
	           </div> 
	           
	          </div>
	          
	        </div>

			<% 
		}while(rs5.next());
	}
%>
</div> 
<!-- end slider -->

      <div class="controls d-flex justify-content-center mt-2 mb-2">
        <div class="d-flex">
          <i class="fa fa-angle-left youtuber-left"></i>
          <i class="fa fa-angle-right youtuber-right"></i>
        </div>
      </div>
</section>
<hr style="background-color:white;">

<!------------------------------------------------------ end Drone specialist  ------------------------------------------------------------------>

<% 
 
con.close();
} 
catch (Exception e) 
{
System.out.println("Connection error..!");
e.printStackTrace();
}

%>



   <!--  <section class="container mt-5 mb-5">
      <h3 class="text-center">Latest On Board YTubers</h3>
      <p class="pt-2 pb-3 text-center">YTubers who recently got onboard with us</p>

      <div class="tubers grid">
        <!-- person 1 -->
        <!--  <div class="card border-0 text-center">
          <div>
            <img src="assets/images/Photographers.jpg" class="card-img-top" alt="team-member">

          </div>
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> City </button>
              <button class="btn btn-accent"> Age </button>
              <button class="btn btn-accent"> Height </button>
            </div>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> Solo </button>
              <button class="btn btn-accent"> Canon </button>
              <button class="btn btn-accent"> Subs </button>
            </div>
          </div>
        </div>
        <!-- person 1 -->
        <!--  <div class="card border-0 text-center">
          <div>
            <img src="assets/images/Photographers.jpg" class="card-img-top" alt="team-member">

          </div>
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> City </button>
              <button class="btn btn-accent"> Age </button>
              <button class="btn btn-accent"> Height </button>
            </div>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> Solo </button>
              <button class="btn btn-accent"> Canon </button>
              <button class="btn btn-accent"> Subs </button>
            </div>
          </div>
        </div>

        <!-- person 1 -->
        <!--  <div class="card border-0 text-center">
          <div>
            <img src="assets/images/Photographers.jpg" class="card-img-top" alt="team-member">

          </div>
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> City </button>
              <button class="btn btn-accent"> Age </button>
              <button class="btn btn-accent"> Height </button>
            </div>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> Solo </button>
              <button class="btn btn-accent"> Canon </button>
              <button class="btn btn-accent"> Subs </button>
            </div>
          </div>
        </div>
      
        <!-- person 1 -->
        <!--  <div class="card border-0 text-center">
          <div>
            <img src="assets/images/Photographers.jpg" class="card-img-top" alt="team-member">

          </div>
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> City </button>
              <button class="btn btn-accent"> Age </button>
              <button class="btn btn-accent"> Height </button>
            </div>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> Solo </button>
              <button class="btn btn-accent"> Canon </button>
              <button class="btn btn-accent"> Subs </button>
            </div>
          </div>
        </div>
        <!-- person 1 -->
        <!--  <div class="card border-0 text-center">
          <div>
            <img src="assets/images/Photographers.jpg" class="card-img-top" alt="team-member">

          </div>
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> City </button>
              <button class="btn btn-accent"> Age </button>
              <button class="btn btn-accent"> Height </button>
            </div>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> Solo </button>
              <button class="btn btn-accent"> Canon </button>
              <button class="btn btn-accent"> Subs </button>
            </div>
          </div>
        </div>
        <!-- person 1 -->
       <!--   <div class="card border-0 text-center">
          <div>
            <img src="https://placeimg.com/640/480/people" class="card-img-top" alt="team-member">

          </div>
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> City </button>
              <button class="btn btn-accent"> Age </button>
              <button class="btn btn-accent"> Height </button>
            </div>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> Solo </button>
              <button class="btn btn-accent"> Canon </button>
              <button class="btn btn-accent"> Subs </button>
            </div>
          </div>
        </div>
        <!-- person 1 -->
<!--          <div class="card border-0 text-center">
          <div>
            <img src="https://placeimg.com/640/480/people" class="card-img-top" alt="team-member">

          </div>
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> City </button>
              <button class="btn btn-accent"> Age </button>
              <button class="btn btn-accent"> Height </button>
            </div>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> Solo </button>
              <button class="btn btn-accent"> Canon </button>
              <button class="btn btn-accent"> Subs </button>
            </div>
          </div>
        </div>
        <!-- person 1 -->
<!--         <div class="card border-0 text-center">
          <div>
            <img src="https://placeimg.com/640/480/people" class="card-img-top" alt="team-member">

          </div>
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> City </button>
              <button class="btn btn-accent"> Age </button>
              <button class="btn btn-accent"> Height </button>
            </div>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> Solo </button>
              <button class="btn btn-accent"> Canon </button>
              <button class="btn btn-accent"> Subs </button>
            </div>
          </div>
        </div>
        <!-- person 1 -->
<!--          <div class="card border-0 text-center">
          <div>
            <img src="https://placeimg.com/640/480/people" class="card-img-top" alt="team-member">

          </div>
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> City </button>
              <button class="btn btn-accent"> Age </button>
              <button class="btn btn-accent"> Height </button>
            </div>
            <div class="person-description mt-2">
              <button class="btn btn-accent"> Solo </button>
              <button class="btn btn-accent"> Canon </button>
              <button class="btn btn-accent"> Subs </button>
            </div>
          </div>
        </div>

      </div>

    </section>

-->


<!--  
    <section class="container mt-3">
      <h3 class="text-center">Our Amazing Team</h3>
      <p class="pt-2 pb-3 text-center">Meet the team</p>
      <div class="team slider" data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>

        <!-- team 1 -->
      <!--   <div class="card border-0 text-center  ml-3 mr-3">
          <img src="https://placeimg.com/640/480/people" class="card-img-top" alt="team-member">
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <a href="#" class="btn btn-accent btn-block">Go somewhere</a>
            <div class="text-center mt-2">
              <button class="btn btn-accent"> <i class="fab fa-facebook-f fa-lg	"></i> </button>
              <button class="btn btn-accent"> <i class="fab fa-linkedin-in fa-lg	"></i> </button>
            </div>
          </div>
        </div>


        <!-- team 1 -->
        <!--  <div class="card border-0 text-center  ml-3 mr-3">
          <img src="https://placeimg.com/640/480/people" class="card-img-top" alt="team-member">
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <a href="#" class="btn btn-accent btn-block">Go somewhere</a>
            <div class="text-center mt-2">
              <button class="btn btn-accent"> <i class="fab fa-facebook-f fa-lg	"></i> </button>
              <button class="btn btn-accent"> <i class="fab fa-linkedin-in fa-lg	"></i> </button>
            </div>
          </div>
        </div>


        <!-- team 1 -->
       <!--   <div class="card border-0 text-center  ml-3 mr-3">
          <img src="https://placeimg.com/640/480/people" class="card-img-top" alt="team-member">
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <a href="#" class="btn btn-accent btn-block">Go somewhere</a>
            <div class="text-center mt-2">
              <button class="btn btn-accent"> <i class="fab fa-facebook-f fa-lg	"></i> </button>
              <button class="btn btn-accent"> <i class="fab fa-linkedin-in fa-lg	"></i> </button>
            </div>
          </div>
        </div>


        <!-- team 1 -->
        <!--  <div class="card border-0 text-center ml-3 mr-3">
          <img src="https://placeimg.com/640/480/people" class="card-img-top" alt="team-member">
          <div class="card-body">
            <h5 class="card-title">Team Member One</h5>
            <p class="card-text">Gaming</p>
            <a href="#" class="btn btn-accent btn-block">Go somewhere</a>
            <div class="text-center mt-2">
              <button class="btn btn-accent"> <i class="fab fa-facebook-f fa-lg	"></i> </button>
              <button class="btn btn-accent"> <i class="fab fa-linkedin-in fa-lg	"></i> </button>
            </div>
          </div>
        </div>


      </div>

      <div class="controls d-flex justify-content-center mt-2 mb-2">
        <div class="d-flex">
          <i class="fa fa-angle-left team-left"></i>
          <i class="fa fa-angle-right team-right"></i>
        </div>
      </div>
    </section>
  </main>

<!-- Main content ends here -->

<%@ include file = "Footer.jsp" %>

</body>
</html>