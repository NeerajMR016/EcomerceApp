<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: ;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            text-align: center;
            width: 100%;
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: #333;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #555;
        }

        .search-container {
            text-align: right;
            margin: 10px 20px;
        }

        input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<% String email= session.getAttribute("email").toString(); 
%>
<center> <h2>Online Shopping</h2> </center><br>
<nav>
<a href=""><%out.println(email); %></a>
<a href="home.jsp">Home</a>
<a href="mycart.jsp">my cart</a>
<a href="messages.jsp">Send Message</a>
<a href="logout.jsp">Logout</a>
</nav>
<div class="search-container">
<form action="SearchHome.jsp" method="post">
<input type="text" name="search" placeholder="Search here">
<button type="submit" value="GO"></button>

</form>


</div>
</body>
</html>