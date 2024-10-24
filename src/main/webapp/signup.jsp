<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Signup Page</title>
    <style>
        body {
            background: lightblue;
        }

        h1, p {
            text-align: center;
        }

        form {
            margin: 50px auto;
            width: 300px;
            padding: 20px;
            background-color: white;
            border: 2px solid black;
        }

        input, select {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
            border: 2px solid black;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
        }

        h1, h2 {
            color: #4CAF50;
        }

        h1 {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Online Shopping</h1>
    <p>The online shopping system is an application that allows the users...</p>
    <form action="signupaction.jsp" method="post">
        <input type="text" name="name" placeholder="Enter your name" required><br>
        <input type="email" name="email" placeholder="Enter your email" required><br>
        <input type="number" name="mobilenumber" placeholder="Enter mobile number" required><br>
        <select name="securityQuestion">
            <option value="What is your first car?">What is your first car?</option>
            <option value="What is the name of your first pet?">What is the name of your first pet?</option>
            <option value="What elementary school did you attend?">What elementary school did you attend?</option>
            <option value="What is your birthplace?">What is your birthplace?</option>
        </select>
        <input type="text" name="answer" placeholder="Enter answer" required><br>
        <input type="password" name="password" placeholder="Enter your password" required><br>
        <input type="submit" value="signup">
    </form>
    <h2><a href="login.jsp">Login</a></h2>

    <%
        String msg = request.getParameter("msg");
        if ("valid".equals(msg)) {
    %>
        <h1>Success</h1>
    <%
        }
    %>
    <%
        if ("invalid".equals(msg)) {
    %>
        <h1>Something went wrong</h1>
    <%
        }
    %>
</body>
</html>
