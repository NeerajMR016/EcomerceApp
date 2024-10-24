<%@ page import="java.sql.*" %>
<%@ page import="com.conn.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String orderDate = request.getParameter("orderDate");
String paymentMethod = request.getParameter("paymentMethod");
String email = session.getAttribute("email").toString(); 

try {
    Connection con = ConnectionProvider.getCon();

    PreparedStatement cartStmt = con.prepareStatement("UPDATE cart SET address=?, city=?, state=?, country=?, orderDate=?, paymentMethod=?, status='1' WHERE email=?");
    cartStmt.setString(1, address);
    cartStmt.setString(2, city);
    cartStmt.setString(3, state);
    cartStmt.setString(4, country);
    cartStmt.setString(5, orderDate);
    cartStmt.setString(6, paymentMethod);
    cartStmt.setString(7, email);

    cartStmt.executeUpdate();

    cartStmt.close();
    con.close();

    response.sendRedirect("thankyou.jsp");
} catch (Exception e) {
    e.printStackTrace();

    response.sendRedirect("error.jsp");
}
%>
