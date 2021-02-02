<%@ page import="java.sql.*"%>
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
<!------ Include the above in your HEAD tag ---------->

<title>Profile</title>

<%@ include file="ExternalLinks.jsp"%>
</head>

<body>

	<%@ include file="PhotographerHeader.jsp"%>
	<!-- create photographer header  show photographer name-->
	<%@ include file="PhotographerNav.jsp"%>
	<!-- create photographer Navbar, Logout -->
	<center>
		<h1>Photographers profile</h1>
	</center>
	<!-- profile start-->

	<%
		int id = Integer.parseInt(request.getParameter("id"));
		//out.println(id);
	%>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer", "root","root");
			PreparedStatement ps = con.prepareStatement("select * from photographer.photographerdetails where id=?");
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
	%>



	<div class="container emp-profile">
		<form method="post">
			<div class="row">
				<div class="col-md-4">
					<div class="profile-img">
						<!--    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog" alt=""/> -->
						<img src="<%=rs.getString(9)%>" alt=""  style="width:40%;height:100%;"/>
						<!--
					<div class="file btn btn-lg btn-primary">
							Change Photo <input type="file" name="file" />
						</div>  
					-->
					</div>
				</div>
				<div class="col-md-6">
					<div class="profile-head">
						<h5>
							<%=rs.getString(2)%>
							<%=rs.getString(3)%>
							<span style="color: orange;"><%=rs.getString(20)%></span>
						</h5>

						<h6><%=rs.getString(24)%></h6>
						<!--  <p class="proile-rating">
							RANKINGS : <span>8/10</span>
						</p>-->
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">About</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile" aria-selected="false">Timeline</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<input type="button" class="profile-edit-btn" name="btnAddMore"
						value="Edit Profile" onclick="relocate_edit_profile()" />
				</div>
		
				<script>
					function relocate_edit_profile() {
						location.href = "EditPhotographerProfile.jsp?id="+<%= id %>;
					}
				</script>
		
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="profile-work">
						<p>SOCIAL Id's:</p>
						<img src="assets/images/facebook.png"
							style="height: 30px; width: 30px;"><a
							href="<%=rs.getString(21)%>" style="margin-left: 10px;"><%=rs.getString(21)%></a><br />
						<br /> <img src="assets/images/instagram.png"
							style="height: 30px; width: 30px;">
							<a href="<%=rs.getString(22)%>" style="margin-left: 10px;"><%=rs.getString(22)%></a><br />
						<br /> <img src="assets/images/blog.png"
							style="height: 30px; width: 30px;"><a href=""
							style="margin-left: 10px;">Blog</a>
						<p>SKILLS</p>
						<a href="">Creative</a><br /> <a href="">Video Editing</a><br />
						<a href="">Patience</a><br /> <a href="">Flexible</a><br /> <a
							href="">Artistic vision</a><br />
					</div>
				</div>
				<div class="col-md-8">
					<div class="tab-content profile-tab" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="row">
								<div class="col-md-6">
									<label>User Id</label>
								</div>
								<div class="col-md-6">
									<p>
										PT
										<%=rs.getString(1)%></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Name</label>
								</div>
								<div class="col-md-6">
									<p><%=rs.getString(2)%>
										<%=rs.getString(3)%>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Email</label>
								</div>
								<div class="col-md-6">
									<p><%=rs.getString(4)%></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Phone</label>
								</div>
								<div class="col-md-6">
									<p><%=rs.getString(10)%></p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<label>Age / Height</label>
								</div>
								<div class="col-md-6">
									<p><%=rs.getString(5)%>
										<%="/ "%><%=rs.getString(6)%></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Address</label>
								</div>
								<div class="col-md-6">
									<p><%=rs.getString(8)%></p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-6">
									<label>Profession</label>
								</div>
								<div class="col-md-6">
									<p>Photographer</p>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="profile" role="tabpanel"
							aria-labelledby="profile-tab">

							<center>
								<div class="row" style="background-color: orange;">
									<div class="col-md-12">
										<label>Your Bio</label><br />
										<p>Your detail description</p>
									</div>
								</div>
							</center>


							<div class="row">
								<div class="col-md-6">
									<label>Shop Address</label>
								</div>
								<div class="col-md-6">
									<p><%=rs.getString(11)%></p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<label>Services</label>
								</div>
								<div class="col-md-6">
									<p><%=rs.getString(12)%></p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<label>Camera Type</label>
								</div>
								<div class="col-md-6">
									<p><%=rs.getString(13)%></p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<label>Experience</label>
								</div>
								<div class="col-md-6">
									<p>Expert</p>
								</div>
							</div>



							<div class="row">
								<div class="col-md-6">
									<label>Hourly Rate</label>
								</div>
								<div class="col-md-6">
									<p>
										Rs.<%=rs.getString(14)%>/hr
									</p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<label>Per Photo Rate</label>
								</div>
								<div class="col-md-6">
									<p>
										Rs.<%=rs.getString(15)%>/Photo
									</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-6">
									<label>Total Projects</label>
								</div>
								<div class="col-md-6">
									<p>230</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>English Level</label>
								</div>
								<div class="col-md-6">
									<p>Expert</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Availability</label>
								</div>
								<div class="col-md-6">
									<p>6 months</p>
								</div>
							</div>

							<!-- Galary images -->

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

							<!-- show photoes from here: https://bootstrapious.com/p/bootstrap-profile-page,
                                https://www.bootdey.com/snippets/view/bs4-seller-cards,https://bbbootstrap.com/snippets/individual-user-profile-social-network-94176986 -->
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- profile end here -->
	<% 
	}
}
catch (Exception e) 
{
System.out.println("Connection error..!");
e.printStackTrace();
}
	
%>

	<%@ include file="Footer.jsp"%>

</body>
</html>
