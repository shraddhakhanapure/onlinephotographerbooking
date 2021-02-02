<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
<%@ include file = "ExternalLinks.jsp" %>

<script>
function phonenumber(inputtxt)
{
  var phoneno = /(7|8|9)\d{9}$/;
  
  if(inputtxt.value.match(phoneno))
  {
      return true;
  }
  else
  {
  alert("Please enter a valid contact no else Order is not received by you..!");
  return false; 
  }
  }

</script>


</head>

<body>

<%@ include file = "PhotographerHeader.jsp" %>
<%@ include file = "PhotographerNav.jsp" %>
<!-- start main  content -->



<main class="login container">
    <h1 class="text-center mt-5 mb-5 animate__animated animate__slideInDown">
      Complete your profile
    </h1>
    <div class="row">
      <div class="col-md-6 ">
        <img src="./assets/images/login-image.png" class="img-fluid" alt="img">
      </div>
      
      <form class="col-md-5 offset-1" action="InsertProfileDetails.jsp" method="POST" enctype="multipart/form-data" name="form1" onsubmit="return phonenumber(document.form1.contact)">

<!-- Enter personal information -->       
       <fieldset>
       <legend>Personal Information:</legend>
  
  <%
  int id=Integer.parseInt(request.getParameter("id"));

  try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
		PreparedStatement ps = con.prepareStatement("select * from photographer.photographerssignup where Pid=?");
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		
		if(rs.next())
		{

  %>    
 		 <div class="form-group">
          <input type="hidden" class="form-control" name="id" value="<%=id%>">
        </div>
 		
  
        <div class="form-group">
          <input type="text" class="form-control" name="fname" placeholder="First Name" value="<%= rs.getString(2) %>">
        </div>

        <div class="form-group">
          <input type="text" class="form-control" name="lname" placeholder="Last Name" value="<%= rs.getString(3) %>">
        </div>
        
        <div class="form-group">
          <input type="email" class="form-control" name="email" placeholder="Email" value="<%= rs.getString(5) %>">
        </div>
<%
}
  } catch (Exception e) {
	  System.out.println("Connection error..!");
	  e.printStackTrace();
	  }

		
%>
 		<div class="form-group">
          <input type="text" class="form-control" name="age" placeholder="Age">
        </div>

	   <div class="form-group">
          <input type="text" class="form-control" name="Height" placeholder="Height">
        </div>


		<div class="form-group">
               <input type="text" class="form-control" name="city" placeholder="City">
        </div>
		
		<div class="form-group">
               <textarea class="form-control" rows="3" name="address"  placeholder="Enter Address Here"></textarea>
        </div>
		
		<div class="form-group">
		<label class="form-label" for="customFile">Select Profile Picture</label>
		<input type="file" class="form-control" name="profpic" id="customFile" />
		</div>
		</fieldset>

<!-- Enter Business information -->       		
		<hr style="background-color:white;">
		 <fieldset>
       <legend>Business Information:</legend>
       <div class="form-group">
               <input type="text" class="form-control" name="contact" placeholder="Contact No">
       </div>
	   
	   <div class="form-group">
               <textarea class="form-control" rows="3" name="ShopAddress"  placeholder="Shop/office Address"></textarea>
        </div>
		
       	<div class="form-group">
               <textarea class="form-control" rows="3" name="services"  placeholder="Available Services Here"></textarea>
        </div>
       
       <div class="form-group">
               <input type="text" class="form-control" name="camera" placeholder="Available Camera type">
       </div>		
      </fieldset>
      
      
<!-- Enter Applicable charges -->       
		
		<hr style="background-color:white;">
		 <fieldset>
       <legend>Applicable charges (Rs.):</legend>
       <div class="form-group">
               <input type="text" class="form-control" name="RatePerHour" placeholder="Per Hour">
       </div>		

<!--        <div class="form-group">
               <input type="text" class="form-control" name="commercial" placeholder="Commercial-Per Hour">
       </div>		

       <div class="form-group">
               <input type="text" class="form-control" name="Photoshoot" placeholder="Photoshoot-Per hour">
       </div>		
-->
       <div class="form-group">
               <input type="text" class="form-control" name="PerImage" placeholder="Per Image">
       </div>		
 
		</fieldset>

<!-- --------------------------Social media links----------------------------------- -->
<!-- Upload your photos -->       
		<hr style="background-color:white;">
		 <fieldset>
       <legend>Social media Ids:</legend>
       
       <div class="form-group">
		<label class="form-label" for="customFile">Facebook:</label>
		<input type="text" class="form-control" name="fbid" id="customFile" />
		</div>
		

       <div class="form-group">
		<label class="form-label" for="customFile">Instagram:</label>
		<input type="text" class="form-control" name="instaid" id="customFile" />
		</div>


       <div class="form-group">
		
		<label class="form-label" for="customFile">Speciality</label>
		<select class="form-select" aria-label="Default select example" name="speciality" style="width:-webkit-fill-available;">
  		<option selected value="Photoshoot">Photoshoot</option>
  		<option value="Wedding">Wedding</option>
  		<option value="Wild life">Wild life</option>
  		<option value="Commercial">Commercial and industrial</option>
  		<option value="Events">Events</option>
  		<option value="Drone">Drone</option>
  		<option value="News">News</option>
  		<option value="Fine Arts">Fine Arts</option>
		</select>
	    </div>
		</fieldset>


<!-- -----------------------------social media links-------------------------------------------------- -->


<!-- Upload your photos -->       
		<hr style="background-color:white;">
		 <fieldset>
       <legend>Upload Your Best Shoots:</legend>
       
       <div class="form-group">
		<label class="form-label" for="customFile">Image-1</label>
		<input type="file" class="form-control" name="img1" id="customFile" />
		</div>
		

       <div class="form-group">
		<label class="form-label" for="customFile">Image-2</label>
		<input type="file" class="form-control" name="img2" id="customFile" />
		</div>


       <div class="form-group">
		<label class="form-label" for="customFile">Image-3</label>
		<input type="file" class="form-control" name="img3" id="customFile" />
		</div>


       <div class="form-group">
		<label class="form-label" for="customFile">Image-4</label>
		<input type="file" class="form-control" name="img4" id="customFile" />
		</div>

		
		</fieldset>

        <button type="submit" class="btn btn-accent form-btn w-100 mt-3 mb-3" onclick="phonenumber(document.form1.contact)">Submit</button>

      </form>
    </div>
  </main>

<!-- Main part end here -->

<!-- End main content -->
<%@ include file = "Footer.jsp" %>

</body>
</html>