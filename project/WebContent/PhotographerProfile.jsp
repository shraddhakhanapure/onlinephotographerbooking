<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/PhotographerProfile.css">


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
<link rel="stylesheet" type="text/css" href="css/Myprofile.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="css/GallaryImages.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.8.2/css/lightbox.min.css">

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<title>Index</title>
<%@ include file = "ExternalLinks.jsp" %>
</head>

<body style="background:-webkit-linear-gradient(left, #040316, #02181ec2)">

<%@ include file = "AdminHeader.jsp" %> <!-- create photographer header  show photographer name-->
<%@ include file = "AdminNavbar.jsp" %> <!-- create photographer Navbar, Logout -->
<center><h4>Photographers profile</h4></center>	
<% 
//int id=Integer.parseInt(request.getParameter("id"));
//out.println(id);
%>
<!-- profile start-->
<div class="container">
    <div class="main-body">
    
          <!-- /Breadcrumb -->
            <% 
            try {
            	
                int id=Integer.parseInt(request.getParameter("id")); 
                System.out.println(id);

            	Class.forName("com.mysql.jdbc.Driver");
            	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
            	PreparedStatement ps = con.prepareStatement("select * from photographer.photographerdetails where Pid=?");
            	ps.setInt(1, id);
            	ResultSet rs=ps.executeQuery();
            	if(rs.next())
            	{
            %>
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="<%=rs.getString(9) %>" alt="Admin" class="img-thumbnail" width="150">
                    <div class="mt-3">
                      <h4><%=rs.getString(2) %><%=" " %><%=rs.getString(3) %></h4>
                      <p class="text-secondary mb-1"><b>Special Area: </b><%=rs.getString(24) %></p>
                      <p class="text-muted font-size-sm"><b>Address: </b><%=rs.getString(8) %></p>
                      <button class="btn btn-primary">Follow</button>
                      <button class="btn btn-outline-primary">Message</button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe mr-2 icon-inline"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>Website</h6>
                    <span class="text-secondary">Google.com</span>
                  </li>
                  
                  <!-- 
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github mr-2 icon-inline"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>Github</h6>
                    <span class="text-secondary">Github</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter mr-2 icon-inline text-info"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>Twitter</h6>
                    <span class="text-secondary">Tweeter</span>
                  </li>
                   -->
                  
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram mr-2 icon-inline text-danger"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>Instagram</h6>
                    <span class="text-secondary"><a href="<%= rs.getString(22)%>" style="color:blue;"><%= rs.getString(22)%></a></span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook mr-2 icon-inline text-primary"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>Facebook</h6>
                    <span class="text-secondary"><a href="<%= rs.getString(21)%>" style="color:blue;"><%= rs.getString(21)%></a></span>
                  </li>
                </ul>
              </div>
            </div>
            
            
            <div class="col-md-8">
              <div class="card mb-3" style="width:auto;">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      :  <%= rs.getString(4)%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Shop Adderss</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      :  <%= rs.getString(11)%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      :  <%= rs.getString(10)%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Services</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      :  <%= rs.getString(12)%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Camera Type</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      :  <%= rs.getString(13)%>
                    </div>
                  </div>
                  
       			<hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Applicable charges</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <b>Per Hour :</b> <%= rs.getString(14)%><%=",   " %>
                 	 <b>Per Image :</b> <%= rs.getString(15)%><br/>
                    </div>
                  </div>
                  
                </div>
              </div>
              
              <!--  
              <div class="row gutters-sm">
                <div class="col-sm-6 mb-3">
                  <div class="card h-100">
                    <div class="card-body">
                      <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>Project Status</h6>
                      <small>Web Design</small>
                      <div class="progress mb-3" style="height: 5px">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <small>Website Markup</small>
                      <div class="progress mb-3" style="height: 5px">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <small>One Page</small>
                      <div class="progress mb-3" style="height: 5px">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <small>Mobile Template</small>
                      <div class="progress mb-3" style="height: 5px">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <small>Backend API</small>
                      <div class="progress mb-3" style="height: 5px">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6 mb-3">
                  <div class="card h-100">
                    <div class="card-body">
                      <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>Project Status</h6>
                      <small>Web Design</small>
                      <div class="progress mb-3" style="height: 5px">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <small>Website Markup</small>
                      <div class="progress mb-3" style="height: 5px">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <small>One Page</small>
                      <div class="progress mb-3" style="height: 5px">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <small>Mobile Template</small>
                      <div class="progress mb-3" style="height: 5px">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <small>Backend API</small>
                      <div class="progress mb-3" style="height: 5px">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              -->
              
<!------------------------------------------------------------------- Photo gallary  start------------------------------------------------------------>
              <div class="container">
  <h2>My 4 Best Shoots</h2>
  <p>Evaluated, trained and instructed photography .</p>
  <p>Available upon request..!</p>
	<!-- include GallaryImages.jsp here -->
							<div class="photo-gallery">
								<div class="container">
									<div class="intro">
										<h2 class="text-center" style="color: orange;">Best
											Shoots</h2>
										<hr>
										<!--  <p class="text-center">The best  ones that i shoot with nice shots...! </p>-->
									</div>
									
									<div class="row photos">
										<div class="col-sm-6 col-md-4 col-lg-3 item">
											<a href="<%=rs.getString(16)%>" data-lightbox="photos"><img
												class="img-fluid" src="<%=rs.getString(16)%>"></a>
										</div>
										<div class="col-sm-6 col-md-4 col-lg-3 item">
											<a href="<%=rs.getString(17)%>" data-lightbox="photos"><img
												class="img-fluid" src="<%=rs.getString(17)%>"></a>
										</div>
										<div class="col-sm-6 col-md-4 col-lg-3 item">
											<a href="<%=rs.getString(18)%>" data-lightbox="photos"><img
												class="img-fluid" src="<%=rs.getString(18)%>"></a>
										</div>
										<div class="col-sm-6 col-md-4 col-lg-3 item">
											<a href="<%=rs.getString(19)%>" data-lightbox="photos"><img
												class="img-fluid" src="<%=rs.getString(19)%>"></a>
										</div>
										<!--<div class="col-sm-6 col-md-4 col-lg-3 item"><a href="assets/img/loft.jpg" data-lightbox="photos"><img class="img-fluid" src="assets/img/loft.jpg"></a></div>
                <div class="col-sm-6 col-md-4 col-lg-3 item"><a href="assets/img/desk.jpg" data-lightbox="photos"><img class="img-fluid" src="assets/img/desk.jpg"></a></div>  -->
									</div>
								</div>
							</div>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.8.2/js/lightbox.min.js"></script>
							<!-- Galary images -->

</div>
              
<!------------------------------------------------------------------- Photo gallary  end------------------------------------------------------------>
              
            </div>
          </div>
           <% }
            	}
            catch (Exception e) {
            	System.out.println("Connection error..!");
            	e.printStackTrace();
            	}

            %>
          
        </div>
    </div>
<!-- profile end here -->

<%@ include file = "Footer.jsp" %>

</body>
</html>
