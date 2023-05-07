//package MyBean;
package MyPack;

import java.sql.*;
import java.util.*;

public class coinDAO 
{
	private Connection con;
	public coinDAO() throws ClassNotFoundException,SQLException{
makeConnection(); 
} 

private void makeConnection() throws ClassNotFoundException,SQLException
{ 
Class.forName("com.mysql.jdbc.Driver"); 
String conUrl = "jdbc:mysql://127.0.0.1/project"; 
con = DriverManager.getConnection(conUrl,"root","root"); 
} 

public ArrayList searchCoin(String name){
	ArrayList coinList = new ArrayList(); 

try {	
	
	String sql = " SELECT * FROM coin WHERE name = ?"; 
	PreparedStatement pStmt = con.prepareStatement(sql); 
	pStmt.setString( 1, name); 

    //Statement st=con.createStatement();
    //System.out.println(name);
      
    ResultSet rs = pStmt.executeQuery(); 

    /*System.out.println("Aaab");
    if (rs.next( ) ) {
	    System.out.println("Aaa");
        String n = rs.getString("name");
        String net = rs.getString("network");
        String mv = rs.getString("marketValue");
        String d = rs.getString("description");
        coin = new coinInfo(n,net,mv,d);}*/
		
	String n; 
	String net; 
	String mv; 
	String d; 
	int v;
	while ( rs.next() ) { 
	n = rs.getString("name");
    net = rs.getString("network");
    mv = rs.getString("marketValue");
    d = rs.getString("description");
	v=rs.getInt("vote");

	coinInfo coinBean = new coinInfo(); 
	coinBean.setName(n); 
	coinBean.setNetwork(net); 
	coinBean.setMarketValue(mv); 
	coinBean.setDescription(d); 
	coinBean.setVote(v); 

	coinList.add(coinBean); }
}
catch(Exception ex){System.out.println(ex);}
		return coinList;

}
public int insertCoin(coinInfo coin){
//coinInfo stu = null;
int rs=0;
try {
   	//System.out.println("You  the exam."+e+pass+n+ph);
	String fn=coin.getName(); 
	String ln=coin.getNetwork(); 
	String un=coin.getMarketValue(); 
	String e=coin.getDescription();
	//int v=coin.getVote(); 	

	Statement st=con.createStatement();
   String query = "INSERT INTO coin(name,network,marketValue,description,vote)VALUES('"+ fn + "','" + ln+ "','"+un+ "','" +e+"','" +0+"') ";
    System.out.println("<h1>Record inserted."+fn+ln+un+e+"</h1");

    rs= st.executeUpdate( query );
	
}
catch(SQLException cp){
  //out.println("Duplicate coinname, please enter new one ");
  System.out.println("Duplicate coinname, please enter new one ");
  }
  catch(Exception ex){System.out.println(ex);}
return rs;
}
public ArrayList retrieveAll()throws SQLException 
{
	ArrayList coinList=new ArrayList();
	try {
	
	String sql = " SELECT * FROM coin ORDER BY vote DESC"; 
	PreparedStatement pStmt = con.prepareStatement(sql); 
    //Statement st=con.createStatement();
    //System.out.println(name);
      
    ResultSet rs = pStmt.executeQuery(); 
	String n; 
	String net; 
	String mv; 
	String d; 
	int v;
	while ( rs.next() ) { 
	n = rs.getString("name");
    net = rs.getString("network");
    mv = rs.getString("marketValue");
    d = rs.getString("description");
	v = rs.getInt("Vote");


	coinInfo coinBean = new coinInfo(); 
	coinBean.setName(n); 
	coinBean.setNetwork(net); 
	coinBean.setMarketValue(mv); 
	coinBean.setDescription(d); 
	coinBean.setVote(v);
    coinList.add(coinBean); }
	}catch(SQLException cp){
  //out.println("Duplicate coinname, please enter new one ");
  System.out.println("Duplicate coinname, please enter new one ");
  }
  catch(Exception ex){System.out.println(ex);}
  	return coinList;

}
public int voteCoin(String name)throws SQLException 
{
	int r=0;
	try {
		String sql = " UPDATE coin SET vote=vote+1 where name= ?"; 
	PreparedStatement pStmt = con.prepareStatement(sql); 
	pStmt.setString( 1, name);
	
	 r = pStmt.executeUpdate(); 
		//UPDATE coin SET vote = vote + 1 WHERE NAME="azka"
	}
	catch(SQLException cp){
  //out.println("Duplicate coinname, please enter new one ");
  System.out.println("Duplicate coinname, please enter new one ");
  }
  catch(Exception ex){System.out.println(ex);}
  	return r;	

}

/*public static void main(String[] args) throws Exception {
	coinDAO personDAO = new coinDAO();
	int r=personDAO.insertPerson("aa","bb","a","d");
	//r=1?(System.out.println("no" )):(System.out.println("nooo" ));
	
	String result = (r> 1) ? "pass" : "fail";

    System.out.println("You " + result + " the exam.");


	
	
}*/
}//ends