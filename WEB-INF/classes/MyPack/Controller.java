package MyPack;

import java.io.*;
import java.sql.*;
import java.util.*; 
import javax.servlet.*;
import javax.servlet.http.*; 
public class Controller extends HttpServlet { 


// This method only calls processRequest() 

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws 
ServletException, IOException { 
processRequest(request, response); 
} 

// This method only calls processRequest() 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
ServletException, IOException { 
processRequest(request, response); 
} 

protected void processRequest(HttpServletRequest request, 
HttpServletResponse response) throws ServletException, IOException {

 
// retrieving value of action parameter 
String userAction = request.getParameter("action"); 
	System.out.println("aaaaaaassssssssssssssa");

// if request comes to move to addperson.jsp from hyperlink 
if (userAction.equals("addCoin") ) { 
response.sendRedirect("addCoin.jsp"); 
}
// if request comes to move to searchperson.jsp from hyperlink 
else if (userAction.equals("searchCoin")) { 
response.sendRedirect("searchCoin.jsp"); 
}
 
// if button clicked on 
if (userAction.equals("add"))
{ addCoin(request,response); }
else if (userAction.equals("search")) 
{  searchCoin(request,response); } 
else if (userAction.equals("vote"))
{	voteCoin(request,response);
} 
else if(userAction.equals("login"))
{
	login(request,response);
}
else if(userAction.equals("Logout"))// end processRequest() 
{
	logout(request,response);
}
else if(userAction.equals("signUp"))// end processRequest() 
{
	signup(request,response);
}
}

private void addCoin(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException 
{ try 

{
 coinDAO coindao = new coinDAO(); 

 coinInfo coin = new coinInfo();
 
 String name=request.getParameter("name");
 coin.setName(name); 
 
 String net=request.getParameter("network");
 coin.setNetwork(net);

 String mv=request.getParameter("MarketValue");
 coin.setMarketValue(mv);

 String m=request.getParameter("message");
 coin.setDescription(m); 

 coin.setVote(0); //initially vite is 0


 HttpSession session= request.getSession(false);
if((String)session.getAttribute("userId")!=null) {
	 coindao.insertCoin(coin); 
	 RequestDispatcher rd = request.getRequestDispatcher("saved.jsp"); 
 rd.forward(request, response); 
}
else{
	request.setAttribute("errorid","addError");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?"); 
	rd.forward(request, response); 
}
}catch (SQLException sqlex){ 

//setting SQLException instance 
request.setAttribute("javax.servlet.jsp.JspException" , sqlex);
RequestDispatcher rd = request.getRequestDispatcher("error.jsp"); 
rd.forward(request, response); 
} 

catch (ClassNotFoundException cnfe){ 

 // setting ClassNotFoundException instance 
request.setAttribute("javax.servlet.jsp.JspException" , cnfe); 
RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
rd.forward(request,response); 
} 

}// end addperson() 

private void searchCoin(HttpServletRequest request, 
HttpServletResponse response) throws ServletException, IOException { 
try {

coinDAO coindao = new coinDAO(); 

coinInfo coin = new coinInfo();

String pName = request.getParameter("name"); 

ArrayList coinList = coindao.searchCoin(pName); 
request.setAttribute("list", coinList); 

if(!(coinList.isEmpty())){
 RequestDispatcher rd = request.getRequestDispatcher("showCoin.jsp"); 
rd.forward(request, response); }
else{
	request.setAttribute("errorid","searchError");
 RequestDispatcher rd = request.getRequestDispatcher("index.jsp"); 
rd.forward(request, response); 
}}catch (SQLException sqlex){ 

// setting SQLException instance 
request.setAttribute("javax.servlet.jsp.JspException" , sqlex);
RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
rd.forward(request,response); 

}catch (ClassNotFoundException cnfe){ 

 // setting ClassNotFoundException instance request.setAttribute("javax.servlet.jsp.JspException" , cnfe); 
RequestDispatcher rd = request.getRequestDispatcher("error.jsp"); 
rd.forward(request, response); 


} 
}
private void voteCoin(HttpServletRequest request, 
HttpServletResponse response) throws ServletException, IOException { 
try {

coinDAO coindao = new coinDAO(); 

coinInfo coin = new coinInfo();

String pName = request.getParameter("name"); 
HttpSession session= request.getSession(false);
if((String)session.getAttribute("userId")!=null && (String)session.getAttribute("voted")!="yes") {
	int res = coindao.voteCoin(pName); 
	if(res!=0){
	session.setAttribute("voted","yes");
	RequestDispatcher rd = request.getRequestDispatcher("voted.jsp");
	rd.forward(request, response); 
	}
	else
	{
		request.setAttribute("errorid","voteCoinNFound");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	rd.forward(request, response); 
	}
}else if((String)session.getAttribute("voted")=="yes"){
	request.setAttribute("errorid","alreadyVoteError");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?"); 
	rd.forward(request, response); 
}

else{
	request.setAttribute("errorid","voteError");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?"); 
	rd.forward(request, response); 
}


}catch (SQLException sqlex){ 

// setting SQLException instance 
request.setAttribute("javax.servlet.jsp.JspException" , sqlex);
RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
rd.forward(request,response); 

}catch (ClassNotFoundException cnfe){ 

 // setting ClassNotFoundException instance request.setAttribute("javax.servlet.jsp.JspException" , cnfe); 
RequestDispatcher rd = request.getRequestDispatcher("error.jsp"); 
rd.forward(request, response); 
} 
}
private void login(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException 
{
	
try 
{
	userDAO userdao = new userDAO(); 
	userInfo user = new userInfo();	
	String Uname=request.getParameter("uname");
	String pass=request.getParameter("Password");
	user=userdao.loginPerson(Uname,pass);
	if(user!=null)
	{
   HttpSession session= request.getSession();
   session.setAttribute("userId", Uname);
	RequestDispatcher rd = request.getRequestDispatcher("index.jsp"); 
	rd.forward(request, response); 
	}else{
		request.setAttribute("errorid","loginError");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?"); 
	rd.forward(request, response); 
	}
 
}catch (SQLException sqlex){ 

// setting SQLException instance 
request.setAttribute("javax.servlet.jsp.JspException" , sqlex);
RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
rd.forward(request,response); 
}catch (ClassNotFoundException cnfe){ 

 // setting ClassNotFoundException instance request.setAttribute("javax.servlet.jsp.JspException" , cnfe); 
RequestDispatcher rd = request.getRequestDispatcher("error.jsp"); 
rd.forward(request, response); 
}
}
private void signup(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException 
{
try 
{
	userDAO userdao = new userDAO(); 
	userInfo user = new userInfo();	
	String Fname=request.getParameter("fname");
String Lname=request.getParameter("lname");
String Uname=request.getParameter("uname");
String Ename=request.getParameter("ename");
String Pass=request.getParameter("pass");
String p=request.getParameter("phoned").substring(1)+request.getParameter("phone");
Long Phone=Long.parseLong(p);
String Gender=request.getParameter("gen");

user.setFirstName(Fname);
user.setLastName(Lname);
user.setUserName(Uname);
user.setEmail(Ename);
user.setPassword(Pass);
user.setPhone(Phone);
user.setGender(Gender);

System.out.println(Fname+Lname+Ename+Pass+Phone+Gender+Uname);
	int r=userdao.insertPerson(user);
	if(r!=0)
	{
   HttpSession session= request.getSession();
 session.setAttribute("userId", Uname);
	RequestDispatcher rd = request.getRequestDispatcher("index.jsp"); 
	rd.forward(request, response); 
	}else{
		request.setAttribute("errorid","signUpError");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?"); 
	rd.forward(request, response); 
	}
 
}catch (SQLException sqlex){ 

// setting SQLException instance 
request.setAttribute("javax.servlet.jsp.JspException" , sqlex);
RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
rd.forward(request,response); 
}catch (ClassNotFoundException cnfe){ 

 // setting ClassNotFoundException instance 
request.setAttribute("javax.servlet.jsp.JspException" , cnfe); 
RequestDispatcher rd = request.getRequestDispatcher("error.jsp"); 
rd.forward(request, response); 
}} 
private void logout(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException 
{
	//System.out.println("aaaaaaaa");
	request.getSession().invalidate();
    response.sendRedirect("index.jsp");
	  //out.print("You are successfully logged out!"); 
} 
} // end ControllerServlet 