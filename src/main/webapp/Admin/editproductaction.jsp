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
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try
{
	Connection con = ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	stmt.executeUpdate("update product set name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"' ");
	if(active.equals("no"))
	{
		stmt.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL ");
	}
	response.sendRedirect("allproducteditproduct.jsp?msg=valid");
}
catch(Exception e)
{
	response.sendRedirect("allproducteditproduct.jsp?msg=invalid");
}
%>
</body>
</html>