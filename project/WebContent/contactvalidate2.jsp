<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
function phonenumber(inputtxt)
{
  var phoneno = /(7|8|9)\d{9}$/;
  
  if(inputtxt.value.match(phoneno))
  {
	  alert(" valid Phone Number");
	   
      return true;
  }
  else
  {
     alert("Not a valid Phone Number");
     return false;
  }
  }

</script>

</head>
<body>

<h1>Display a Telephone Input Field</h1>

<form action="#" name="form1">
  <label for="phone">Enter a phone number:</label><br><br>
  <input type="tel" id="phone" name='text1' placeholder="98xxxxxxxx" pattern="(7|8|9)\d{9}" required><br><br>
  <small>Format: 9875641230</small><br><br>
  <input type="submit" name="submit" value="Submit"  onclick="phonenumber(document.form1.text1)">
</form>

</body>
</html>

