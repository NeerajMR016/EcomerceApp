<%@ page import="com.conn.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
String productId = request.getParameter("id");
String email = request.getParameter("email");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement productStmt = con.prepareStatement("SELECT price FROM product WHERE id = ?");
    productStmt.setString(1, productId);
    ResultSet productRs = productStmt.executeQuery();

    PreparedStatement userStmt = con.prepareStatement("SELECT mobilenumber FROM users WHERE email = ?");
    userStmt.setString(1, email);
    ResultSet userRs = userStmt.executeQuery();

    if (productRs.next() && userRs.next()) {
        String price = productRs.getString("price");
        String mobileNumber = userRs.getString("mobileNumber");

        PreparedStatement cartStmt = con.prepareStatement("INSERT INTO cart (email, product_id, price, mobileNumber) VALUES (?, ?, ?, ?)");
        cartStmt.setString(1, email);
        cartStmt.setString(2, productId);
        cartStmt.setString(3, price);
        cartStmt.setString(4, mobileNumber);

        cartStmt.executeUpdate();

        cartStmt.close();
    } else {
        response.sendRedirect("home.jsp?msg=productOrUserNotFound");
    }

    productStmt.close();
    productRs.close();
    userStmt.close();
    userRs.close();
    con.close();

    response.sendRedirect("home.jsp?msg=addedToCart");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("home.jsp?msg=cartError");
}
%>
