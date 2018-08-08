<%@ page import ="java.sql.*" %>

 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
    </head>
  <body style="background-color:lightgrey" align="center">
        <form method="post" action="questions.jsp">
        </form>
    </body>
</html>



<%
    String userid = request.getParameter("Uname");    
    String pwd = request.getParameter("Password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competencydevops","root","root");
   /* String driver = "com.mysql.jdbc.Driver";
    String connection = "jdbc:mysql://localhost:3306/client_db1";
    String user = "root";
    String password = "root";
    Class.forName(driver);
    Connection con = DriverManager.getConnection(connection, user);*/
    
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where uname='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
    	System.out.println("User Id ::"+ rs.getInt("uid"));
        session.setAttribute("userid", userid);
        session.setAttribute("UID", rs.getInt("uid"));
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("questions.jsp");
    } else {
        out.println("Invalid Login attempt. <a href='index1.jsp'>Try again</a>");
    }
%>
