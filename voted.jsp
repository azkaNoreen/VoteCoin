<%@page errorPage="error.jsp" %> 

<html>
<link rel="stylesheet" href="navstyle.css">
	<style>
body {
  background-color: black;
}
</style>
<link rel="stylesheet" href="navstyle2.css">
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
<center> 
<%if((String)request.getAttribute("errorid")=="alreadyVoteError") {
	 %>
<h1 style="color:white" > you've already voted! </h1>
<%}else{%>
<h3 style="color:white"> Your Vote has been added successfully!</h3> 
<% }%>
	<jsp:include page="showAll.jsp" />

<h4>  <a href="index.jsp" > back To Home </a> </h4> 

</center></body></html> 
