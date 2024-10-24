<%@ page import="com.conn.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newpassword=request.getParameter("newpassword");
int check=0;
try
{
	Connection con = ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"'&& mobilenumber='"+mobilenumber+"'&& securityQuestion='"+securityQuestion+"' && answer='"+answer+"' ");
	while(rs.next())
	{
		check=1;
		stmt.executeUpdate("update users set password='"+newpassword+"' where email='"+email+"'");
		response.sendRedirect("forgotpassword.jsp?msg=done");
	}
	if(check==0)
	{
		response.sendRedirect("forgotpassword.jsp?msg=undone");
	}
}
catch(Exception e)
{
	
}
%>
</body>
</html>