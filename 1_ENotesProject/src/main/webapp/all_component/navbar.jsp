<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.user.UserDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
		<a class="navbar-brand" href="#"><i class="fa fa-book"
			aria-hidden="true"></i>ENotes</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="home.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home
						<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="AddNotes.jsp"><i
						class="fa fa-plus" aria-hidden="true"></i>Add Notes</a></li>

				<li class="nav-item"><a class="nav-link" href="showNotes.jsp"><i
						class="fa fa-address-book-o" aria-hidden="true"></i>Show Notes</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">

				<%
				UserDetails userDet = (UserDetails) session.getAttribute("userD");
				if (userDet != null) {
				%>
				<a href="" class="btn btn-light my-2 my-sm-0 mr-3" type="submit"
					data-toggle="modal" data-target="#exampleModal"><%=userDet.getName()%></a>
				
				<a class="btn btn-light my-2 my-sm-0" type="submit"
					href="logoutServlet">Logout</a>
					
					
					
					
				<!-- Profile Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="container text-center">
									<i class="fa fa-user fa-3x"></i>
									<h5></h5>

									<table class="table">
										<tbody>
											<tr>
												<th>User ID :</th>
												<td><%=userDet.getId()%></td>
											</tr>
											<tr>
												<th>Full Name :</th>
												<td><%=userDet.getName()%></td>
											</tr>
											<tr>
												<th>Email ID :</th>
												<td><%=userDet.getEmail()%></td>
											</tr>
										</tbody>
									</table>
									<div>
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">Close</button>

									</div>
								</div>


							</div>

						</div>
					</div>
				</div>
				<%
				} else {
				%>
				<a class="btn btn-light my-2 my-sm-0 mr-3" type="submit"
					href="login.jsp">Login</a> <a class="btn btn-light my-2 my-sm-0"
					type="submit" href="register.jsp">Register</a>
				<%
				}
				%>

			</form>
		</div>



	</nav>
</body>
</html>