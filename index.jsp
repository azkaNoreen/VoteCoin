<%@page import="java.util.*" %>
<%@page import="MyPack.*" %> 
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
<link rel="stylesheet" href="navstyle2.css">
  </head>

<body>

<%  String ve=(String)request.getAttribute("errorid");
 if(ve=="loginError" || ve== "voteError" || ve== "addError") {
	 RequestDispatcher rd = request.getRequestDispatcher("LogIn.jsp"); 
 rd.forward(request, response); }
	 else if(ve=="alreadyVoteError")
	 {RequestDispatcher rd = request.getRequestDispatcher("voted.jsp"); 
 rd.forward(request, response); }
else if(ve=="searchError"){
	 RequestDispatcher rd = request.getRequestDispatcher("searchCoin.jsp"); 
 rd.forward(request, response); 
} 
else if(ve=="voteCoinNFound"){
	 RequestDispatcher rd = request.getRequestDispatcher("vote.jsp"); 
 rd.forward(request, response); 
} 
else if(ve=="signUpError"){
	 RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp"); 
 rd.forward(request, response); 
} 
	 %>
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
 <%if((String)session.getAttribute("userId")!=null) {
	 %>
    <li><a href="#"> <%= (String)session.getAttribute("userId") %> </a></li> 

	<li><a href="Controller?action=Logout">Logout </a></li>
 <%
 } else{
 %> 
      <li><a href="LogIn.jsp"><span class="glyphicon glyphicon-user"></span>Login </a></li>
      <li><a href="SignUp.jsp"><span class="glyphicon glyphicon-log-in"></span> Sign Up</a></li>
<% } %>
    </ul>
  </div>
</nav>

	<jsp:include page="showAll.jsp" />
  </body>
</html>
