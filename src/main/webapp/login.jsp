<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.cont
{
margin-top:50px;
margin-left:150px;
background-color:white;
height:400px;
width:900px;
border:2px solid black;
}

.para
{
float:right;
padding-top:20px;
}
fom
{
float:left;
}	
form
{
padding-left:20px;
padding-top:20px;
}
body
{
	background:lightblue;
}

}
input
{
width:300px;
border:2px solid black;
}
button
{
border:2px solid black;
}
.para {
    float: right;
    padding-top: 20px;
    text-align: center; 
    margin-top: -300px;
    margin-right: 130px; 
}


</style>
</head>
<body>


<div class="cont">
<div class="fom">
<form action="loginAction.jsp" method="post">
<h1>Login now...</h1>
<label>Enter Email:</label><br>
<input type="email" name="email" placeholder="Enter your email" required="required"><br><br>
<label>Enter Password:</label><br>
<input type="password" name="password" placeholder="Enter your password" required="required"><br>
<br>
<button type="submit">Login</button>
<h3><a href="signup.jsp">signup</a></h3><br>
<h3><a href="forgotpassword.jsp">forgotpassword</a></h3>
</form>
</div>

<div class="para">
<h2>Online Shopping Product</h2>
<pre>The Online Shopping System is the application
allows the users to purchase online without going
the shop</pre>
</div>
</div>

<%
String msg=request.getParameter("msg");
if("notexist".equals(msg))
{%>
	<h1>Incorrect uname or password</h1>
<%} %>
<% if("invalid".equals(msg))
{%>
	<h1>Something went wrong</h1>
<%}
	%>

</body>
</html>