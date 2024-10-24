<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.conn.ConnectionProvider" %>
<%@ include file="homeheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>My Cart</title>
    <style>
        body {
            background: lightblue;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #4CAF50;
        }

        table {
            width: 80%;
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

        input[type="number"] {
            width: 50px;
            padding: 6px;
            text-align: center;
        }

        .update-button {
            background-color: #4CAF50;
            color: white;
            padding: 8px 12px;
            border: none;
            cursor: pointer;
        }

        .checkout-button {
            display: block;
            margin: 20px auto;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>My Cart</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            
        </tr>
        <%
        String email1= session.getAttribute("email").toString(); 
        
        try
        {
            Connection con = ConnectionProvider.getCon();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from cart where email='" + email + "' and status is null");
            
            while(rs.next())
            {
                
                PreparedStatement productStmt = con.prepareStatement("SELECT name FROM product WHERE id = ?");
                productStmt.setString(1, rs.getString(2)); 
                ResultSet productRs = productStmt.executeQuery();
                
                if (productRs.next()) {
        %>      
                    <tr>
                        <td><%=rs.getString(2) %></td>
                        <td><%=productRs.getString("name") %></td>
                        <td><%=rs.getString(4) %></td>
                        <td>
                            <form action="updateQuantity.jsp" method="post">
                                <input type="number" name="quantity" value="<%=rs.getString("quantity")%>">
                                <input type="hidden" name="cartId" value="<%=rs.getString(16)%>">
                                <input type="hidden" name="productId" value="<%=rs.getString(2)%>">
                                <input type="hidden" name="email" value="<%=email%>">
                                <input type="submit" class="update-button" value="OK">
                            </form>
                        </td>
                    </tr>
        <%
                }
                
                productRs.close();
                productStmt.close();
            }
            
            rs.close();
            stmt.close();
            con.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        %>
    </table>

    <a href="checkout.jsp" class="checkout-button">Proceed to Checkout</a>
</body>
</html>
