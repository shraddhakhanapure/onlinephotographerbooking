<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register | Hire Photographer</title>
<%@ include file = "ExternalLinks.jsp" %>
</head>

<body>

<%@ include file = "Header.jsp" %>
<%@ include file = "Navbar.jsp" %>
<!-- Start main section -->


 <main class="register container">
    <h1 class="text-center mt-5 mb-5">
      Sign Up for Photographer
    </h1>
    <div class="row">
      <div class="col-md-6 ">
        <img src="./assets/images/login-image.png" class="img-fluid" alt="img">
      </div>
      <form class="col-md-5 offset-md-1" action=Controller method="POST">
        <div class="form-group">
          <input type="text" class="form-control" name="fname" placeholder="First Name" required>
        </div>
        <div class="form-group">
          <input type="text" class="form-control"  name="lname" placeholder="Last Name" required>
        </div>
        <div class="form-group">
          <input type="text" class="form-control" name="unm" placeholder="UserName" required>
        </div>
        <div class="form-group">
          <input type="email" class="form-control" name="email" placeholder="Email Address" required>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" name="pwd" placeholder="Password" required>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" name="conpass" placeholder="Confirm Password" required>
        </div>

        <button type="submit" class="btn btn-accent form-btn w-100 mt-3 mb-3">Signup</button>
        <div class="text-center">
          OR
        </div>

        <button class="btn btn-primary form-btn w-100 mt-3">Facebook</button>
        <button class="btn btn-accent form-btn w-100 mt-3 mb-3">Google</button>

      </form>
    </div>
  </main>



<!-- End main section -->
<%@ include file = "Footer.jsp" %>

</body>
</html>