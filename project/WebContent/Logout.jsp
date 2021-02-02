
<%

HttpSession s=request.getSession();  
s.invalidate();  
%>
			<script>
			 alert("You are successfully logged out!");
			 location.href="index.jsp";
			 </script>
