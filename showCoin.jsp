

<%@page import="java.util.*" %><%@page import="MyPack.*" %> 

<html>
<link rel="stylesheet" href="navstyle.css">
<link rel="stylesheet" href="table.css">

	<style>
body {
  background-color: black;
}
.col{
	color:white;
}
</style>
<body>
<nav>     
  <div>
  <ul>
  <li><a href="index.jsp">Home</a></li>
  <li><a  href="addCoin.jsp">Add Coin</a></li>
  <li><a class="active" href="searchCoin.jsp">Search Coin</a></li>
  <li><a href="vote.jsp">Vote Coin</a></li>
  </ul>
</div>
</nav><center> 

<h2 class="col"> Coin List </h2> 
<h3 class="col"> Following results meet your search criteria</h3> 
<div class="w3-container">
<TABLE BORDER="1" style="margin: auto;width: 90%;" class="w3-table-all w3-hoverable"> 

<TR class="w3-light-grey"> 
 <TH> Name </TH> 
 <TH> Network </TH> 
 <TH> Market Value </TH> 
 <TH> Vote </TH> 

</TR> 

<% 
 ArrayList coinList = (ArrayList)request.getAttribute("list"); 
 coinInfo coin = null; 

for(int i=0; i<coinList.size(); i++) { 
coin = (coinInfo)coinList.get(i); %> 


<TR> <TD> <%= coin.getName()%> </TD>
<TD> <%= coin.getNetwork()%> </TD>
<TD> <%= coin.getMarketValue()%> </TD> 
<TD> <%= coin.getVote()%> </TD> 

</TR> 

<% 
} 
%> 

</TABLE > 

</div>

<h4><a href="Controller?action=addCoin"> Add Coin </a>
<a href="Controller?action=searchCoin">Search Coin</a></h4> 
</center> </body></html> 

