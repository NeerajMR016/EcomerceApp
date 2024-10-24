<%@ page import="com.conn.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        body {
            background: lightblue;
            color: #333;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #4CAF50;
            padding: 20px 0;
        }

        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #4CAF50;
            padding: 12px;
            text-align: center;
            color: #333;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        a {
            display: block;
            padding: 8px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%

String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
	<h1>Product successfully updated</h1>
<%} %>
<% if("wrong".equals(msg))
{%>
	<h1>Something went wrong! Try again</h1>
<%}
	%>
	
<table border="1" style="width:90%">
<tr>
<th>id</th>
<th>Name</th>
<th>Category</th>
<th>Amount</th>
<th>Status</th>
<th>edit</th>
</tr>

<tr>
<%
	try
	{
		Connection con = ConnectionProvider.getCon();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from product");
		while(rs.next())
		{  
		%>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><a href="editproduct.jsp?id=<%=rs.getString(1) %>">Edit</a></td>
			
			</tr>
			<% 
		}
	}
	catch(Exception e)
	{
		
	}

	%>


</table>	
	
	
	
</body>
</html>
<%@ include file="adminfooter.jsp" %>