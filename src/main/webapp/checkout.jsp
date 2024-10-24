<%@ page import="java.sql.*" %>
<%@ page import="com.conn.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Checkout</title>
    <style>
        body {
            background: lightblue;
            color: #333;
            text-align: center;
            padding: 20px;
        }

        h1 {
            color: #4CAF50;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Checkout</h1>
	<%
		try {
			
			String email = (String) session.getAttribute("email");

			Connection con = ConnectionProvider.getCon();

			
			try (PreparedStatement totalStmt = con.prepareStatement("SELECT SUM(total) AS total FROM cart WHERE email = ? and status is null")) {
				totalStmt.setString(1, email);
				ResultSet totalRs = totalStmt.executeQuery();

				double totalPrice = 0.0;

				if (totalRs.next()) {
					totalPrice = totalRs.getDouble("total");
				}

				totalRs.close();
				con.close();

				
	%>
				<form action="processCheckout.jsp" method="post">
					
					<label for="address">Address:</label>
        <input type="text" id="address" name="address" required>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>

        <label for="state">State:</label>
        <input type="text" id="state" name="state" required>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" required>

        <label for="orderDate">Order Date:</label>
        <input type="text" id="orderDate" name="orderDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" readonly>

        <label for="paymentMethod">Payment Method:</label>
        <select id="paymentMethod" name="paymentMethod" required>
            <option value="credit_card">Credit Card</option>
            <option value="paypal">PayPal</option>
            <option value="paypal">cash on delivery</option>
            
        </select>
					
					
					<label for="totalPrice">Total Price:</label>
					<input type="text" id="totalPrice" name="totalPrice" value="<%= totalPrice %>" readonly>

					<button type="submit">Place Order</button>
				</form>
	<%
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>
