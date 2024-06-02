<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h2>Registration</h2>
					</div>

					<%
					String registration_success = (String) session.getAttribute("reg-success");
					if (registration_success != null) {
					%>

					<div class="alert alert-success" role="alert"><%=registration_success%>Login<a href=login.jsp>Click here!!</a></div>

					<%
					session.removeAttribute("reg-success");
					}
					%>

					<%
					String registration_failed = (String) session.getAttribute("failed-msg");
					if (registration_failed != null) {
					%>

					<div class="alert alert-danger" role="alert"><%=registration_failed %></div>
					<%
					session.removeAttribute("failed-msg");
					}
					%>
					
					
					<div class="card-body">
						<form action="UserServlet1" method="post">
							<div class="form-group">

								<label>Enter Full Name</label> <input type="text"
									class="form-control" id="name1" aria-describedby="emailHelp"
									name="user_name">

							</div>
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="email1" name="user_email">
							</div>
							<div class="form-group">
								<label>Enter Password</label> <input type="password"
									class="form-control" id="pass1" name="user_password">
							</div>
							<button type="submit" class="btn btn-primary badge-pil btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid bg-dark mt-1">
<p class="text-center text-white">Note: If any issue then contact to ghardalesakshi@gmail.com, Designed by Sakshi Ghardale</p>
<p class="text-center text-white">All rights reserved @SakshiGhardale-2024-25</p>
</div>
</body>
</html>