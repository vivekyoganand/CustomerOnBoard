<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="bean.*" %>


<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="questions.jsp">

  
<%  

	String user = request.getParameter("Uname");    
    String pwd = request.getParameter("Password");
    String name = request.getParameter("Name");
  
    String email = request.getParameter("Email");
    String company = request.getParameter("Company");
    String crDate = request.getParameter("CreationDate");
    String crTime = request.getParameter("CreationTime");
    
    
 	 Test t = new Test();
		 Connection conn = t.getConnection();
   
   
   
   
    Statement st = conn.createStatement();
    ResultSet rs;
   try{
    int i = st.executeUpdate("insert into users(uname, password,name, email, company, CreationDate, CreationTime ) values ('" + user + "','" + pwd + "','" + name + "','" + email + "', '" + company + "',  CURDATE() ,  CURTIME() )" );
    System.out.println("i:::"+i);
    if (i>0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }}catch (Exception e){
    	e.printStackTrace();
    	System.out.println("Exception:::"+e.getLocalizedMessage());
    }
   

   
		   
  %>   
</form>
</body>
</html>