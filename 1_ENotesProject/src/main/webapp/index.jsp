<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
background: url("img/ENOTES.png");
width:100%;
height:80vh;
background-repeat:no-repeat;	
background-size:cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>

<body>
	<%@include file="all_component/navbar.jsp"%>

	
	<div class="container-fluid back-img">
	<div class="text-center">
	
	<h1 class="text-white"><i class="fa fa-book" aria-hidden="true"></i>E Notes : Save Your Notes Forever!!</h1>
	<a href="login.jsp" class="btn btn-light"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
	<a href="register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i>
	Register</a>
	</div>
	</div>
	<div class="container-fluid bg-dark mt-1">
<p class="text-center text-white">Note: If any issue then contact to ghardalesakshi@gmail.com, Designed by Sakshi Ghardale</p>
<p class="text-center text-white">All rights reserved @SakshiGhardale-2024-25</p>
</div>
</body>
</html>