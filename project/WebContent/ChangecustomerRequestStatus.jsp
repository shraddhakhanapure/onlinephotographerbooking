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
int orderid=Integer.parseInt(request.getParameter("orderid"));

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
	String sql="SELECT status FROM photographer.bookedphotographers where OrderId=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, orderid);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String sts=rs.getString(1);
		if(sts.equals("Pending"))
		{
			String sql1="update photographer.bookedphotographers set status=? where OrderId=?";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ps1.setString(1, "Confirmed");
			ps1.setInt(2, orderid);
			int count=ps1.executeUpdate();
			if(count>0)
			{
				%><script>
				 alert("Order confirmed successfully..!!");
				 location.href="ShowphotographerOrders.jsp";
				 </script>
				<% 
			}
			else
			{
				%><script>
				 alert("Problem while updating status..!!");
				 location.href="ShowphotographerOrders.jsp";
				 </script>
				<%
			}
			
		}
		else if(sts.equals("Confirmed"))
		{
			String sql1="update photographer.bookedphotographers set status=? where OrderId=?";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ps1.setString(1, "Pending");
			ps1.setInt(2, orderid);
			int count=ps1.executeUpdate();
			if(count>0)
			{
				%><script>
				 alert("Order kept in Pending..!!");
				 location.href="ShowphotographerOrders.jsp";
				 </script>
				<% 
			}
			else
			{
				%><script>
				 alert("Problem while updating status ..!!");
				 location.href="ShowphotographerOrders.jsp";
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