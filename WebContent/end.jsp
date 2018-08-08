<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="bean.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body style="background-color:lightgrey" >
<form method="post" action="logout.jsp">
<h2>Thank You! Your answers have been recorded.</h2>
<table>
<tr>
                        <td ><input type="submit" value="Logout" /></td>
                        
                    </tr>

</table>
<%
Map<String, String[]> map = request.getParameterMap();
System.out.println("Map :: "+map);

Test t = new Test();
int uid = (Integer)session.getAttribute("UID");
t.insertAnswersinDB(map, uid);

%>

</form> 
</body>
</html>