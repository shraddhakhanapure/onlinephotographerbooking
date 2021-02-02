 <%if(session.getAttribute("email")==null) {%>
 
 <script>
 alert("First Login")
 location.href="AdminLogin.jsp";
 </script>
 <% } %>

 <%
 String subname=null;
 
 try{
 String name = (String) session.getAttribute("email");
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

<%
/*if (session != null) {
    if (session.getAttribute("email") != null) {
       String nm = (String) session.getAttribute("email");
       //out.print("Hello, " + nm + "  Welcome to ur Profile");
    }
}*/
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
        <li class="nav-item">
             <a class="nav-link" href="ShowDashboards.jsp">Dashboard<br> </a>
          </li>
        
             <li class="nav-item">
             <a class="nav-link" href="ShowPhotographers.jsp">Photographers<br> </a>
          </li>
          <li class="nav-item">
             <a class="nav-link" href="ShowCustomers.jsp">Customers<br> </a>
          </li>
          
        
        </ul>
      </div>
    </div>
  </nav>
<!-- Navbar ends here 
	<form action="Logout.jsp" method="post">
      <button class="button button3">Logout</button>
   </form>
-->
