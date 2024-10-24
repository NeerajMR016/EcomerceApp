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

        h2 {
            text-align: center;
            color: #4CAF50;
            padding: 10px 0;
        }

        form {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border: 1px solid #4CAF50;
            border-radius: 5px;
        }

        input, select, button {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            padding: 15px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<h2><a href="allproducteditproduct.jsp">back</a></h2>
<%
try
{
	String id = request.getParameter("id");
	Connection con = ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where id='"+id+"'");
	while(rs.next())
	{
		%>
		
	<form action="editproductaction.jsp" method="post">
	<input type="hidden" name="id" value="<%out.print(id); %>">
	Enter name:<input type="text" name="name" value="<%=rs.getString(2)%>">
	Enter category:<input type="text" name="category" value="<%=rs.getString(3)%>">
	Enter price:<input type="text" name="price" value="<%=rs.getString(4)%>">
	Status<select name="active">
		<option value="yes">yes</option>
		<option value="no">no</option>
			</select> 
	<button>Save</button>		
	
	</form>		
<% 	}
}
catch(Exception e)
{
	
}
%>


</body>
</html>
<%@ include file="adminfooter.jsp" %>