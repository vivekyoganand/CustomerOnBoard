
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="bean.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
</head>
<body background="<%=request.getContextPath()%>/images/bg1.jpeg" style="align:center;width=100%;height=100%; background-repeat: no-repeat;">
<script>

function formValidation()  
{  
var Name = document.registration.Name;  
var Uname = document.registration.Uname;  
var Email = document.registration.Email;  
var Company = document.registration.Company;  
var Password = document.registration.Password;  

if(PasswordValidation(Password,7,12))  
{  
 
if(ValidateEmail(Email))  
{  

}  
}  
return false;  
}  

function PasswordValidation(Password,mx,my)  
{  
var passid_len = Password.value.length;  
if (passid_len == 0 ||passid_len >= my || passid_len < mx)  
{  
alert("Password should not be empty / length be between "+mx+" to "+my);  
Password.focus();  
return false;  
}  
return true;  
} 





function ValidateEmail(Email)  
{  
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
if(Email.value.match(mailformat))  
{  
return true;  
}  
else  
{  
alert("You have entered an invalid email address!");  
Email.focus();  
return false;  
}  
} 

</script>


<!-- <form action = "process.jsp" onsubmit="formValidation()"> -->
<form onsubmit="return formValidation()" method="post" action="process.jsp">
<table>

<tr>
		</td>
			
			
			<td align="left"></td>
			<td align="center" ></td>
			
			 <td align="right" >  <img
					  alt="CSC Logo"
					src="<%=request.getContextPath()%>/images/CSC_logo.png"
					border="0" style="height: 80px ; width: 150px ; position: fixed; top: 0px; left: 30px; "/>   </td>   
		</tr> 


</table>


<table>

<tr>
		

		
			</td>
			
			
			<td align="left"></td>
			<td align="center" ></td>
			
			 <td align="right" >  <img
					  alt="Agility Platform Logo"
					src="<%=request.getContextPath()%>/images/AP.png"
					border="0" style="height: 80px ; width: 150px ; position: fixed; bottom: 0px; right: 10px; "/>   </td>   
		</tr> 


</table>

<table align="center" >


<td align="center"></td>
			<td align="center" ></td>

 
<tr><td><font color=tan size=4 face="Verdana">NAME :   </font>    </td><td>  <input type="text" name="Name"   onclick="this.value=''"/></td>
</tr>  <tr><td><font color=tan size=4 face="Verdana">USER NAME :    </font>  </td><td>  <input type="text" name="Uname"  onclick="this.value=''"/></td></tr>

<tr><td><font color=tan size=4 face="Verdana">EMAIL :     </font> </td><td>  <input type="text" name="Email"  onclick="this.value=''"/></td></tr>
<tr><td><font color=tan size=4 face="Verdana">COMPANY :    </font></td><td>  <input type="text" name="Company"  onclick="this.value=''"/></td></tr>
<tr><td><font color=tan size=4 face="Verdana">PASSWORD :   </font></td><td>  <input type="password" name="Password"   onclick="this.value=''"/></td></tr>
<!-- <tr><td><font color=tan size=4 face="Verdana">CREATION DATE :</font></td><td><input type="text" name="CreationDate"  onclick="this.value=''"/></td></tr> -->
<!--  <tr><td><font color=tan size=4 face="Verdana">CREATION TIME :</font></td><td><input type="text" name="CreationTime"  onclick="this.value=''"/></td></tr> -->
</table>


<table align = "center">

<tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr><br>
                   
                   
                   
                    <tr>
                        <td colspan="2"><font color=cornsilk size=4 face="Verdana">Already registered? <a href="index1.jsp">Login Here</a></td>
                    </tr>
                    
                    
                    

</table>
<br>
</form>  

</body>
</html>