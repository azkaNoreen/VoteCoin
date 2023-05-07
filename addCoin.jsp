<%@ page session="true" %> 
<%@page errorPage="error.jsp" %> 

<!DOCTYPE html>

<html style="font-size: 16px;">
<head>
  <title>addCoin</title>
	<style>
body {
  background-color: black;
}
.col{
	color:white;
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
	<li  ><a href="index.jsp">Home</a></li>
	<li class="active"  ><a href="addCoin.jsp">Add Coin</a></li>
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
      <li><a href="LogIn.jsp"><span class="glyphicon glyphicon-user"></span> Login</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Sign Up</a></li>
<% } %>
    </ul>
  </div>
</nav>
  <form action="Controller" name="addCoin" class="for" style="width: 35%">
    <h1 id="txt" > Add Coin </h1>
    <label  id="txt">Name</label>
    <input type="text" style="width:340px" placeholder="Bitcoin" name="name" required="">
    <br> <br>
    <label  id="txt">Network</label>
    <select name="network" required="required" style="width:390px">
      <option value="Binance Smart Chain">Binance Smart Chain</option>
      <option value="Ethereum(ETH)">Ethereum(ETH)</option>
      <option value="Solana(SOL)">Solana(SOL)</option>
      <option value="Tron(TRX)">Tron(TRX)</option>
    </select>
    <br><br>
    <label  id="txt">Market Value</label>
    <input type="text" style="width:290px" placeholder="Market Value" name="MarketValue" required="">
    <br>
    <label id="txt">Description</label>
    <textarea placeholder="Description" rows="4" cols="45" name="message" required="" style="width: 384px; height: 99px;"></textarea>
    <br>
	    <br>

<div align=center>

    <input style="width:100px;height:40px;background-color:rgba(255, 179, 0, 0.883);border-radius:50px"
          type="submit" value="add" name="action">
    <br><br>
</div>
  </form>
		<jsp:include page="showAll.jsp" />

</body>

</html>