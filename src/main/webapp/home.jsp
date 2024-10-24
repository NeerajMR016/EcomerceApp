<%@ page import="com.conn.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="homeheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Homepage</title>
    <style>
       body {
            background: lightblue;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #4CAF50;
        }

        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: white;
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
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        h1, p {
            text-align: center;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <h1>Homepage</h1>

    <table border="1">
        <tr>
            <th>id</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Add to cart</th>
        </tr>
        <%
        String userEmail = email; // Replace with the actual user's email

        try {
            Connection con = ConnectionProvider.getCon();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM product WHERE active='yes'");

            // Assuming you have a cart table with columns: email, product_id
            PreparedStatement cartStmt = con.prepareStatement("SELECT * FROM cart WHERE email=? AND product_id=?");
            cartStmt.setString(1, userEmail);

            while (rs.next()) {
                String productId = rs.getString("id");

                // Check if the product is already in the user's cart
                cartStmt.setString(2, productId);
                ResultSet cartRs = cartStmt.executeQuery();
                boolean isProductInCart = cartRs.next();
                cartRs.close();
                %>
                <tr>
                    <td><%= rs.getString("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("category") %></td>
                    <td><%= rs.getString("price") %></td>
                    <td>
                        <%
                        if (isProductInCart) {
                        %>
                            Product already in cart
                        <%
                        } else {
                        %>
                            <a href="addtocart.jsp?id=<%= rs.getString("id") %>&email=<%= userEmail %>">Add to cart</a>
                        <%
                        }
                        %>
                    </td>
                </tr>
                <%
            }

            cartStmt.close();
            stmt.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>
