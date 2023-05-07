package MyPack;

import java.sql.*;
import java.util.*;

public class userDAO {
	private Connection con;
	public userDAO() throws ClassNotFoundException,SQLException{
makeConnection(); 
} 
private void makeConnection() throws ClassNotFoundException,SQLException
{ 
Class.forName("com.mysql.jdbc.Driver"); 
String conUrl = "jdbc:mysql://127.0.0.1/project"; 
con = DriverManager.getConnection(conUrl,"root","root"); 
} 
public userInfo loginPerson(String Uname,String password){
userInfo person = null;
try {	
    
	Statement st=con.createStatement();
    System.out.println(Uname);
    System.out.println(password);
     
    String query = "Select * from data where UserName='"+Uname+"' and Password='"+password+"'";
 
    ResultSet rs = st.executeQuery( query );
    System.out.println("Aaab");
    if (rs.next( ) ) {
	    System.out.println("Aaa");
        String fn = rs.getString("FirstName");
        String ln = rs.getString("LastName");
        String un = rs.getString("UserName");
        String e = rs.getString("Email");
        String pass = rs.getString("Password");
        Long ph = rs.getLong("Phone");
        String g = rs.getString("Gender");

 
        person = new userInfo(fn,ln,un,e,pass,ph,g);}
    con.close();
}catch(Exception ex){System.out.println(ex);}
return person;
}
public int insertPerson(userInfo user)throws ClassNotFoundException,SQLException{
  //Long ph,	String g){
	   
		   int rs=0;

        
	//System.out.println("You  the exam."+e+pass+n+ph);
	Statement st=con.createStatement();
	String f=user.getFirstName();
	String l=user.getLastName();
	String u=user.getUserName() ;
	String e=user.getEmail();
	String p=user.getPassword();
	String g=user.getGender();
	Long ph=user.getPhone();
	System.out.println(f+l+u+e+p+g+ph);

   String query = "INSERT INTO data(FirstName,LastName,Email,Password,Phone,Gender,UserName)VALUES('"+ f + "','" + l+ "','"+e+ "','" +p+"','"+ph+"','"+g+"','"+u+"') ";

    rs= st.executeUpdate( query );
	System.out.println(rs);

con.close();

/*8catch(SQLException cp){
  //out.println("Duplicate Username, please enter new one ");
  System.out.println("Duplicate Username, please enter new one ");
  }
  catch(Exception ex){System.out.println(ex);}*/
return rs;
}
}//ends