<%@ page import="com.conn.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
try {
    
    String cartId = request.getParameter("cartId");
    String productId = request.getParameter("productId");
    String email = request.getParameter("email");
    String quantityParam = request.getParameter("quantity");

    
    if (quantityParam != null && !quantityParam.isEmpty()) {
      
        int newQuantity = Integer.parseInt(quantityParam);

        
        Connection con = ConnectionProvider.getCon();

        
        try (PreparedStatement productStmt = con.prepareStatement("SELECT price FROM product WHERE id = ?")) {
            productStmt.setString(1, productId);
            ResultSet productRs = productStmt.executeQuery();

            if (productRs.next()) {
                double productPrice = productRs.getDouble("price");

                
                double totalPrice = productPrice * newQuantity;

               
                try (PreparedStatement updateStmt = con.prepareStatement("UPDATE cart SET quantity = ?, total = ? WHERE cartId = ?")) {
                    updateStmt.setInt(1, newQuantity);
                    updateStmt.setDouble(2, totalPrice);
                    updateStmt.setString(3, cartId);
                    updateStmt.executeUpdate();
                }
            } else {
              
                response.sendRedirect("mycart.jsp?msg=productNotFound");
            }

            
            productRs.close();
        }

        
        con.close();

        
        response.sendRedirect("mycart.jsp?msg=quantityUpdated");
    } else {
       
        response.sendRedirect("mycart.jsp?msg=quantityNotProvided");
    }
} catch (NumberFormatException e) {
    
    response.sendRedirect("mycart.jsp?msg=invalidQuantity");
} catch (Exception e) {
    e.printStackTrace();
    
    response.sendRedirect("mycart.jsp?msg=updateError");
}
%>
