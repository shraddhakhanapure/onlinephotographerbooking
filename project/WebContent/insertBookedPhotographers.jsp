
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>insertion</title>
</head>
<body>

	<%

try {

	
	//OrderId, Cemail, photogid, eventName, Eventplace, Eventdate, BookingHrs, AlternateContact, BookingDate, Status
	String cemail=null, EventName=null, Eventplace=null, EventDate=null, bookingHourse=null, Alternatecontact=null, BookingDate=null,status=null;
	int photogid=0;

	
cemail=request.getParameter("Cemail");
EventName=request.getParameter("Eventname");
Eventplace=request.getParameter("Eventlocation");
EventDate=request.getParameter("Eventdate");
bookingHourse=request.getParameter("bookinghr"); 
Alternatecontact=request.getParameter("altrcontact");

LocalDate date = LocalDate.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
//System.out.println(date.format(formatter));
BookingDate=date.format(formatter);


status="Pending";
photogid=Integer.parseInt(request.getParameter("photogid"));




//update photographer.photographerdetails set profilePic='assets/images/AI.jpg' where Address='latir'; 
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");



String sql="insert into photographer.bookedphotographers(Cemail, photogid, eventName, Eventplace, Eventdate, BookingHrs, AlternateContact, BookingDate, Status)values(?,?,?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(sql);

//OrderId, Cemail, photogid, eventName, Eventplace, Eventdate, BookingHrs, AlternateContact, BookingDate, Status

ps.setString(1,cemail);
ps.setInt(2,photogid);
ps.setString(3,EventName);
ps.setString(4,Eventplace);
ps.setString(5,EventDate);
ps.setString(6,bookingHourse);
ps.setString(7,Alternatecontact);
ps.setString(8,BookingDate);
ps.setString(9,status);

	int count=ps.executeUpdate();
	if(count>0)
	{
	
	%>

	<script>
		 alert("Order placed successfully..!!");
		 location.href="ShowBookedPhotographerstocustomers.jsp?id="+<%= photogid %>;
		 </script>

	<% 
	
	}
	else
	{

	%>
	<script>
	 alert("Technical error..!!");
	 location.href="BookPhotographer.jsp";
	 </script>
	<%}
con.close();
}
catch(Exception e) {
e.printStackTrace();
}
%>



</body>
</html>
