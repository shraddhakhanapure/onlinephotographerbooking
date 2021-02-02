 <%if(session.getAttribute("Pemail")==null) {%>
 
 <script>
 alert("First Login")
 location.href="Login.jsp";
 </script>
 <% } %>

 <%
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
        <img src="./assets/images/iconimage.png" alt="" width="140" height="50" alt="" loading="lazy">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
             <a class="nav-link" href="ShowphotographerOrders.jsp">Show Orders <br> </a>
          </li>
           
        <!--<li class="nav-item">
             <a class="nav-link" href="Logout.jsp"> <button class="btn btn-info">Logout </button><br> </a>
          </li>  -->  
          
        
        </ul>
      </div>
    </div>
  </nav>
<!-- Navbar ends here 
	<form action="Logout.jsp" method="post">
      <button class="button button3">Logout</button>
   </form>
-->
