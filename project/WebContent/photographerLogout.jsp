
<%

HttpSession s1=request.getSession();  
s1.invalidate();  
%>
			<script>
			 alert("You are successfully logged out!");
			 location.href="index.jsp";
			 </script>
