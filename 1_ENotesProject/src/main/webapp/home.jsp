<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
UserDetails user = (UserDetails) session.getAttribute("userD");

if (user == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please Login...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
<div class="container-fluid">
<%@include file="all_component/navbar.jsp" %>
<div class="card py-5">
<div class="card-body text-center">
<img alt="" src="img/Enote_HOME.png" class="img-fluid mx-auto " style="max-width:300px;height:100%">
<h1>START TAKING NOTES HERE!!</h1>
<a href="AddNotes.jsp" class="btn btn-outline-primary">Start Here</a>
</div>
</div>
</div>
<%@ include file="all_component/footer.jsp" %>
</body>
</html>