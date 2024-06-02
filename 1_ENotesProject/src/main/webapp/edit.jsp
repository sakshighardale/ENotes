<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.DAO.PostDAO1, com.user.post"%>
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
<title>Edit Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%
	int noteId = Integer.parseInt(request.getParameter("note_id"));
	PostDAO1 pos=new PostDAO1();
	post note=pos.getDataById(noteId);
	
	%>

	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>

		<h1 class="text-center">Edit Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col md-12">
					<form action="NotesEditServlet" method="post">
						<input type="hidden" value="<%=noteId%>" name="noteId">
						<div class="form-group">


							<label for="exampleInputTitle">Edit Title</label> <input
								type="text" class="form-control" id="exampleInputTitle"
								aria-describedby="emailHelp" name="title"
								required="required" value="<%=note.getTitle()%>">
						</div>
						<div class="form-group">
							<label for="exampleInputDetail">Edit Content</label>
							<textarea rows="10" cols="" class="form-control"
								name="content" required="required" ><%=note.getContent()%></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Edit Note</button>

						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
</body>
</html>