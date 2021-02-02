
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.*"%>

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

	
MultipartRequest m = new MultipartRequest(request,"C:/Users/asus/eclipse-workspace/New folder/Photographer/WebContent/assets/images",1048*1048*1048);
//String	profilepic ="images/"+m.getFilesystemName("sc");

String Fname=null, Lname=null, Email=null, Age=null, Height=null, city=null, Address=null, profilePic=null; 
String ContactNo=null, ShopAddress=null, Services=null, CameraType=null, perhr=null, perimg=null, img1=null, img2=null, img3=null, img4=null;
String fbid=null, instaid=null,speciality=null;

Fname=m.getParameter("fname");
Lname=m.getParameter("lname"); 
Email=m.getParameter("email");
Age=m.getParameter("age");
Height=m.getParameter("Height");
city=m.getParameter("city");
Address=m.getParameter("address"); 
profilePic="assets/images/"+m.getFilesystemName("profpic");
ContactNo=m.getParameter("contact");
ShopAddress=m.getParameter("ShopAddress");
Services=m.getParameter("services");
CameraType=m.getParameter("camera");
perhr=m.getParameter("RatePerHour");
perimg=m.getParameter("PerImage");
img1="assets/images/"+m.getFilesystemName("img1");
img2="assets/images/"+m.getFilesystemName("img2");
img3="assets/images/"+m.getFilesystemName("img3");
img4="assets/images/"+m.getFilesystemName("img4");
int id1=Integer.parseInt(m.getParameter("id"));

fbid=m.getParameter("fbid");
instaid=m.getParameter("instaid");
speciality=m.getParameter("speciality");



//update photographer.photographerdetails set profilePic='assets/images/AI.jpg' where Address='latir'; 
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
PreparedStatement ps1=con.prepareStatement("select Pid from photographer.photographerssignup where Email=? and Pid=?");
ps1.setString(1, Email);
ps1.setInt(2, id1);

ResultSet rs1=ps1.executeQuery();
if(rs1.next())
{
	int id=rs1.getInt(1);
	
	String sql="insert into photographer.photographerdetails (Fname, Lname, Email, Age, Height, city, Address, profilePic, ContactNo, ShopAddress, Services, CameraType, perhr, perimg, img1, img2, img3, img4, status,Fb, insta, pid, speciality) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(sql);

	//Fname, Lname, Email, Age, Height, city, Address, profilePic, ContactNo, ShopAddress, Services, CameraType, perhr, perimg, img1, img2, img3, img4
	ps.setString(1,Fname);
	ps.setString(2,Lname);
	ps.setString(3,Email);
	ps.setString(4,Age);
	ps.setString(5,Height);
	ps.setString(6,city);
	ps.setString(7,Address);
	ps.setString(8,profilePic);
	ps.setString(9,ContactNo);
	ps.setString(10,ShopAddress);
	ps.setString(11,Services);
	ps.setString(12,CameraType);
	ps.setString(13,perhr);
	ps.setString(14,perimg);
	ps.setString(15,img1);
	ps.setString(16,img2);
	ps.setString(17,img3);
	ps.setString(18,img4);
	ps.setString(19, "Inactive");
	ps.setString(20, fbid);
	ps.setString(21, instaid);
	ps.setInt(22, id); //value to the foreign key
	ps.setString(23, speciality);


	int count=ps.executeUpdate();
	if(count>0)
	{
	
	%>

	<script>
		 alert("Profile Data inserted successfully..!!");
		 location.href="MyProfile.jsp?id="+<%= id %>;
		 </script>

	<% 
	
	}
	else
	{

	%>
	<script>
	 alert("Technical error..!!");
	 location.href="InsertProfileDetails.jsp";
	 </script>
	<%}
}
else
{

%>
<script>
 alert("invalid username OR password..!!");
 location.href="Login.jsp";
 </script>
<%}

}
catch(Exception e) {
e.printStackTrace();
}
%>



</body>
</html>
