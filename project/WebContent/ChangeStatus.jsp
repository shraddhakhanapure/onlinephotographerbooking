<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
int id=Integer.parseInt(request.getParameter("id"));

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
	String sql="SELECT status FROM photographer.photographerdetails where id=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, id);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String sts=rs.getString(1);
		if(sts.equals("Inactive"))
		{
			String sql1="update photographer.photographerdetails set status=? where id=?";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ps1.setString(1, "Active");
			ps1.setInt(2, id);
			int count=ps1.executeUpdate();
			if(count>0)
			{
				%><script>
				 alert("Account Activated successfully..!!");
				 location.href="ShowPhotographers.jsp";
				 </script>
				<% 
			}
			else
			{
				%><script>
				 alert("Problem while updating status successfully..!!");
				 location.href="ShowPhotographers.jsp";
				 </script>
				<%
			}
			
		}
		else if(sts.equals("Active"))
		{
			String sql1="update photographer.photographerdetails set status=? where id=?";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ps1.setString(1, "Inactive");
			ps1.setInt(2, id);
			int count=ps1.executeUpdate();
			if(count>0)
			{
				%><script>
				 alert("Account Deactivated successfully..!!");
				 location.href="ShowPhotographers.jsp";
				 </script>
				<% 
			}
			else
			{
				%><script>
				 alert("Problem while updating status successfully..!!");
				 location.href="ShowPhotographers.jsp";
				 </script>
				<%
			}
			
		} 
		
	}
	
	con.close();
} catch (Exception e) {
System.out.println("Connection error..!");
e.printStackTrace();
}
%>

</body>
</html>