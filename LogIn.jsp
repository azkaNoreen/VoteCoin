<!DOCTYPE html>
<%@ page session="true" %> 
<%@page errorPage="error.jsp" %> 

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In</title>
    <script>
        function validate(){
            if(Login.uname.value=="")
			{
            alert("Please enter Login ID.");
			// return false;
			}
            if(Login.Password.value=="")
			{
            alert("Please enter Password");
			return false;
			}
            return true;
        }
        function ses()
        {
        var r=document.getElementById("uname").value;
        session.setAttribute("uname",r);
        }
    </script>
	<link rel="stylesheet" href="formstyle.css">

</head>
<body>
<div align=center>

    <form action="Controller" name=Login class="for" >
        <h1 id="txt" > LogIn </h1>
         <label id="txt">UserName:</label> <input type="text" name="uname" onblur=ses()><br><br>
        <label id="txt">Password:</label> <input type="text" name="Password" ><br><br>
        <input style="width:100px;height:40px;background-color:rgba(255, 179, 0, 0.883);border-radius:50px"
        type="submit" value="login" name="action" onclick="return validate()">
    </form>
<%if((String)request.getAttribute("errorid")=="loginError") {
	 %>
<h1> InValid user name or Password</h1>
<%}%>
<%if((String)request.getAttribute("errorid")=="voteError") {
	 %>
<h1>please login to vote!</h1>
<%}%>
<%if((String)request.getAttribute("errorid")=="addError") {
	 %>
<h1>please login to add Coin!</h1>
<%}%>

	</div>
</body>
</html>