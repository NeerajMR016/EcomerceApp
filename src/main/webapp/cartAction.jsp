<%@ page import="java.sql.*" %>
<%@ page import="com.conn.ConnectionProvider" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Checkout</title>
    <style>
        body {
            background: lightblue;
        }

        h1, p {
            text-align: center;
        }

        form {
            width: 50%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border: 1px solid #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>


	<%
    String email = request.getParameter("email");
    String mobileNumber = "";

    try {
    	 Connection con = ConnectionProvider.getCon();
    	 String sql = "SELECT mobilenumber FROM users WHERE email = ?";
    	    PreparedStatement preparedStatement = con.prepareStatement(sql);
    	    preparedStatement.setString(1, email);

    	    ResultSet rs = preparedStatement.executeQuery();
    	    if (rs.next()) {
                mobileNumber = rs.getString("mobilenumber");
            } else {
               
                out.println("User with email " + email + " not found.");
            }
        } 
    catch(Exception e)
    {
        e.printStackTrace();
    }
        
%>


<%
    String id = request.getParameter("id");
    String price = "";

    try {
    	 Connection con = ConnectionProvider.getCon();
    	 String sql = "SELECT price FROM product WHERE id = ?";
    	    PreparedStatement preparedStatement = con.prepareStatement(sql);
    	    preparedStatement.setString(1, id);

    	    ResultSet rs = preparedStatement.executeQuery();
    	    if (rs.next()) {
                price = rs.getString("price");
            } else {
               
                out.println("product with id " + id + " not found.");
            }
        } 
    catch(Exception e)
    {
        e.printStackTrace();
    }
        
%>



    <h1>Checkout</h1>

    <form action="processOrder.jsp" method="post">
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>

        <label for="state">State:</label>
        <input type="text" id="state" name="state" required>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" required>

        <label for="mobileNumber">Mobile Number:</label>
        <input type="tel" id="mobileNumber" name="mobileNumber" value="<%= mobileNumber %>" readonly>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= request.getParameter("email") %>" readonly>

        <label for="productId">Product ID:</label>
        <input type="text" id="productId" name="productId" value="<%= request.getParameter("id") %>" readonly>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price" value="<%= price %>" readonly>

        <label for="orderDate">Order Date:</label>
        <input type="text" id="orderDate" name="orderDate" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>" readonly>

        <button type="submit">Place Order</button>
    </form>
</body>
</html>
