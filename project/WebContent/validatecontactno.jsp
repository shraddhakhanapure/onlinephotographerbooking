<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>JavaScript form validation - checking non-empty</title>
<link rel='stylesheet' href='form-style.css' type='text/css' />      

<style>
 li {list-style-type: none;
font-size: 16pt;
}
.mail {
margin: auto;
padding-top: 10px;
padding-bottom: 10px;
width: 400px;
background : 
#D8F1F8;
border: 1px soild 
silver;
}
.mail h2 {
margin-left: 38px;
}
input {
font-size: 20pt;
}
input:focus, textarea:focus{
background-color: 
lightyellow;
}
input submit {
font-size: 12pt;
}
.rq {
color: 
#FF0000;
font-size: 10pt;
}
</style>

<script>
function phonenumber(inputtxt)
{
  var phoneno = /(7|8|9)\d{9}$/;
  
  
  if(inputtxt.value.match(phoneno))
  {
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

<body onload='document.form1.text1.focus()'>
<div class="mail">
<h2>Input an Phone No.[xxxxxxxxxx] and Submit</h2>
<form name="form1" action="#">
<ul>
<li><input type='text' name='text1'/></li>
<li>&nbsp;</li>
<li class="submit"><input type="submit" name="submit" value="Submit" onclick="phonenumber(document.form1.text1)"/></li>
<li>&nbsp;</li>
</ul>
</form>
</div>
<script src="phoneno-all-numeric-validation.js"></script>
</body>

</html>
