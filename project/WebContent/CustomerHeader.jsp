 <%if(session.getAttribute("cemail")==null) 
 {%>
   <!-- header start-->
  <header class="header ">
    <div class="container">
      <div class="row ">
        <div class="col-md-6 header-info">
          <a href="mailto:info@Photographers.com" class="mr-3">info@Photographers.com</a>
          <span>Call at: +91 8862000838 </span>
        </div>
        <div class="header-buttons col-md-6 d-flex justify-content-end">
          <a class="btn btn-accent mr-3" href="Login.jsp">Signin</a>
          <a class="btn btn-accent " href="Register.jsp">SignUp</a>
        </div>
      </div>
    </div>
  </header>
<!-- header end here -->
 
 <% } 
 else{
	 

	 String subname=null;
	 
	 try{
	 String name = (String) session.getAttribute("cemail");
	 int x = name.indexOf("@");
	 if (x != -1) 
	 {
	     subname= name.substring(0 , x); //this will give abc
	 }
	 }
	 catch (Exception e)
	 {
		 e.printStackTrace();
	 }
	 %>

	  <!-- header start-->
	  <header class="header ">
	    <div class="container">
	      <div class="row ">
	        <div class="col-md-6 header-info">
	          <a href="mailto:info@Photographers.com" class="mr-3">info@Photographers.com</a>
	          <span>Call at: +91 8862000838 </span>
	        </div>
	        <div class="header-buttons col-md-6 d-flex justify-content-end">
	          <a class="btn btn-accent mr-3" href="#" style="background-color:orange;width:auto;"><%= subname%></a> <a class="nav-link" href="Logout.jsp"> <button class="btn btn-info">Logout </button><br> </a>
	        </div>
	      </div>
	    </div>
	  </header>
	<!-- header end here -->	 
<%  
}
 %>
 