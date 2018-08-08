 <%@ page language="java" import="java.util.*" %> 

<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="bean.*" %>
<%@ page language="java" import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
</head>
<body>
<form action="end.jsp">
<table style=width:"100%">
<!--  <tr><th colspan="10">QUESTION NO. :</th><th colspan="30">SECTION</th><th colspan="150">ANSWER</th></tr>-->
<table>

<%
Test t= new Test();
Map map = new HashMap();
Connection cx = t.getConnection();
ResultSet rs = t.getQuestions1(cx);


 String os = "Operating System";
String dc = "Datacenter";
String vir = "Virtualization";
String ag = "Agility";
String app = "Application Development";
String inf = "Infrastructure";
String nw = "Network";
String aut = "Authentication and Authorisation";  

 




Map os1 = new HashMap();
Map dc1 = new HashMap();
Map vir1 = new HashMap();
Map ag1 = new HashMap();
Map app1 = new HashMap();
Map inf1 = new HashMap();
Map nw1 = new HashMap();
Map aut1 = new HashMap();




int i = 1;

while (rs.next())
{

	String str = (String)rs.getString(2);
	
	
	if(rs.getString(2).equals(os))
	{
		os1.put(rs.getString(1), rs.getString(3));
	

	      }
		
		else if(rs.getString(2).equals(dc))
		{
			dc1.put(rs.getString(1),rs.getString(3));
			
		
		
		}
	
	
		else if(rs.getString(2).equals(vir))
		{
			vir1.put(rs.getString(1),rs.getString(3));
		
		
		}
	
		else if(rs.getString(2).equals(ag))
		{
			ag1.put(rs.getString(1),rs.getString(3));
			

		
		}
	
		else if(rs.getString(2).equals(app))
		{
			app1.put(rs.getString(1),rs.getString(3));
			
		
		}
	
		else if(rs.getString(2).equals(inf))
		{
			inf1.put(rs.getString(1),rs.getString(3));
	
		
		}
	
		else if(rs.getString(2).equals(nw))
		{
			nw1.put(rs.getString(1),rs.getString(3));
	
		}
	
	
		else if(rs.getString(2).equals(aut))
		{
			aut1.put(rs.getString(1),rs.getString(3));
	
		}
	
		
	}

i=1;
%>
<table><tr>
<h3>Operating System</h3></tr>
<tr>
<% 

Iterator<Map.Entry<String, String>> iterator = os1.entrySet().iterator() ;
while(iterator.hasNext()){
	
	//sMap.Entry<String, String> osEntry = iterator.next();
	
    Map.Entry<String, String> osEntry = iterator.next();
    //System.out.println(studentEntry.getKey() +" :: "+ studentEntry.getValue()); %>
    
    <tr><td>



	<!--  <input type="hidden" name="hidden" value=<%=osEntry.getKey()  %></input>-->
	<label for="<%=osEntry.getKey() %>">Question <%=i%> : <%=osEntry.getValue() %> </td></label><td>
	<input type="text" value="" name="<%=osEntry.getKey() %>" size="150" placeholder="Enter an answer">
	<br /><br /></td>


<%i++;
}
i=1;%>
</tr></table>
<table>
<tr><h3>Datacenter</h3></tr>
<tr>

<% 


Iterator<Map.Entry<String, String>> iterator2 = dc1.entrySet().iterator() ;

while(iterator2.hasNext()){
	
	
	//sMap.Entry<String, String> osEntry = iterator.next();
	
    Map.Entry<String, String> dcEntry = iterator2.next();
    //System.out.println(studentEntry.getKey() +" :: "+ studentEntry.getValue()); 
    %>
    
   <tr> <td>


	<!--  <input type="hidden" name="hidden" value=<%=dcEntry.getKey()  %></input>-->
	<label for="<%=dcEntry.getKey() %>">Question <%=i%> : <%=dcEntry.getValue() %> </td></label><td>
	<input type="text" value="" name="<%=dcEntry.getKey() %>" size="150" placeholder="Enter an answer">
	<br /><br /></td>


<%i++;
}
i=1;%>


</tr>
	
</table>

<table>
<tr><h3>Virtualization</h3></tr>
<tr>

<% 


Iterator<Map.Entry<String, String>> iterator3 = vir1.entrySet().iterator() ;

while(iterator3.hasNext()){
	
	
	//sMap.Entry<String, String> osEntry = iterator.next();
	
    Map.Entry<String, String> virEntry = iterator3.next();
    //System.out.println(studentEntry.getKey() +" :: "+ studentEntry.getValue()); 
    %>
    
   <tr> <td>


	<!--  <input type="hidden" name="hidden" value=<%=virEntry.getKey()  %></input>-->
	<label for="<%=virEntry.getKey() %>">Question <%=i%> : <%=virEntry.getValue() %> </td></label><td>
	<input type="text" value="" name="<%=virEntry.getKey() %>" size="150" placeholder="Enter an answer">
	<br /><br /></td>


<%i++;
}
i=1;%>


