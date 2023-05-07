<html>

<head>
    <title>Sign Up</title>
    <script>
    function validate()
{	

    //alert("Last name is empty!!");			

	if ( document.SignUp.fname.value == "" )
	    {
			alert("First name is empty!!");			
			return false;
	    }
    if ( document.SignUp.lname.value == "" )
	    {
			alert("Last name is empty!!");			
			return false;
	    }
    if ( document.SignUp.uname.value == "" )
	    {
			alert("User name is empty!!");			
			return false;
	    }
    if ( document.SignUp.ename.value == "" )
	    {
			alert("Email is empty!!");			
			return false;
	    }
    if ( document.SignUp.ename.value != "" )		
        {
		let mail=SignUp.ename.value;
		let count=0;
		//alert(mail)
		for(let i=0;i<mail.length;i++)
		{
		if(mail.charAt(i)=='@')
		count+=1;
		}
		if(count==1)
		{
		if(mail.indexOf('.')<mail.indexOf('@'))
		{
		let m=mail.split('@');
		if(m[1].indexOf('.')>0)
		alert("Good");
		}else if(mail.indexOf('@')<0)
		alert("BAd");
		else if(mail.indexOf('.')>mail.indexOf('@'))
		{
	    if(mail.indexOf('@')>0 && mail.indexOf('.')>mail.indexOf('@')+1)
		alert("Good");
		}
		else
		alert("BAd1111");}
		else
		alert("Worst");
	}	
	if(document.SignUp.pass.value == "")	
	   {
			alert("password is empty!!");
			document.SignUp.pass.focus();
			return false;
	   }	

	if(document.SignUp.pass.value!=document.SignUp.conpass.value)
	{
			alert("New Password and Confirm new Password doesnt match");
			document.SignUp.conpass.focus();
			return false;
	}
    var phoneno = /\d{10}/;
	if (!( document.SignUp.phone.value.match(phoneno)))
	 {
        alert("Please enter valid phone number");
        return false;
        } 
        var geno = /\w{7}/;


	if ( document.SignUp.gen.value.match(geno)) 
	{	
			alert("Please enter valid Genter");
			return false;
	}
    	return true;

}
</script>
	<link rel="stylesheet" href="formstyle.css">

</head>

<body>
<%if((String)request.getAttribute("errorid")=="loginError") {
	 %>
<h1>Could nont signing ,please try later!</h1>
<%}%>
<div align=center>
<form action="Controller" name=Login class="for">
    <!-- <div align="center" style="padding-top: 45px;border: 1px solid purple;"> -->
        <h1 id="txt"> Sign Up </h1>

        <input style="width:198px" type="text" name="fname" placeholder="First Name">
        <input style="width:198px" type="text" name="lname" placeholder="Last Name">
    <br><br>
        <input style="width:400px" type="text" name="uname" placeholder="UserName">
        <br><br>
        <input style="width:400px" type="text" name="ename"
            placeholder="Email Address                               @yahoo.com">
            <br><br>

        <input style="width:400px" type="password" name="pass" placeholder="Password">
        <br><br>
        <input style="width:400px" type="password" name="conpass" placeholder="Confirm Password">
        <br><br>
        <select name="phoned" style="width:50px">
            <option value="+1">+1</option>
            <option value="+2">+2</option>
            <option value="+3">+3</option>
            <option value="+4">+4</option>
            <option value="+92">+92</option>

        </select>
        <input style="width:346px" type="text" name="phone" placeholder="Mobile Phone Number">
    <br><br>

    <input style="width:400px" type="text" name="gen" placeholder="Gender(Optional)">
    <br>
    <h4 id="txt">By clicking "Continue" you agree to the <font id="txt">Terms</font>
    <br id="txt" >and <font id="txt">Privacy Policy </font></h4>
    
    <input style="width:400px;height:40px;background-color:rgba(255, 179, 0, 0.883);border-radius:50px"
                type="submit" value="signUp" name="action" onclick="return validate()">
    </div>
 </form>
 </div>
</body>

</html>