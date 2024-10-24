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
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: #333;
            padding: 10px;
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
    </style>
</head>
<body>
    <header>
        <h2>Online Shopping</h2>
    </header>

    <nav>
        <a href="addnewproduct.jsp">Add new product</a>
        <a href="allproducteditproduct.jsp">All product & Edit Product</a>
        <a href="../logout.jsp">Logout</a>
    </nav>


</body>
</html>