</tr>
	
</table>


<table>
<tr><h3>Agility</h3></tr>
<tr>

<% 


Iterator<Map.Entry<String, String>> iterator4 = ag1.entrySet().iterator() ;

while(iterator4.hasNext()){
	
	
	//sMap.Entry<String, String> osEntry = iterator.next();
	
    Map.Entry<String, String> agEntry = iterator4.next();
    //System.out.println(studentEntry.getKey() +" :: "+ studentEntry.getValue()); 
    %>
    
   <tr> <td>


	<!--  <input type="hidden" name="hidden" value=<%=agEntry.getKey()  %></input>-->
	<label for="<%=agEntry.getKey() %>">Question <%=i%> : <%=agEntry.getValue() %> </td></label><td>
	<input type="text" value="" name="<%=agEntry.getKey() %>" size="150" placeholder="Enter an answer">
	<br /><br /></td>


<%i++;
}
i=1;%>


</tr>
	
</table>


<table>
<tr><h3>Application Development</h3></tr>
<tr>

<% 


Iterator<Map.Entry<String, String>> iterator5 = app1.entrySet().iterator() ;

while(iterator5.hasNext()){
	
	
	//sMap.Entry<String, String> osEntry = iterator.next();
	
    Map.Entry<String, String> appEntry = iterator5.next();
    //System.out.println(studentEntry.getKey() +" :: "+ studentEntry.getValue()); 
    %>
    
   <tr> <td>


	<!--  <input type="hidden" name="hidden" value=<%=appEntry.getKey()  %></input>-->
	<label for="<%=appEntry.getKey() %>">Question <%=i%> : <%=appEntry.getValue() %> </td></label><td>
	<input type="text" value="" name="<%=appEntry.getKey() %>" size="150" placeholder="Enter an answer">
	<br /><br /></td>


<%i++;
}
i=1;%>


</tr>
	
</table>

<table>
<tr><h3>Infrastructure</h3></tr>
<tr>

<% 


Iterator<Map.Entry<String, String>> iterator6 = inf1.entrySet().iterator() ;

while(iterator6.hasNext()){
	
	
	//sMap.Entry<String, String> osEntry = iterator.next();
	
    Map.Entry<String, String> infEntry = iterator6.next();
    //System.out.println(studentEntry.getKey() +" :: "+ studentEntry.getValue()); 
    %>
    
   <tr> <td>


	<!--  <input type="hidden" name="hidden" value=<%=infEntry.getKey()  %></input>-->
	<label for="<%=infEntry.getKey() %>">Question <%=i%> : <%=infEntry.getValue() %> </td></label><td>
	<input type="text" value="" name="<%=infEntry.getKey() %>" size="150" placeholder="Enter an answer">
	<br /><br /></td>


<%i++;
}
i=1;%>


</tr>
	
</table>


<table>
<tr><h3>Network</h3></tr>
<tr>

<% 


Iterator<Map.Entry<String, String>> iterator7 = nw1.entrySet().iterator() ;

while(iterator7.hasNext()){
	
	
	//sMap.Entry<String, String> osEntry = iterator.next();
	
    Map.Entry<String, String> nwEntry = iterator7.next();
    //System.out.println(studentEntry.getKey() +" :: "+ studentEntry.getValue()); 
    %>
    
   <tr> <td>


	<!--  <input type="hidden" name="hidden" value=<%=nwEntry.getKey()  %></input>-->
	<label for="<%=nwEntry.getKey() %>">Question <%=i%> : <%=nwEntry.getValue() %> </td></label><td>
	<input type="text" value="" name="<%=nwEntry.getKey() %>" size="150" placeholder="Enter an answer">
	<br /><br /></td>


<%i++;
}
i=1;%>


</tr>
	
</table>


<table>
<tr><h3>Authentication and Authorization</h3></tr>
<tr>

<% 


Iterator<Map.Entry<String, String>> iterator8 = aut1.entrySet().iterator() ;

while(iterator8.hasNext()){
	
	
	//sMap.Entry<String, String> osEntry = iterator.next();
	
    Map.Entry<String, String> autEntry = iterator8.next();
    //System.out.println(studentEntry.getKey() +" :: "+ studentEntry.getValue()); 
    %>
    
   <tr> <td>


	<!--  <input type="hidden" name="hidden" value=<%=autEntry.getKey()  %></input>-->
	<label for="<%=autEntry.getKey() %>">Question <%=i%> : <%=autEntry.getValue() %> </td></label><td>
	<input type="text" value="" name="<%=autEntry.getKey() %>" size="150" placeholder="Enter an answer">
	<br /><br /></td>


<%i++;
}%>


</tr>
	
</table>



</table>

<%  
t.closeConnection(cx);

session.setAttribute("ANSWERSMAP", map);
%>

<input type="submit" value="submit" />

</form>
 

</body>
</html>