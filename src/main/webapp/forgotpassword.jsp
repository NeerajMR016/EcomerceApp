<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="forgotpasswordaction.jsp" method="post">
	
	<input type="email" name="email" placeholder="Enter your email" required><br>
	<input type="number" name="mobilenumber" placeholder="Enter moblie number" required><br>
	<select name="securityQuestion"><br>
	<option value="What is your first car ?">What is your first car ?</option>
	<option value="What is name of your first pet ?">What is name of your first pet ?</option>
	<option value="What elementary school did you attend ?">What elementary school did you attend ?</option>
	<option value="What is your birth palce">What is your birth place ?</option>
	</select>
	<input type="text" name="answer" placeholder="Enter answer" required><br>
	<input type="password" name="newpassword" placeholder="Enter your new password" required><br>
	<input type="submit" value="save" required><br>
</form>

<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
	<h1>Success</h1>
<%} %>
<% if("undone".equals(msg))
{%>
	<h1>Something went wrong</h1>
<%}
	%>
</body>
</html>