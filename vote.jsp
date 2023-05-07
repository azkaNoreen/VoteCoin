<%@ page session="true" %> 
<%@page errorPage="error.jsp" %> 

<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <title>Vote Coin</title>
	<style>
body {
  background-color: black;
}
.col{
	color:white;
}
</style>
<link rel="stylesheet" href="formstyle.css">
<link rel="stylesheet" href="navstyle2.css">
  </head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Vote Coin</a>
    </div>
    <ul class="nav navbar-nav">
	<li><a href="index.jsp">Home</a></li>
	<li><a href="addCoin.jsp">Add Coin</a></li>
	<li><a  href="searchCoin.jsp">Search Coin</a></li>
    <li class="active" ><a  href="vote.jsp">Vote Coin</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
 <%if((String)session.getAttribute("userId")!=null) {
	 %>
    <li><a href="#"> <%= (String)session.getAttribute("userId") %> </a></li>

	<li><a href="Controller?action=Logout">Logout </a></li>

 <%
 } else{
 %> 
      <li><a href="LogIn.jsp" ><span class="glyphicon glyphicon-user"></span> Login</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Sign Up</a></li>
<% } %>
    </ul>
  </div>
</nav>
<div align=center>
<%if((String)request.getAttribute("errorid")=="voteCoinNFound") {
	 %>
<h1 style="color:white"> Vote Coin doesn't exist!</h1>
<%}%>
<form action="Controller" name="voteCoin" class="for">
    <label  class="col">Name of coin you want to vote:</label><br>
    <input type="text" style="width:340px" placeholder="Bitcoin" name="name" required="">
    <br> <br>
 <input style="width:100px;height:40px;background-color:rgba(255, 179, 0, 0.883);border-radius:50px"
         type="submit" value="vote" name="action">
  </form>
</div>
	<jsp:include page="showAll.jsp" />




 </body>
</html>
