<%@ page session="true" %> 
<%@page errorPage="error.jsp" %> 


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
		<style>
body {
  background-color: black;
}
</style>
<link rel="stylesheet" href="navstyle2.css">
<link rel="stylesheet" href="formstyle.css">
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
	<li class="active"  ><a  href="searchCoin.jsp">Search Coin</a></li>
    <li><a  href="vote.jsp">Vote Coin</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
 <%if((String)session.getAttribute("userId")!=null) {
	 %>
        <li><a href="#"> <%= (String)session.getAttribute("userId") %> </a></li>

	<li><a href="Controller?action=Logout">Logout </a></li>
 <%
 } else{
 %> 
      <li><a href="LogIn.jsp"><span class="glyphicon glyphicon-user"></span> Login</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Sign Up</a></li>
<% } %>
    </ul>
  </div>
</nav>
<div align=center>
<%if((String)request.getAttribute("errorid")=="searchError") {
	 %>
<h1 style="color:white"> Coin doesn't exist!</h1>
<%}%>
    <form action="Controller" name=search  class="for">
        <h1 id="txt"> Search </h1>
         <label id="txt">Coin Name</label> <input type="text" name="name"><br><br>
        <input style="width:100px;height:40px;background-color:rgba(255, 179, 0, 0.883);border-radius:50px"
        type="submit" value="search" name="action">
    </form>
	</div>
		<jsp:include page="showAll.jsp" />

</body>
</html>