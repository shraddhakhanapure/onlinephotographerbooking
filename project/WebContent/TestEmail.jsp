<!DOCTYPE html> 
<html> 
  
<head> 
  <title>Send Mail</title> 
  <script src="https://smtpjs.com/v3/smtp.js"> </script> 
  
  <script type="text/javascript"> 
    function sendEmail() { 
      Email.send({ 
        Host: "smtp.gmail.com", 
        Username: "angular.python123@gmail.com", 
        Password: "Python@123", 
        To: 'suraj.jidge8483@gmail.com', 
        From: "angular.python123@gmail.com", 
        Subject: "Sending Email using javascript", 
        Body: "Well that was easy!!", 
      }) 
        .then(function (message) { 
          alert("mail sent successfully") 
        }); 
    } 
  </script> 
</head> 
  
<body> 
  <form method="post"> 
    <input type="button" value="Send Email" onclick="sendEmail()" /> 
  </form> 
</body> 
  
</html> 