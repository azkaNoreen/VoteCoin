package MyPack;

public class userInfo {
private String FirstName;
private	String LastName;
private String UserName;
private	String Email;
private	String Password; 
private	Long Phone; 
private	String Gender; 

public userInfo() { 
} 
public userInfo(String fn,String ln,String un,String e,String pass,
   Long ph,	String g)
{
    FirstName = fn;
	LastName = ln;
	Email = e;
	Password =pass; 
	Phone= ph;
	Gender=g;
	UserName=un;
}
public void setFirstName(String n){ 
FirstName = n; }
public void setLastName(String ne){ 
LastName = ne; }
public void setUserName(String na){ 
UserName = na; }
public void setEmail(String naw){ 
Email = naw; }
public void setPassword(String pa){ 
Password = pa; }
public void setPhone(Long ph){ 
Phone = ph; }
public void setGender(String g){ 
Gender = g; }


public String getFirstName( ){ 
return FirstName;} 
public String getLastName( ){ 
return LastName;}
public String getUserName( ){ 
return UserName;}
public String getEmail( ){ 
return Email;}  
public String getPassword( ){ 
return Password;}
public Long getPhone( ){ 
return Phone;}
public String getGender( ){ 
return Gender;}









public String toString( ){

return "FirstName:" + FirstName + "LastName:" + LastName + " User Name:" + UserName + "Phone: "+Phone;}

}