
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
ContactNo=m.getParameter("contact");
ShopAddress=m.getParameter("ShopAddress");
Services=m.getParameter("services");
CameraType=m.getParameter("camera");
perhr=m.getParameter("RatePerHour");
perimg=m.getParameter("PerImage");
int id1=Integer.parseInt(m.getParameter("id"));

fbid=m.getParameter("fbid");
instaid=m.getParameter("instaid");
speciality=m.getParameter("speciality");

//hidden images path, if user wont select it
String img11=m.getParameter("img11");
String img12=m.getParameter("img12");
String img13=m.getParameter("img13");
String img14=m.getParameter("img14");

int id=Integer.parseInt(m.getParameter("id"));
//update photographer.photographerdetails set profilePic='assets/images/AI.jpg' where Address='latir'; 
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
String sql="update photographer.photographerdetails set Age=?, Height=?, city=?, Address=?, profilePic=?, ContactNo=?, ShopAddress=?, Services=?, CameraType=?, perhr=?, perimg=?, img1=?, img2=?, img3=?, img4=?, Fb=?, insta=?, speciality=? where Pid=?";
PreparedStatement ps1=con.prepareStatement(sql);
ps1.setString(1, Age);
ps1.setString(2, Height);
ps1.setString(3, city);
ps1.setString(4,Address);

System.out.println("----------------------------------------------------");


//if prof pic is not null then get the full path and add into DB else fetch the previous path
profilePic=m.getFilesystemName("profpic");
System.out.println("profile pic data: "+profilePic);

if(profilePic==null)
{	
	String profilePic1=m.getParameter("profpic1"); //id new file is not selected1
	System.out.println("profile pic1: "+profilePic1);
	ps1.setString(5,profilePic1);
}
else
{
	profilePic="assets/images/"+m.getFilesystemName("profpic");
	System.out.println("profile pic: "+profilePic);
	ps1.setString(5,profilePic);
}



/*if(profilePic!=null || profilePic!="")
{
	profilePic="assets/images/"+m.getFilesystemName("profpic");
	ps1.setString(5, profilePic);
}
if(profilePic==null || profilePic=="")
{
	String sql2="select profilePic from photographer.photographerdetails  where Pid=?";
	PreparedStatement ps2=con.prepareStatement(sql2);
	ps2.setInt(1, id);
	ResultSet rs2=ps2.executeQuery();
	if(rs2.next())
	{
		ps1.setString(5,rs2.getString(1) );
	}

}	

*/


ps1.setString(6, ContactNo);
ps1.setString(7, ShopAddress);
ps1.setString(8, Services);
ps1.setString(9, CameraType);
ps1.setString(10, perhr);
ps1.setString(11, perimg);


img1=m.getFilesystemName("img1");
//System.out.println("Image-1 "+img1);

if(img1==null)
{	
	String img111=m.getParameter("img11"); //id new file is not selected
	ps1.setString(12, img111);
}
else
{
	img1="assets/images/"+m.getFilesystemName("img1");
	ps1.setString(12, img1);
}


/*
if(img1!=null || img1!="")
{
	img1="assets/images/"+m.getFilesystemName("img1");
	ps1.setString(12, img1);
}
if(img1==null || img1=="")
{
	String sql3="select img1 from photographer.photographerdetails  where Pid=?";
	PreparedStatement ps3=con.prepareStatement(sql3);
	ps3.setInt(1, id);
	ResultSet rs3=ps3.executeQuery();
	if(rs3.next())
	{
		ps1.setString(12,rs3.getString(1) );
	}
}
	*/

img2=m.getFilesystemName("img2");
System.out.println("Image-2 "+img2);

if(img2==null)
{	
	String img222=m.getParameter("img12"); //id new file is not selected
	ps1.setString(13, img222);

}
else
{
	img2="assets/images/"+m.getFilesystemName("img2");
	ps1.setString(13, img2);

}


/*
if(img2!=null || img2!="")
{	
	img2="assets/images/"+m.getFilesystemName("img2");
	ps1.setString(13, img2);
}
if(img2==null || img2=="")
{
	String sql3="select img2 from photographer.photographerdetails  where Pid=?";
	PreparedStatement ps3=con.prepareStatement(sql3);
	ps3.setInt(1, id);
	ResultSet rs3=ps3.executeQuery();
	if(rs3.next())
	{
		ps1.setString(13,rs3.getString(1) );
	}
}
*/



img3=m.getFilesystemName("img3");
System.out.println("Image-3 "+img3);

if(img3==null)
{	
	String img333=m.getParameter("img13"); //id new file is not selected
	ps1.setString(14, img333);

}
else
{
	img3="assets/images/"+m.getFilesystemName("img3");
	ps1.setString(14, img3);

}


/*if(img3!=null || img3!="")
{	
	img3="assets/images/"+m.getFilesystemName("img3");
	ps1.setString(14, img3);
}
if(img3==null || img3=="")
{
	String sql4="select img3 from photographer.photographerdetails  where Pid=?";
	PreparedStatement ps4=con.prepareStatement(sql4);
	ps4.setInt(1, id);
	ResultSet rs4=ps4.executeQuery();
	if(rs4.next())
	{
		ps1.setString(14,rs4.getString(1) );
	}
}
*/


img4=m.getFilesystemName("img4");
//System.out.println("Image-4 "+img4);
if(img4==null)
{	
	String img444=m.getParameter("img14"); //id new file is not selected
	ps1.setString(15, img444);

}
else
{
	img4="assets/images/"+m.getFilesystemName("img4");
	ps1.setString(15, img4);

}

/*
//if(img4==null || img4=="")
{
	String sql5="select img4 from photographer.photographerdetails  where Pid=?";
	PreparedStatement ps5=con.prepareStatement(sql5);
	ps5.setInt(1, id);
	ResultSet rs5=ps5.executeQuery();
	if(rs5.next())
	{
		ps1.setString(15,rs5.getString(1) );
	}
}

*/
ps1.setString(16, fbid);
ps1.setString(17, instaid);
ps1.setString(18, speciality);
ps1.setInt(19, id);

int count=ps1.executeUpdate();
if(count>0)
{	
	%>

	<script>
		 alert("Profile Updated successfully..!!");
		 location.href="MyProfile.jsp?id="+<%= id %>;
		 </script>

	<% 
	
}
else
{

	%>
	<script>
	 alert("Technical error..!!");
	 location.href="InsertUpdatedProfileDetails.jsp?id="+<%=id %>;
	 </script>
	<%}

}
catch(Exception e) {
e.printStackTrace();
}
%>



</body>
</html>
