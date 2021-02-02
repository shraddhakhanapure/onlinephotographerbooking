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

<%@ include file = "PhotographerHeader.jsp" %>
<%@ include file = "PhotographerNav.jsp" %>
<!-- start main  content -->



<main class="login container">
<%
  int id=Integer.parseInt(request.getParameter("id"));
%>
				<div class="col-md-12" style="width:100%;" align="right">
				<center><h1 class="text-center mt-5 mb-5 animate__animated animate__slideInDown">
      Update your profile  
    </h1></center>
    
					<input type="button" class="profile-edit-btn btn-warning" name="btnAddMore" value="Back to Profile" onclick="relocate_edit_profile()" />
				</div>
		
				<script>
					function relocate_edit_profile() {
						location.href = "MyProfile.jsp?id="+<%= id %>;
					}
				</script>
		
    
    
    <div class="container">
    <div class="row">
      <!--  <div class="col-md-2 ">
        <img src="./assets/images/login-image.png" class="img-fluid" alt="img">
      </div>
       -->
      <div class="col-md-12 ">
      
      <form class="col-md-12 offset-1" action="InsertUpdatedProfileDetails.jsp" method="POST" enctype="multipart/form-data" name="form1"  onsubmit="return phonenumber(document.form1.contact)">

<!-- Enter personal information -->

    <div class="row">
       <div class="col-md-6 ">
       
       <fieldset>
       <legend>Personal Information:</legend>
  
  <%
	
  try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
		PreparedStatement ps = con.prepareStatement("select * from photographer.photographerdetails where id=?");
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		
		if(rs.next())
		{

  %>    
  
 		 <div class="form-group">
          <input type="hidden" class="form-control" name="id" value="<%=id%>">
        </div>
 		
  
        <div class="form-group">
          <input type="text" class="form-control" name="fname" placeholder="First Name" value="<%= rs.getString(2) %>" readonly="readonly">
        </div>

        <div class="form-group">
          <input type="text" class="form-control" name="lname" placeholder="Last Name" value="<%= rs.getString(3) %>" readonly="readonly">
        </div>
        
        <div class="form-group">
          <input type="email" class="form-control" name="email" placeholder="Email" value="<%= rs.getString(4) %>" readonly="readonly">
        </div>
 		<div class="form-group">
          <input type="text" class="form-control" name="age" placeholder="Age" value="<%= rs.getString(5) %>">
        </div>

	   <div class="form-group">
          <input type="text" class="form-control" name="Height" placeholder="Height" value="<%= rs.getString(6) %>">
        </div>


		<div class="form-group">
               <input type="text" class="form-control" name="city" placeholder="City" value="<%= rs.getString(7) %>">
        </div>
		
		<div class="form-group">
               <textarea class="form-control" rows="3" name="address"  placeholder="Enter Address Here"><%= rs.getString(8) %></textarea>
        </div>
		
		<div class="form-group">
		<label class="form-label" for="customFile">Select Profile Picture </label>
		<img src="<%= rs.getString(9) %>">
		<input type="file" class="form-control" name="profpic" id="customFile" />
		</div>
		
		<div class="form-group">
		<input type="hidden" class="form-control" name="profpic1" id="customFile" value="<%= rs.getString(9) %>" />
		</div>
	
		</fieldset>
		</div>
		<hr style="background-color:white;">
		<div class="col-md-6 ">
<!-- Enter Business information -->       		
					
				
				
		 <fieldset>
       <legend>Business Information:</legend>
       <div class="form-group">
               <input type="text" class="form-control" name="contact" placeholder="Contact No" value="<%= rs.getString(10) %>" required>
       </div>
	   
	   <div class="form-group">
               <textarea class="form-control" rows="3" name="ShopAddress"  placeholder="Shop/office Address" required> <%= rs.getString(11) %></textarea>
        </div>
		
       	<div class="form-group">
               <textarea class="form-control" rows="3" name="services"  placeholder="Available Services Here" required><%= rs.getString(12) %></textarea>
        </div>
       
       <div class="form-group">
               <input type="text" class="form-control" name="camera" placeholder="Available Camera type" value="<%= rs.getString(13) %>" required>
       </div>		
       
       
       <!-- Enter Applicable charges -->       
		
		<hr style="background-color:white;">
		 <fieldset>
       <legend>Applicable charges (Rs.):</legend>
       <div class="form-group">
               <input type="text" class="form-control" name="RatePerHour" placeholder="Per Hour" value="<%= rs.getString(14) %>" required>
       </div>		

<!--        <div class="form-group">
               <input type="text" class="form-control" name="commercial" placeholder="Commercial-Per Hour">
       </div>		

       <div class="form-group">
               <input type="text" class="form-control" name="Photoshoot" placeholder="Photoshoot-Per hour">
       </div>		
-->
       <div class="form-group">
               <input type="text" class="form-control" name="PerImage" placeholder="Per Image" value="<%= rs.getString(15) %>">
       </div>		
 
		</fieldset>

       
<!-- --------------------------Social media links----------------------------------- -->
		<hr style="background-color:white;">
		 <fieldset>
       <legend>Social media Ids:</legend>
       
       <div class="form-group">
		<label class="form-label" for="customFile">Facebook:</label>
		<input type="text" class="form-control" name="fbid" id="customFile" value="<%= rs.getString(21) %>"/>
		</div>
		

       <div class="form-group">
		<label class="form-label" for="customFile">Instagram:</label>
		<input type="text" class="form-control" name="instaid" id="customFile"  value="<%= rs.getString(22) %>"/>
		</div>


       <div class="form-group">
		
		<label class="form-label" for="customFile">Speciality</label>
		<select class="form-select" aria-label="Default select example" name="speciality" style="width:-webkit-fill-available;" value="<%= rs.getString(24) %>">
  		<option selected value="Photoshoot">Photoshoot</option>
  		<option value="Wedding">Wedding</option>
  		<option value="Wild life">Wild life</option>
  		<option value="Commercial">commercial and industrial</option>
  		<option value="Events">Events</option>
  		<option value="Drone">Drone</option>
  		<option value="News">News</option>
  		<option value="Fine Arts">Fine Arts</option>
		</select>
	    </div>
		</fieldset>
       
      </fieldset>
      </div>
      </div>
      
      


<!-- -----------------------------social media links-------------------------------------------------- -->
	<div class="container">
	
		<hr style="background-color:white;">
		 <fieldset>
       <legend>Upload Your Best Shoots:</legend>
    <div class="row">
	
    <div class="col-sm">   
       <div class="form-group">
		<label class="form-label" for="customFile">Image-1</label>
		<img src="<%= rs.getString(16) %>" width="220">
		<input type="file" class="form-control" name="img1" id="customFile" />
		</div>
		
		 <div class="form-group">
		<input type="hidden" class="form-control" name="img11" id="customFile" value="<%= rs.getString(16) %>"/>
		</div>
	</div>

    <div class="col-sm">   

       <div class="form-group">
		<label class="form-label" for="customFile">Image-2</label>
		<img src="<%= rs.getString(17) %>" width="220">
		<input type="file" class="form-control" name="img2" id="customFile" />
		</div>

		 <div class="form-group">
		<input type="hidden" class="form-control" name="img12" id="customFile" value="<%= rs.getString(17) %>"/>
		</div>
	</div>
      
    <div class="col-sm">   
      
       <div class="form-group">
		<label class="form-label" for="customFile">Image-3</label>
		<img src="<%= rs.getString(18) %>">
		<input type="file" class="form-control" name="img3" id="customFile" />
		</div>

		<div class="form-group">
		<input type="hidden" class="form-control" name="img13" id="customFile" value="<%= rs.getString(18) %>"/>
		</div>
	</div>	
		
		<div class="col-sm">   
		
       <div class="form-group">
		<label class="form-label" for="customFile">Image-4</label>
		<img src="<%= rs.getString(19) %>">
		<input type="file" class="form-control" name="img4" id="customFile" />
		</div>
		
		<div class="form-group">
		<input type="hidden" class="form-control" name="img14" id="customFile" value="<%= rs.getString(19) %>"/>
		</div>
	</div>
		
		
		</div> <!-- row -->
		
		</fieldset>
		
		
</div> <!-- container -->

        		<button type="submit" class="btn btn-accent form-btn w-100 mt-3 mb-3" >Submit</button>
				
		
      </form>
      </div>
<%
}
  } catch (Exception e) {
	  System.out.println("Connection error..!");
	  e.printStackTrace();
	  }

		
%>

    </div><!-- row -->
    </div> <!-- Container -->
  </main>

<!-- Main part end here -->

<!-- End main content -->
<%@ include file = "Footer.jsp" %>


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

</body>
</html>