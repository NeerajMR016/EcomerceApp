<%@ page import="com.conn.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="homeheader.jsp" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="width:90%">
	<thead>
		<tr>
		<th>id</th>
		<th>Name</th>
		<th>Category</th>
		<th>Price</th>
		<th>Add To Cart</th>
		</tr>
	</thead>
	<tbody>
		<%
		int z=0;
	try
	{
		String search=request.getParameter("search");
		Connection con = ConnectionProvider.getCon();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='yes'");
		while(rs.next())
		{  
			z=1;
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><a href="mycart.jsp?id=<%=rs.getString(1) %>">Add to cart</a></td>
			
			</tr>
			<% 
		}
	}
	catch(Exception e)
	{
		
	}

	%>
	
	
	
	</tbody>
	</table>
	<%if(z==0)
		{%>
		<h1 style="color:white"; text-align:center;">Nothing to show</h1>
		<%} %> 
		<br>
		<br>
</body>
</html>