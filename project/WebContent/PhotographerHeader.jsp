<%@ page import="java.sql.*" %>
 <%if(session.getAttribute("Pemail")==null) 
 {%>
 <script>
 alert("First Login")
 location.href="Login.jsp";
 </script>
 <% } %>

 <%
 String subname=null;
 
 try{
 String name = (String) session.getAttribute("Pemail");
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
          			<div class="col-md-2">
					<input type="button" class="profile-edit-btn btn-warning" name="btnAddMore"
						value="<%=subname %>" onclick="relocate_edit_profilee()"  style="width:70px;"/>
				</div>
		
		<%
		int id1=0;
		try
		{
			String pemail=session.getAttribute("Pemail").toString();
	
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
			
			String sql="SELECT pid FROM photographer.photographerdetails where Email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,pemail);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				id1=rs.getInt(1);
			}
		
	} 
	catch (Exception e) {
		System.out.println("Connection error..!");
		e.printStackTrace();
		}
		%>
		
		
				<script>
					function relocate_edit_profilee() {
						location.href = "MyProfile.jsp?id="+<%= id1 %>;
					}
				</script>
	
	
          <a class="nav-link" href="Logout.jsp"> <button class="btn btn-info">Logout </button><br> </a>
        </div>
      </div>
    </div>
  </header>
<!-- header end here -->