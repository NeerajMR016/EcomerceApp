<%@ page import="com.conn.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>
<%@ include file="adminfooter.jsp" %>
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
	PreparedStatement stmt = con.prepareStatement("insert into product values(?,?,?,?,?)");
	stmt.setString(1, id);
	stmt.setString(2, name);
	stmt.setString(3, category);
	stmt.setString(4, price);
	stmt.setString(5, active);
	stmt.executeUpdate();
	response.sendRedirect("addnewproduct.jsp?msg=done");
}
catch(Exception e)
{
	response.sendRedirect("addnewproduct.jsp?msg=wrong");
}
%>
</body>
</html>