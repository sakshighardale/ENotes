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
<title>Add Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>

		<h1 class="text-center">Add Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col md-12">
					<form action="AddNotesServlet" method="post">
						<div class="form-group">
							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");
							if (user != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="user_id">
							<%
							}
							%>

							<label for="exampleInputTitle">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputTitle"
								aria-describedby="emailHelp" name="title"
								placeholder="Enter Title" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputDetail">Enter Content</label>
							<textarea rows="10" cols="" class="form-control"
								placeholder="Enter Content" name="content" required="required"></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add Note</button>

						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>