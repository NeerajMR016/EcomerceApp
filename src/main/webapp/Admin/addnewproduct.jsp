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

        h3 {
            text-align: center;
            color: #4CAF50;
            margin-top: 20px;
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

        h1, h3 {
            text-align: center;
            color: #4CAF50;
        }

    </style>
</head>
<body>

<%
int id=1;
try
{
	Connection con = ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select max(id) from product");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e)
{
	
	
}
%>
<h3>Product ID:<% out.println(id); %></h3>

<form action="addnewproductaction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
Enter name:<input type="text" name="name" placeholder="Enter the product name" required="required"><br>
Enter category:<input type="text" name="category" placeholder="Enter the product category" required="required"><br>
Enter price:<input type="number" name="price" placeholder="Enter price" required="required"><br>
Status<select name="active">
<option value="yes">yes</option>
<option value="no">no</option>
</select> <br>
<button>save</button>
</form>

<%

String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
	<h1>Product added successfully</h1>
<%} %>
<% if("wrong".equals(msg))
{%>
	<h1>Something went wrong</h1>
<%}
	%>

</body>
</html>
<%@ include file="adminfooter.jsp" %>