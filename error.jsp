<%@page import="java.util.*" %>
<%@page import="MyPack.*" %> 
<%@ page session="true" %> 
<%@page isErrorPage="true" %> 
<%@page import = "java.sql.SQLException" %> 

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
<link rel="stylesheet" href="navstyle2.css">
  </head>

<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Vote Coin</a>
    </div>
    <ul class="nav navbar-nav">
	<li class="active"  ><a href="index.jsp">Home</a></li>
	<li><a href="addCoin.jsp">Add Coin</a></li>
	<li><a  href="searchCoin.jsp">Search Coin</a></li>
    <li><a  href="vote.jsp">Vote Coin</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right"> 
      <li><a href="LogIn.jsp"><span class="glyphicon glyphicon-user"></span>Login </a></li>
      <li><a href="SignUp.jsp"><span class="glyphicon glyphicon-log-in"></span> Sign Up</a></li>
    </ul>
  </div>
</nav>
<!-- <h1> Duplicate userName!</h1> -->
<h3> 
<% if (exception instanceof SQLException) { %> 

An SQL Exception 

<% } else if (exception instanceof ClassNotFoundException){ %> 

A Class Not Found Exception 

<%} else { %> 
A Exception 

<% } %> 


occured while interacting with the database</h3> 

<h3 > Please Try Again Later! </h3> 
	
  </body>
</html>
