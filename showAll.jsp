<%@page import="java.util.*" %>
<%@page import="MyPack.*" %>
<%@page errorPage="error.jsp" %> 

<html>
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
<center> 

<h2 class="col" > Coin List </h2> 
<div class="w3-container">
<TABLE BORDER="1" style="margin: auto;width: 90%;" class="w3-table-all w3-hoverable"> 

<TR class="w3-light-grey"> 
 <TH> Name </TH> 
 <TH> Network </TH> 
 <TH> Market Value </TH> 
 <TH> Votes </TH> 

</TR> 

<% 
 coinDAO coindao= new coinDAO();
	ArrayList coinList=coindao.retrieveAll();
	coinInfo coin=null;

for(int i=0; i<coinList.size(); i++) { 
coin = (coinInfo)coinList.get(i); %> 


<TR> <TD> <%= coin.getName()%> </TD>
<TD> <%= coin.getNetwork()%> </TD>
<TD> <%= coin.getMarketValue()%> </TD> 
<TD><%= coin.getVote()%></TD> 

</TR> 

<% 
}
%> 

</TABLE > 
</div>
</center> </body></html> 

